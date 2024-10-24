Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B95167271
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 04:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729745741; cv=fail; b=U0r2kXHrcy+40lDCzfHkTR6K2XJ+VFiuTi4FG7/tj4ZQczSQgpAIK68BXSfaKWLs+wjr0hFXTOiRgOFGDRMFAcLW1LBZrZCPBNWHfMCppYX1w7Q6jr9zZZWI2JdP+0e4vCexeRnB8m3R7RVcM+lXJL2PzLKUU0NwK75QYVp4Efo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729745741; c=relaxed/simple;
	bh=0x9bJZwbLqfhQc0o7A+C5lhsScXS6vuAdB1zbUKezI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WIVIntGr6hM2eJd75vStgDk+jxT4HNI+S2/VRVz7+cLzKP+iumHefQkIVyxVkQY5gLDXr3FwL0hl4ieTb1CN6viVi4bfjk+RrkBQ4fxs2OGuA1LYMCyO7Ix6Mb8S0NI8z/an+PzN+VSp+oKVt7M7DDtRWpEKCpIQpoQC1CwPJT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=ez5g9G2W; arc=fail smtp.client-ip=40.107.104.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="ez5g9G2W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbdo8mr60+EDdKHqeTKc02hliGiozgl+EBDbHfUXW2ozbyBpPaBkLXGDdU3oz5fa/6Wnjp9M3oPitBgghb0VhcYbQgKwnjIPVytrZihTCAs9Enfa48SpRi+cW7DjSLV+b9p98cFweN4gTHfuT0WK9a4u5tz0UuWnqt2eInipSvN5Kj1W4HrDKj10SGUeTmWgPJYf9rDzOygiIZDIX4M67AotFrymISKSGLQjuhErxMh4GB540T3Wf0/ui+97OsqGdUZczePF/kXeo10RCBj9kTrzaFyXs6/QuikhLD1aRO40l6aC+PaQL4VA85Is25qugpfmSWhSy4jSbda6EDyikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I80w3mc35DudkQTkkOuhPu2g4aukpvDnjOJCmS5IT8g=;
 b=SmELOGWYTnCznDvDNWK+sltbaLDqzwP0xQdg/6CvLyMUgq7K5LgMHuhX0vRMGQ1HIg4X4NuDTCWg3ppnLBT4ffN+M2QzQ5j+TdyS7I5zvJBFCn0sLkHn8tDyk6Pxduk/1C/dZaRcZzr8Wcpddw1IkHgjy2qUZXGdB8EvyMOsKUkTyHVuNlC8BbVJE88o6fMiAi3yU+JcwDbig6bJI6UVN83/pMBXn84vpyc6X5gp2BXtnsJ+DPSM9giqmHdGNWZhPsJmwf5gGDdtdK/lMxnRmHJ8pkPU9SJuoq00IzGUIuFU3QqH51shjOYNBYCxYh/FecvpkQAdTV+CnXF7/vmCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=proton.me smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I80w3mc35DudkQTkkOuhPu2g4aukpvDnjOJCmS5IT8g=;
 b=ez5g9G2WQl/CPSCd57h0KB6hL1A3Grud+R0ILSw2SMMSzeXUYMFbh+ScOS1JBmsKByxot+2+JbIjUzq9kw9GsCAK1m1vxX7S9r+nTxJTPDnTNS5QfxuCQk0gULRHP47bazoSQrgkl1QSS5qZZDrjaewz7HZzAaJz6JS+GQBc7Xg98LPD4+PyP6SY8ZChViRaTnHPmS8Ps3QL3wqUuI6VgpQRJbBYj3h6hoIPOisF080qU2SOAdFWz2fd/JgDQnc+XYhTRII9JHp6nhFlLaXVycJEgVomPLpjpvR1m5IqjLgtAIoPO9TWQn5H1RKsWnmyAlHz3jfO+/X+bhu69bdZVA==
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by AS1PR10MB5770.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 04:55:34 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::b7) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 04:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 04:55:33 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 06:55:33 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2001.de.bosch.com
 (10.139.217.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 24 Oct
 2024 06:55:32 +0200
Message-ID: <6e74f5f8-67aa-40a7-92c5-fbf478cfdebb@de.bosch.com>
Date: Thu, 24 Oct 2024 06:55:20 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: types: extend `Opaque` documentation
To: Benno Lossin <benno.lossin@proton.me>, <rust-for-linux@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
CC: Nell Shamrell-Harrington <nells@linux.microsoft.com>
References: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
 <f7f65b97-2921-4a7d-b564-ff7479cad1ec@proton.me>
Content-Language: en-US
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <f7f65b97-2921-4a7d-b564-ff7479cad1ec@proton.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|AS1PR10MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: 497c8e16-b88b-4e21-3732-08dcf3e817f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmVXZFRpNnhmMm54c3MrQUJtb29nZkVTamZnWXhyWndqb0t2MlhHWXFhN0h2?=
 =?utf-8?B?NFNkaVcrMVZYMHJMWEt1VE5VYzFLN1d5ZGozblRUVEYvSVhEZVh3S2VHUjlR?=
 =?utf-8?B?SEh4dDZQaE05UTl2Y0IrMFQrZmdXeXJGQzR5VVFXSC9jbitWTFhjNks3UnN1?=
 =?utf-8?B?REg5a1dqV3Y4TjhLYlNEZUd1dXR3OGdDSklCd2ZUVjJBV2VhL1I4MGRZMDV6?=
 =?utf-8?B?Y3FldU1VTW83bStRcjlVc1dGQWpaOEFpTmJZR1JQbXVZcTFTMjdhZDBacUhp?=
 =?utf-8?B?cTczY1JzdnlILyswUGpKMVJqeExWRGhEZmdPdVJwL2t0aUxrUnNRM0hjRk0y?=
 =?utf-8?B?L2NDUGs4UkNZVUk2N3BCRGNnZkhKaC9pOWMxWEhNZnRPZUN4VkZTb01SQ245?=
 =?utf-8?B?dGpObVQySGJZQ3RkMHpwcHFSTnAzazkvM3hRTDhDSmpCYzNKQnVlYklzY3pL?=
 =?utf-8?B?Yk9hUE12ZEp1VlR2YkJhVG5KVGV5c1lsODRtN1pnZDRRL05EalhNelZLM0Jq?=
 =?utf-8?B?NDF2cjhRN0xJZHVpN1BNWEVHNGNtZ0JPU21rWFVNaFdyc016Rkg5TU10Q2RC?=
 =?utf-8?B?M1JiU2hFMmhpaGwrNHBSYUFacTF6U2U0NnhuMUZ5UlBlaVJiQThBUFRoUTA0?=
 =?utf-8?B?RjAzZUpxYnVGMy9uVFF2R3JhYWFmNkZ6M2kyUWdoSVdYNWRXcWRZVVpBeE1o?=
 =?utf-8?B?WldDRDNZcFc5dVdPQWY5N2FtbllWMUt6dTJNUEY3SmVMRkxsWjBvNFc1VGI5?=
 =?utf-8?B?YkZjWGZtemk5YkY3M3U4dEJPVTNKd29ZR3RTR05hcmNqOTU2YWw1dUZOTGNU?=
 =?utf-8?B?K2FtNzZQWHdqeTBNZExrbjgzNEZ0LzhvRVV6R1loemZtVXdyV003aE0yWTd2?=
 =?utf-8?B?d1JRT1B0MVJmNENzTVBUaGt2LzhwTGhIcjc3NnAvT3NnNkNOSlVyWWNGYXBz?=
 =?utf-8?B?Uy9QUG1YS0dHUW0ySlcrUTNTOVJOdDZvYjRaRXRjQmZ6RDV0YVVDdU8xUWhG?=
 =?utf-8?B?QUNxd3gyMXRpMFRrWk5BMmxNSDhpZmV3V0RXR1ROUVN6bDIzMHhNNTNEblF6?=
 =?utf-8?B?VXp3Tk5uN2srNkxyaTNCeWxMN213RWRWQzk3TDFONTk4Z3hsaWF4S0ZreEFO?=
 =?utf-8?B?c3hYb0NYNmhLZkhTMTlkM2ZmZXBxYWhYNExEZXhCNlY1NnhndUtURklnMGNT?=
 =?utf-8?B?T0dHMm43UVdCeFhPZHB3c3Z4Wk43dXZBREtabGJzbFl3TkFBL0ZEeVh5L0pS?=
 =?utf-8?B?S3JUVEJIc3BrNmRNTGx6azJRVGRmY3dPcnZORHhPQ2VDb1JvZVBqUFJqYzRO?=
 =?utf-8?B?WDczOHBzaW9ReERzM01BODl1MmZoZk5oY2haT1VCMzZhaEpheWdyVnZoZ0FK?=
 =?utf-8?B?QXlCeWdIYTNMS2pUbE91ZXEvNyt0bkYwZlViYlhDaDFIVW5GL1pHOHVaU0VO?=
 =?utf-8?B?cUtWN1BiUDN6eHNVTngrdmhUc21aOTE4cHRRTFJuVEFSNHFUY1lyWjBmait3?=
 =?utf-8?B?SFNFVGt4WFB4YUkvSFU1dlVKVzFFTitKa2xnN001Wm9zcVFiOGMxMVkzWlVD?=
 =?utf-8?B?dUN2R3gxQmxHRTgyRk1UQng4NGFLd01KSlB0bWZ2eHIydEt6TUtUckxWd1c4?=
 =?utf-8?B?TWU4SG5ac1VWM3g1eHU1cUxUQmIwdktTQ3dYWTNmK0JTYlQ4UURLYjBua2o0?=
 =?utf-8?B?MjVTM1lZbHlRZ3l2RlI3RTRyelVBeS94QS8vdmlOc3J6RGw5aTZxU21vakNh?=
 =?utf-8?B?ZE5tUDZRZ090cE5uMnVIbDMxSGNqVlNHREhnV0daT2V0N21hcm9zR3dLOW55?=
 =?utf-8?Q?THG81aQzME2QsYzQv59fUjKQeTO4kVtrJMwOk=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 04:55:33.8607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 497c8e16-b88b-4e21-3732-08dcf3e817f3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5770

On 23.10.2024 21:51, Benno Lossin wrote:
> On 02.10.24 07:03, Dirk Behme wrote:
>> Update the `Opaque` documentation and add an example as proposed by
>> Miguel Ojeda in [1]. The documentation update is mainly taken from
>> Benno Lossin's description [2].
>>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Cc: Benno Lossin <benno.lossin@proton.me>
>> Cc: Nell Shamrell-Harrington <nells@linux.microsoft.com>
>> Link :https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/What.20to.20work.20on.20next.3F/near/467478085 [1]
>> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/What.20to.20work.20on.20next.3F/near/470498289 [2]
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>> ---
>>
>> Changes in v2: Correct typos and formatting. Drop non-camel-case.
>>                 Add SAFETY comment.
>>
>>   rust/kernel/types.rs | 45 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 10e3b1a999f4c..5e96f2c46f9fd 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -290,7 +290,50 @@ fn drop(&mut self) {
>>
>>   /// Stores an opaque value.
>>   ///
>> -/// This is meant to be used with FFI objects that are never interpreted by Rust code.
>> +/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
>> +///
>> +/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
>> +/// It gets rid of all the usual assumptions that Rust has for a value:
>> +///
>> +/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a `bool`).
>> +/// * The value is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
>> +/// * No uniqueness for mutable references: it is fine to have multiple &mut `Opaque<T>` point to the same value.
> 
> The "`" should be in front of the "&mut".
> 
>> +/// * The value is not allowed to be shared with other threads (i.e. it is `!Sync`).
>> +///
>> +/// This has to be used for all values that the C side has access to, because it can't be ensured
>> +/// that the C side is adhering to the usual constraints that Rust needs.
>> +///
>> +/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared with C.
> 
> Miguel already mentioned this: could you add my Co-developed-by, since
> most of this stuff is from me. Thanks!

Yes, sure. I think I was just waiting for your Ack for that ;)

Miguel: Do you want a v3 adding Benno's CDB & SOB and the movement of 
"`" above? Or could you do that while applying?

Thanks!

Dirk

