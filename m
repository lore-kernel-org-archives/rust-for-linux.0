Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013017.outbound.protection.outlook.com [40.107.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E172264A7;
	Fri,  6 Mar 2026 07:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781731; cv=fail; b=XdWk25YEInY5Mq2dxsue+kblb+w3ekLDMRIN+piLOCVo/vb7Ivv1Dn3FByO//IqcINiY7mFzOi0qWL5BzvkHe9AshjT1n8Fux03Zb/8+zeCGo96kf685x2pJEJ32bxwTqYc6US4t0LfGPZUPOgTlHnzYEPNK3yfa+XT+cmzx2R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781731; c=relaxed/simple;
	bh=tsFK8n8yGyRV2NUCTx+QJfS5xyyYdIIZebuqIB/71So=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fvw/EK99cvg8B0KwRdkVuZWE6qahqrKyuSav2dPsXgPTClsBbhW7AW6zzSHCBhufLueZeBv+ORW6ZZFTrsJAn7qeySHn3GFXNGWMOpKa1IewdrE6wY/pXEnRJ38K0lOPoYd5frJPmTHFfQ+1HcwiwrJ96enyzurp067Di/yrB3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oWt4MAVL; arc=fail smtp.client-ip=40.107.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWt4MAVL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehpZPOh5DRCGvdvH9hd+iibGekks7QNo252TIbI8GyTGPpgxxY6AA9kaphMqmwQXg5ZGyNuvcCEy8l+WuHhJAwPBivSw65XGvWPRYYs0NOnndzy1DkMojb1NNZrq5Itz9eXvTIZRC0sh8JiniDe0UtYKDp4z2Faai5ZxNko2H+gYK7Jv2Ite9oxNBOXD9GL/V6Xe956NtgtKY8pgJ8c4lW3dfM68xajbEPIWrR+diePHwQH2laX0CXrQgNNOtkJfQnOvKWNQU8ELkwsA1IMR2cMUMUDbUx1vva1rI/qv/Pc/3Xl4F408YOvK8fz0Ny7qXGbwQ4XC7AzuXHNjlPPzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dvl3LRY4pjQYS0vlKpnNzZrdmavDKTTJkcivhAjvNQA=;
 b=t8J0CIQlIn0lrThGUb5OYDbCEmunahIwezM6jFyEctcGe0eHhs4Hr42WTM73SUZpo6XWfw+yWjm2Le8VdYjhe9lPy69gmD4GgySGyHYe1J0pD9Jgxbz0DywEJulmQcz3rN8WehbevxrhWTm05IFHd4PhV89ysxdEOGch6HBlZnJjxPIK3wxhEv9Eln1Ykx+BcD7V8go4p9OlxTEC80z0xKBiPdntEssITL9iTRUAzIGjJp9Y3vnCv6g1UE258nde5xF//P3WoTEk2cmmWvY8XPGlAF6csybiHZzrmSfF4FBEqUiUbJe/PRB1rXdIqcvG/FSU99pmEJ38fUNtKJK+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dvl3LRY4pjQYS0vlKpnNzZrdmavDKTTJkcivhAjvNQA=;
 b=oWt4MAVLN8xFpnVKprsw+J3RSvJ8iuPQs5PfBgdT1OL2cufUfnlFs3hSYUeZnaLlIg/tRF76tbhWZwnUAdmkRkRyct98nhsxMGSYcuBVrWUPSr8FMGAAO6EMuQ3vYtuJaIvSqlrZT0WXlAoVjOd835iiQ4nZvvVC/tTnnXSOLNcGnPi+o5mAfLpVYQ5ZdRkvueEsshDuZaZAHkFU6TRItp7uR0BNTHh92B7BraCV/owRQ4bXzY1VRbc9YpNAJeu13irDhTTRV6E2fPY4QtwzWzCoCFq8gB4rvSuml3gki/6CVBWyR3b8OSzcGSkTY6poEGrwEchd78C96h0sjuk+bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 07:22:06 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:06 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v6 0/9] gpu: nova-core: gsp: add continuation record
 support
Date: Fri, 06 Mar 2026 16:21:57 +0900
Message-Id: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Qz26EIBAG8FcxnGsDDMOfPfU9mh4Qhi4HdVdd0
 2bju5fqoTZ6/Aj85huebKQh08gu1ZMNNOcx910J+qVi4eq7T6pzLJlJLjWXHOrQxnsd+m7K3cN
 P5XbdOJcgotM6ACvvbgOl/LWa7x9bHuj+KPS0HbLGj1SMts3TpVJeuUQSCNA0ylqFBCKRC9J6y
 2XgqNAKZ9mvdc3j1A/fa91ZrNjWTMiTZrOoeW2AGxcpIpJ+6+Ycs38ts1dulnvCnRGyEJJsY7R
 ABJ0OBOwIqc8IKAQa6ctHCW30sYX6I4CfLqIKEbgQSaD3Ee2BwD2hzggsBCThokFH0cE/YlmWH
 xmhVSELAgAA
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bae119d-9acd-4467-1038-08de7b51126f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	k2OWcmlfEgpguFp8BMoxAcwREDqhVBtZBRaYH7OfxJnrfIAgczUx/Iemeen5qRNdDTnMHUZUsOIOxCt+PjSGLqEFmICFm+iPEqluMmugMOsU7sqTp6EaRx6Tgt7qwxgjwH2PlJ6gG7qMdGmojYkhIFng/6b+6aHXSnqyvyaQqCqydkH0gcGCEzNTkGHTxF/ELF6WV0iBBzSFxQcNIA8hAezmQZQe7cWi6QLtnp98kIUnGf3sPNTFNyf/t0YCOR6FW2DWJvCNdfAxBN1G4m2eedZlKqnjs8ra8cItQaewBLVEi/QoXc758Ll9eWWEsg0D2G+SvSynQzlgfA0BB8hfsmRc/yzl0nBH6L80VSpGoi/j3CBkoB8nZJcpzNNI55wrqpzF3mt40OTdYJ6s86I/SV5UAKVoBpuoCmmuCW/XLxU+ud5+bRWf7oAOIAnrsjWriYltCgbhQZIyudqPD5I0N1mvff520/K/Asyt6TqfoI/eM52H8WKMdxRteHCBOymBZNK29RJVIZeyexZJZbSHJuMoFyk1zlhwbLv8yIR1pyJOu1mtevwZSL+mhTLYTDti/Q7kZGBH00zwfXGTJBLpdXASs7V8E8ZSTtpeUATd8jFtlDS35RIRGtZYUXQCiIsx22eEwMkw6G6uskcn5srRrDUWslUfDGIY5/6CsSDhRq2ljhl7dpo6FELOeibbbK0TamIIbUam9UKiUc7OGtTusoyYkAVQHbgu2jOihbsV+MjNwrgaPNq/QX2TTBa1RaGRRtOTT+bJgYXY/iXtvXPQxYt4iO9fQTjazrMPfafwGeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlFLQksrRHJ1b2hKTTg3enc1MlNkNTFhTHE3Y05XRGprK0tDOWVQYU1EVEZj?=
 =?utf-8?B?SzArSG8yWGg4Qy9Ldy9CSFlrRU95bXVzZUEvRFlFWGZmYTN3ZFZLTnlCZUpN?=
 =?utf-8?B?L2puVlFuVjJVd3E5YTVGY2dBZDYvY0RGYXhrYXlhZ29adGMzY1ZWeDBrZkI1?=
 =?utf-8?B?RWM0bmRYTks1N2pUZWdhMStFcWdkc1QyWFppS3MrVU1aNWxGRVVwcUIvUDBH?=
 =?utf-8?B?Ykc1T2FzT20vRW1KR3hzcmFCWWFYOUxQbDgvcldnSCt5ekMyYUlvY0JDRU9N?=
 =?utf-8?B?VjA2cG5QbzdQY2NMVU5lYlBKZzN2Q1hVWTdKTE1WM25kNUN1MVArcHpyVFp0?=
 =?utf-8?B?NlNlZEplbWZHRHp6NXRpTnVZb1g2Y3hHL05EQWhFdkdMUkcrWGY0dTJFNlR6?=
 =?utf-8?B?RTlvdjVqUmV0UXdJWkFjMjlsa0EvdWFBZG9XTEI4MVdDeHV6UWUrY0tQMi9I?=
 =?utf-8?B?ZldydTg2VXF2RHBFNlR3ZUsrK21KcnljL29QYlBrRlZQaXl0UGJ4ZjZ6WktE?=
 =?utf-8?B?dHF4SFU1K0VkdTc0RjVqRlZ1NnhhcUJncWJFQWRuUlVRb3RSdzhkR0ZmaHVM?=
 =?utf-8?B?UHRRbTZ6UXBpcGhaTTk1ejdyUmwwM1dGd3R3VjB5ait3YnhYdDlMR01uNVd2?=
 =?utf-8?B?ejRpeGx6QVdURlBzYjhqOXFkYWZJYnh6TTBRK3AybXNMQWJUeDhOd0JFbXNP?=
 =?utf-8?B?dzdGMnJKVUs3Z2RSSGkrT2dsK0NKci9HUUVmcmZpZ0pCUGZPbElUNHhTQmM5?=
 =?utf-8?B?QTV0U1J0S3JXdTVDM1IyclRxSnhEMlM3YjYwaUNkSjRSc2xYVE91d0xjVlk1?=
 =?utf-8?B?NWwvb0tQdk1sMGJEMmxFN2NXWGF5bmUvT1NTMTZadE9tSStHc0Vlb0N4WWRH?=
 =?utf-8?B?RmI3TDBueURTTFF2RUdadjV1ODZqMXlXcFFZVTY3S3NuaTNiWHNmeE9vcmdh?=
 =?utf-8?B?RjRhN296dm5hOUljZlJuekkrME1PK1pqb0M5YjlWd2U5a3J2MHdyNUhYSEpK?=
 =?utf-8?B?VVgzZ1VYZTdwN3NzeFVTeU1UNElnTzlzaDMxa1lYa3RCa3dUSk91aTZSdEsv?=
 =?utf-8?B?bDlvUDBNcGM5Ujk1WHJIQXhUcVBmMGNNRTFUcyt4VWkvYWlTN3hoMzhQdHJD?=
 =?utf-8?B?WmYrRG1BaWJjYVZwMGQ1ZE5qeWRHanBTR3RhRFhheWlpTHh0eXI0dCsySWhz?=
 =?utf-8?B?MWNLNVpwMmZhZGZJdjVtZnd6cTVqOFJ3OHRuUlJRMHh4bkVNeVV4VlZMbXVq?=
 =?utf-8?B?ZWhzSGUwS212TjdJaEZIN084YWd2Y0JCME9ETjFsSkR4ZFVjM2JKbnRVcDM2?=
 =?utf-8?B?QUlVcG91Ky9ZMUZiTGdNdWtPLzBCMktINkVuc1lVT25NaWRBWUJ5d09ROG1n?=
 =?utf-8?B?WThBbXhnSWZjekF5TXhGNDJxRmRlOEduS29EMmxZdFBheFlKaFl2TXUrMUVV?=
 =?utf-8?B?aEVySEM0cHY0c2RhckI3d1pNamxFeHhZYUlTellRT1YyNVJsK1duNG9xQ2s0?=
 =?utf-8?B?d2pBUEFOQ2orbWk0ZXFMMG5JRDllNlgzYlhqdUVlbS9BYXhkSmFNVWhrWjlV?=
 =?utf-8?B?K1ZRVWVJTTZvWC85TGVTb3o4c1FiaXdsUHJiejM1ZjB4eVpjQjhnNmd5d0Fr?=
 =?utf-8?B?cXcxdXd5a2lqU2V4YkFWSm9BaWJLaGhtT1A0bE5Xb1dZNXhQOXVBNlp0N1B1?=
 =?utf-8?B?aFlPeCtjLzA2REZqRllyY2VOU1Z2bk5NUWhYUUFnVFJrMkpZcVE0WkJOdXlL?=
 =?utf-8?B?aWFkaURJb0tuZm5ucDJnQlRWdmFTU21oTGE2M3ZJM3ZaUU5BYmYxMzdtY3A2?=
 =?utf-8?B?QkQzdHF4N0F1OTlueVl2ZnBSQVcyMVlhQnM5bHMxbyt1WkhNbmxxZ21PcWc2?=
 =?utf-8?B?Q3RkbzkvV1BKVnRPWStLeGUxT004aldyZTFJOGtzZ3V2OURFYkNFc0ZqUTZ6?=
 =?utf-8?B?TjlDb0Jic1RIM25RVUswTUFLbkZzTEFsTC9raW5Rd0VwQzNyeDE1OU54enVM?=
 =?utf-8?B?YXdmT2dzTnZIaXRVVzJjL0JHRlBHL3l4aTVhZU5TODlwY252NjdiUDk1NGRG?=
 =?utf-8?B?M2M2S0FuekxwL0tuYmZYY2NMaElxaVRnaHBOYURXL2JwUW9SUXVMclY5dGYr?=
 =?utf-8?B?MlhrZUFqRkNPZEQ0QXkzNmhPZWhEQXlHZHNST3RFQlE0SWRoZFpsK043eHlQ?=
 =?utf-8?B?ZFlqMVhpU0hzQ1JSSkZZZ2M0V1daYjRXeE0vMkpwVTgwNTFldktUckNkbVo5?=
 =?utf-8?B?UTZkM0pqYnRYcGF3YTBtOGtrQjBvQlg5cC96NzZEQkhzSmVCWDJnaEhkanVK?=
 =?utf-8?B?RE94Q2dBU0JndnRmSzB1L2dSSHdKRnUrTnZtK1Z5Nkx0dkdBdmhXNVRiZ2px?=
 =?utf-8?Q?JygYaue/aLSA6mkpNhtaC6DpvM3JCtXa3bPvxruIqnWbn?=
X-MS-Exchange-AntiSpam-MessageData-1: lzOUQbgUWU46yg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bae119d-9acd-4467-1038-08de7b51126f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:06.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGjaCVopJ9L9zJVXojzSs+YwY6kh++sGsHWUrwkC+ZzqSrFZFm1E1sctTNc2WzHgx6sylSDtTBnFnuk+V0n3FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds types
`SplitState` and `SplitCommand` which support splitting a large RPC
into smaller ones while transparently letting regular sized RPCs be sent
without extra copies.

The send pathway uses `SplitState` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v6:
- Renamed `size_in_bytes` to `size`
- Changed poll delay from zero to 1us
- Link to v5: https://lore.kernel.org/r/20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com

Changes in v5:
- Moved continuation module under cmdq.
- Made timeout into a constant.
- Renamed command_size to size_in_bytes and made it a default method
  on CommandToGsp
- Link to v4: https://lore.kernel.org/r/20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com

Changes in v4:
- Removed Tested-by Zhi on the ContinuationRecord patch, since it
  changed substantively.
- Incorporated Alex's design for SplitState
- Moved the continuation record types into their own module.
- Tightened visibility on continuation record types.
- Used non-zero sized command in tests.
- Link to v3: https://lore.kernel.org/r/20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com

Changes in v3:
- Rebased onto drm-rust-next
- Added some doc comments
- Reworded command_size doc comment
- Link to v2: https://lore.kernel.org/r/20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com

Changes in v2:
- Added doccoments
- Renamed driver_bytes_available_to_write to driver_write_area_size
- allocate_command_with_timeout merged allocate_command with timeout parameter
- Replaced hardcoded GSP_PAGE_SIZE * 16 with bindings
- Changed oversized command error from EIO to EMSGSIZE
- Added EMSGSIZE to kernel/error.rs
- Split WrappingCommand functionality into SplitState + SplitCommand enum
- Made max_size a const (MAX_CMD_SIZE)
- Removed send_continuation_record + added comment for type inference
- send_single_command now consumes the command
- Extracted command_size + used in SplitState 
- Link to v1: https://lore.kernel.org/r/20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com

---
Eliot Courtney (9):
      gpu: nova-core: gsp: sort `MsgFunction` variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      rust: add EMSGSIZE error code
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: add `size` helper to `CommandToGsp`
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for continuation records

 drivers/gpu/nova-core/gsp/cmdq.rs                 | 119 +++++++--
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs    | 301 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                   |  75 +++---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |   1 +
 rust/kernel/error.rs                              |   1 +
 5 files changed, 439 insertions(+), 58 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

