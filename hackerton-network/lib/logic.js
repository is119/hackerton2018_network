/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';
/**
 * Write your transction processor functions here
 */

/**
 * 구급차 요청 트랜잭션
 * @param {org.hackerton.requestEmergencyBed} requestEmergencyBed
 * @transaction
 */
async function requestEmergencyBed(tx) {
    let x = tx.x;
    let y = tx.y;
    let results = await query('FindEmergencyBed');

    let found = find_nearest_emergency_bed(x, y);
    if (!found) {
        throw new Error('좌석을 찾을 수 없음!');
    }

    let event = getFactory().newEvent('org.hackerton', 'EmergencyCarOccupied');
    event.bed = found.BedID;

    emit(event);
}
/**
 *
 **/
function find_nearest_emergency_bed(list, x, y) {
    var result = false;
    for (let n = 0; n < list.length; n++) {
        result = list[n]
    }
    return result;
}

/**
 * 자율주행차 요청 트랜잭션
 * @param {org.hackerton.requestEmergencyCar} requestEmergencyCar
 * @transaction
 */
function requestEmergencyCar(tx) {
    let x = tx.x;
    let y = tx.y;
    let results = await query('FindEmergencyBed');

    let event = getFactory().newEvent('org.hackerton', 'EmergencyCarOccupied');
    event.patient = tx.patient;
    event.car = found.CarID;
    event.patient_x = tx.x;
    event.patient_y = tx.y;
}