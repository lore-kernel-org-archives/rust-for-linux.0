Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE9A34251C
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766063614; cv=fail; b=Gz5VWFpw92AkUaf5mG5VkU39H8WpY5xid/wYTCNgIyCi4FqFjm4DkrOmEdfpsg2pFeR2q1XaVbyekgerUj2EwkZ3eBhACkbmokN0ujBnQ4BIinANmVw/8EkaIL5Ci8OaAbqnmWmyTnqwxgHfkusF4Np3Aj7e7I4o9FWnVSNyUy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766063614; c=relaxed/simple;
	bh=1qy3mUgk3qiiGCaoAZmfsZgNiUvGTtDY8PUyhLfC7LU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fNc8NU78+DWHza8YKqomRicwiKBu0gA94pve8BuO88WzZFhIfe2hNpqYMSQcH7LzjCSgg327jV9BlO9mopBoUeZupUnAc8S+sMvYIPEAv/qpnk1N+eRMgUno6GEdCqCAJnch0MT6ceFSP6eFUub/cG2rUowqlNK9ZwxVoR/JHWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DRRczgMw; arc=fail smtp.client-ip=40.93.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DRRczgMw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDj79EsAbbC48N+oYp4wIirIgh28sbiQKhEdHn7+laTpE3erQ1CahVaU9nfEVLpxXWHl1UdL/7t2VndRMlOmltByYRTHYes9tl5zd0CyZxR3JZDvugMxUd87qn2jjGKlX2xNvsKMEB00/mew5WJRVrzCjD+IpJGPadLaEZswZhDut+3kZOVbG39eLlLRLUel4v4DCbFgVVZpSCzK4g/rNGQ+1UsqojolmytqmOhEpi4a5lybsQl64hrEbrgopCBZzFao03afJ8oNHoltKZTaQCVZb1e0cA3ODjZX+q+t2DR2WYCwAsd2wARdrau31bBqWPfIyE4ATqOrd4bU2Vv15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5r0d5IEtxDxRK8Ih0MEJBgl163mUbjYbaCEcupI+8s=;
 b=brokvfwkhDpqj1tXY3/wgteta4eAmEHOenR1JSEY4gFblqD0lPQnV1Ed0Q5i+B6TTgl0vA2S3EQ/a1ER/yhHJSQcsK88/B0aqMnMPYsyZ0pRilJ0w+awB2HSU5+UtD2zOFxMGQfVRnecEHEx5groTStbYvNl9NGp7yxchYYVw1mGC/YJHfpsuhBnQP+3Havx1RStznttJm7+AvJUN1krFiH4B0ZVcuTMHTOjKOwG5U1PpLEetoz6armaEWlb6ZW6DSQZEyqroFqmjk8n7cqH/SS6oPC9fMmwJa0gebYnJ3B68Rk825Ur/UfSW9owYhVEca/B1TzjVLEoCx6gNnIZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5r0d5IEtxDxRK8Ih0MEJBgl163mUbjYbaCEcupI+8s=;
 b=DRRczgMweVIcOqjF6zIN4ieDcigj1flekqCPTgJkIj3xuHGuFNE2tS78T6bjjVRg41/ooS6FjkMSDA5ZJPeiHokUy2h2O3+SZIoJD+u4UVzaOLcL28bY0AoDD9Ipg7SjlwGb0R6O6Q73y44LszdM81aYPvbRlHZU6IN5zl6F/v9d3pqmlFsuApejFusV8GGQjFiWnm4ocBty4zKLb+hvtzJziW2Yu8KJDv4PZn9rKAkOqAeajF0UBN5FwAiGZgsG08FQAx3VceFyrMKrrWdHvHO57lxa6MxzlzZ1dfnrDM0GGUjEJvSST1wL/VtqIRBJf8dp6pP/eijwmDKyUVzzOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 13:13:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:13:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 22:13:23 +0900
Message-Id: <DF1DAR4ZZ9KG.3UE6JTJOOMULO@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v7] rust: Return Option from page_align and ensure no
 usize overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Brendan Shephard" <bshephar@bne-home.net>, <aliceryhl@google.com>,
 <miguel.ojeda.sandonis@gmail.com>, <dakr@kernel.org>,
 <acourbot@nvidia.com>, <daniel.almeida@collabora.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251204224006.353646-2-bshephar@bne-home.net>
In-Reply-To: <20251204224006.353646-2-bshephar@bne-home.net>
X-ClientProxiedBy: TY4P286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bd806f-385d-48cb-4296-08de3e373b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnpyYkJKdGQ2S3NsU1pIakV2Q0NmK05CWlFTQWhyNVZtMDh5cC9nNWI2enk5?=
 =?utf-8?B?UEZNNHR0dDE2NmlRZ3BlbStrWUVmNFlNd2thWVhXd0lLTkhORnBnQ2dDK2F5?=
 =?utf-8?B?dXRJam02UG1oUkRvQXFNMzVzWHc2Y2h3WnpTTzhTODByV095STdjeXhxc0VR?=
 =?utf-8?B?S09QY1NFNlpmV0lsbTQ4eGFmYlZvek9SS21wQVZtb3FBeXIwUmlNYkVnZ29x?=
 =?utf-8?B?VVhzOXZ6SXVFeHhyYmFOU1h5Z1BjNnZ4Wm15RzloMXpCTFRNRVpoS0JPYlgr?=
 =?utf-8?B?NUp6bzIxaDhDZlNTTjhERVlLaUlKc0c5U3ZFSks1VmFZcE5PNDRiREZSOXFP?=
 =?utf-8?B?OWZlbnVhZTJ1cDJhUW1heG1BQVFqY3pCeFdBVTEzVzdYYUljOHhhK2wybUJF?=
 =?utf-8?B?Wjk3RVNjWFREVFpIS0F3d1dlWUVJY2dyQkJVcy9PQWNpSk1HOTFjcXhDRkln?=
 =?utf-8?B?Ylk3a3YvTWQvT01XZ0Z6VWUzUnlkdWZUTjJVc0hXWm5OMm5rbEZqODFmQlBV?=
 =?utf-8?B?WUlpSk1hUTFZUVY5em44SVNJNktXcElXYnVjN0VJSW9mUEh4V3FvT3dJUTdx?=
 =?utf-8?B?czNneEpOcEdHYjdBSEpvc2ovYVZKV01CdHhLV1JSMWEybFRPRmRndmJ3THAz?=
 =?utf-8?B?NENrTFNQTFlIRjU2djhCVzdaUUZzbG5hZzhCYjBGOUU0Nnp0b2ZjUW9qaERV?=
 =?utf-8?B?d1Q5akhWdHhyd3JRZlpFMnJRdktCQWxjQWdFYmtaZzZLNjc3a1k3aVBCbHZG?=
 =?utf-8?B?VXh6U2dTQUs2dXRNOUNLT0xZWWxVeTJPUjMxa1gzM3VHTFQzQUl4V0tCUUZT?=
 =?utf-8?B?QjlzNkptSzlhaUs4QUhHVHIyT1p1UzdLMDhGa28wNTcwU1VQUDVJTG0yV0xR?=
 =?utf-8?B?clRGN2xPMExoT1lrS2ZuNmUvbDY2RWF0VUZud1Rsd0daUXRyMFVwRUxFTVFK?=
 =?utf-8?B?ZTBZMERCbDlEeXFGWUNMMU5TbHFDYkdheU4rbHhwTFgxWWZva3NzVyt6QWRZ?=
 =?utf-8?B?OFVWUHd6ZURORW5laEw0ZjFHaENCTk1yZ1NVbUQ3SFhtWkdGMXh4M1RwblVW?=
 =?utf-8?B?UUJFSWRXbmMybjFXK0RQM0FINDFPdTJkWWdtNzg2SitJUHVtcTUvUjJ5eStp?=
 =?utf-8?B?c0xOV1JzbTQxaTJaazd5TDNtaU9hTHFtNVk1WXZvMkpTcjBjUGdJdytxMVVH?=
 =?utf-8?B?RU5YZzB0eWVncVpEYjZmUU5VSjVmZ3IzZ2lYRnV2ZTVpWUtEdzVHUTU5cTNh?=
 =?utf-8?B?b2srSWlvR2pEbVoweXpVSEJkN2ZJcTNENFdDVUEycWMzdldUYlJtM1U5dEFO?=
 =?utf-8?B?Zk1BRU9rdUswamU2MjAydTlpM1dkdkdzbHBzSFNEalBYcEFKQnBYYTZtUEZ1?=
 =?utf-8?B?UnBBV3FTaVhiZjdta0plbWJwZkwzZTFLZTBvTHhjUUR0cVBrTVBMTFpUMVgz?=
 =?utf-8?B?WjdJV1pOdGFhd2ZrYnhhaXVPU0NWdWRsZDViMitxUzlFL2txWEQ2dmYvNEJ5?=
 =?utf-8?B?bGladG03RmRtamkzWFdXanNjL1lVSFZIeWVTa2szK2dVb1ZFZmtLeWZwSFAz?=
 =?utf-8?B?b2JCRGZKRmVMY0wzSXg3TThHUGdnRGtoZGNKcHJtQk16NFllNUNFdWFpNjZF?=
 =?utf-8?B?c2JpYmxmemdvVGlrYkVwRjVzTVNuWEZwbTJ1bjZJbzVZYVNKTTBrUmFoazlM?=
 =?utf-8?B?MjVTbzRjOUNmbjJzUVB0MTFNMWhINUpuTEVJQ01vOTdkcmZuZHZSeDBtZzkx?=
 =?utf-8?B?a3U0MzJkelZsd1FFSjJsNW9YZU9yemVFKzRzdmxTOGJZNnVyNFdXSC9ZUm1L?=
 =?utf-8?B?NFdSTGZmQis2ZHFqbm1FQm9PdnB5SjlKOWFkSm82M0RxMm9lYS9malBRWDA3?=
 =?utf-8?B?bmRXMFcrdjBUdWJSRFZJMjJLUDRlN1cydUp0RkRIeW84OG10aWNwckcydlpv?=
 =?utf-8?B?ZnZGN3R1YUhvK1EvdXpWL1h4MSs5anJNVG9jbDZUVFg2amIrSE1OMGp1Q0Fx?=
 =?utf-8?B?Mmd2NXVya293PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjB6bVFNWjVXaUJ6cFNWTlNtenFJV0N1cXhFOXBKU25La1ZKVVhGTTk2RnBh?=
 =?utf-8?B?Vzg4c3NHNjhycHdNNlkxWTBBTTlFbm5mNDlPa3N6amVZQ3dDZ1RReThncmpz?=
 =?utf-8?B?MXRsdXI5azllcXlSK1NFaUhJOE1wOFFBdVRsZ3c3M0ZxYk44cW1DK0M0UU1o?=
 =?utf-8?B?dGVuT2FsN1NpTlpWUGdrTTlXQ0MvNHpVd2NObi9OeDRnckY0NC80bVFEQ2k2?=
 =?utf-8?B?QktTK3RLV2o5ZU5vZ3lhc3F5bkYvMFhKdS9YcDZxS1hIcXltRG1wMXBDRTF2?=
 =?utf-8?B?enJKbzcvb1J6QU9sd2xBckFVcjBYNlpYdHdLN08wSGFtQW1TWmdYS3hLVHV3?=
 =?utf-8?B?K3M5SGpKNmdIMlZGN2ozZ1JDTTNLanV3MzdRODA3TmxGVjRVbVNkcktJOXBJ?=
 =?utf-8?B?UkJRQTBoVXFTSkVCcHZhWkxGV1psOU5nWGxQZjIwU0VSWmxEd1FMd1NEakhZ?=
 =?utf-8?B?SkNWU3NZcTc4NzJmNVo1cDhXZmtxejFhaStyaGg0TzRxQS9HTWdMcDNzWmZZ?=
 =?utf-8?B?LzFsVHZJNGNXbkNMN3ZpWmJXMWhPeEN2VG1WcmY3K3BEaE5lNk92MkNZT1di?=
 =?utf-8?B?MzgvWFEwN2U2RUFwUDNXVE1WQ0ZVRXJaeXJMWSt3aVd1UXRvVjFlazFpT1ZE?=
 =?utf-8?B?cmtmUlYrSi95YjA1QXlyRGR6TDAyWk1MbUNsbm5CTVZUaG5IdXhjc2JiR0U0?=
 =?utf-8?B?dFMxOHdTVW9pTG9ORU5NOWZVeWZOcm9mNHdBbW1qdFQ5T0g2Z2o0OThlQjZB?=
 =?utf-8?B?UjI4Y2ZUV1BsY1dXMkxGU2JPR1NlSGNIeGZVT3VlUGFqaXdiUzhLMlJjaFlv?=
 =?utf-8?B?eTdYRHZMZk42NVpFdDJYUUdxUm1SSGFGR2RLVk91bjZIK1greXBPUjlERFk2?=
 =?utf-8?B?bWh2MFpjQVpiSnUyM2dmdGRBaVN5WDdlRFlDSU12Y2hMa3VDU1pWK2tkRTN5?=
 =?utf-8?B?V0FxdEtWa3VlZlh6bkpCeUw4ZzlVSHRySnZxSk03N0RFNktUMEVvd3pTeWhy?=
 =?utf-8?B?U281YmNIS053ZmorTnd1MjlQb2QvVi9mMDNkZ3dDSnlHOTh6WGNNMVVxUkRG?=
 =?utf-8?B?TXNYWXhNanVrKy8rMkFSbUFmMHJaQ1J0VUZDSGNnUk5RODhkcklkbkl2dmpV?=
 =?utf-8?B?SXVrRi9QWFR6MzUzSUM0TlF2SFF6K3JlZ1N6OVQvQ0RUZE1iSG5yWDEyeDVj?=
 =?utf-8?B?WW91d20yak4rL2RucEVKcWtYek5LTG1iQlF5R25FL1pMdFhJdG5WakVWeWlt?=
 =?utf-8?B?TFF4ZXVkMWVuNXV4WW13VXVNNi9ITzBpVnpoVmVmbWx5MkprVlpJeVY0QndB?=
 =?utf-8?B?NUxsMmxxTmNRZ1BrZ3VMb3NJSnJXUnVZL09Pejc3SXF0NU5lT1BENFE5N0R0?=
 =?utf-8?B?OTl6cVdSNWxqK1Q4VjRtaTQxUHY0MzJYMG1pVm83eTAwcnphQmhXRkZGaFFu?=
 =?utf-8?B?N1ZBWk9iSkh1MndnRDBMN1RncitoczJLcWoyb1N6TUZ0OWJubjhlejNvNjVV?=
 =?utf-8?B?VytkWWhNa1d2SHpLeE1XbHVXbURYS1EwUkF5dzdxUXV2WXpxb3d0Q0doVzJK?=
 =?utf-8?B?U1VZL0JaSVFLODJObUcwQkp0VFRNbHcrMHJiMC85bFhMQ3l5NkNhUHFyU0RZ?=
 =?utf-8?B?ZXdCaFp5V0kvcjI1ZnUvenFNSWVmMXg5Tnc3NmMxWjRsWGNGbVJsODlTd2U5?=
 =?utf-8?B?dm9uelVkb2dTOWNKS1RBYmhUWXZCbWg5bEFPcHlWbElMQzh6TDFQdHFVem13?=
 =?utf-8?B?aE5GelRueW1VaUxzdnJjdzkxK1hJMlZwMlBvUk5kV1J2TXRqQ1JSSGh3Z3pK?=
 =?utf-8?B?Q2xrMDk0a2tES21xWlFrckdpazhxSEdEdFRvMmYrK0JwYUhHeUREcDJNYThD?=
 =?utf-8?B?TlB1QnhYTDQzSXRYQXRUNGdtT2JvUEtqeDRNV2RnUWxzRnhJWGlVak04L0hC?=
 =?utf-8?B?T3lENXBsYkcxMDdhQXlMUmIreERZM2E5aUpYUXFUS1J0bWpJc0hNbDh5ZElQ?=
 =?utf-8?B?ZDlNQzRYRFpyQmNIenBWNkRjV0pZN3ZPamFzZy92cDdvQVZBdEp5T3k0cU10?=
 =?utf-8?B?MWI2bWorcGxQUlZEM3p2NlNSSGIvcW05ZWk5NTUwVldheTV3NUl3NXNaWG5J?=
 =?utf-8?B?N3oxK0pBcVdYaGNCbGZpdTNEQVFSQVYwblQ3NGFCMWtLb09tcFEzSzIvWklB?=
 =?utf-8?Q?TfXUTbBU5BWCyKsESOQfNHsCxnr5RvQ3KfHTgKcrPqWj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bd806f-385d-48cb-4296-08de3e373b31
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:13:27.1972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMUyJMYPZXopdErCLJhQCiX50+P9xDDgdoe5mwFJCgLNXIWF3ne368Kf44HSgzKfz13zHBGbz1yb9hXD9tDJwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950

On Fri Dec 5, 2025 at 7:40 AM JST, Brendan Shephard wrote:
> Change `page_align()` to return `Option<usize>` to allow validation
> of the provided `addr` value. This ensures that any value that is
> within one `PAGE_SIZE` of `usize::MAX` will not panic, and instead
> returns `None` to indicate overflow.
>
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> Changes in v2:
> - Reworded commit message to follow the imperative form.
> - Expanded the documentation to explain the `Some` and `None` return case=
s.
> - Added a period at the end of the documentation comment.
> - Link to v1 (and v2): https://lore.kernel.org/rust-for-linux/aSheTh-T1or=
oAUHR@fedora/T/#t
>
> Changes in v3:
> - Fix documentation layout for better rustdoc rendering
> - Add doc examples and doctest
> - Ensure function is always inlined for performance optimisation
> - Restructure function so that early return is the None case and the
>   default is the happy path.
>
> Changes in v4:
> - Fix rustdoc missing comment (//) prefix
> - Rebase on master
> - Link to v3: https://lore.kernel.org/rust-for-linux/aSoY31U3uDI2y7V1@fed=
ora/T/#u
>
> Changes in v5:
> - Use kernel `PAGE_SIZE` for all doctest examples
> - Backtick the backtickable words in example comment
> - Add new example for `usize::MAX` input value
> - Newline before # Examples
> - Link to v4: https://lore.kernel.org/rust-for-linux/aSzDj1htLp11eCWF@fed=
ora/T/#t
>
> Changes in v6:
> - Simplified Doc text
> - Link to v5: https://lore.kernel.org/rust-for-linux/aS1qz6WjjP8E49pY@goo=
gle.com/T/#t
>  rust/kernel/page.rs | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> Changes in v7:
> - Addressed nits by Reviewer Alexandre Courbot
> - Link to v6: https://lore.kernel.org/rust-for-linux/DEOIMG7Z0J8B.3OOY2A9=
89T3G6@nvidia.com/#R
>
>  rust/kernel/page.rs | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a..3c94654b190a 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -25,14 +25,37 @@
>  /// A bitmask that gives the page containing a given address.
>  pub const PAGE_MASK: usize =3D !(PAGE_SIZE - 1);
> =20
> -/// Round up the given number to the next multiple of [`PAGE_SIZE`].
> +/// Rounds up to the next multiple of [`PAGE_SIZE`].
>  ///
> -/// It is incorrect to pass an address where the next multiple of [`PAGE=
_SIZE`] doesn't fit in a
> -/// [`usize`].
> -pub const fn page_align(addr: usize) -> usize {
> -    // Parentheses around `PAGE_SIZE - 1` to avoid triggering overflow s=
anitizers in the wrong
> -    // cases.
> -    (addr + (PAGE_SIZE - 1)) & PAGE_MASK
> +/// Returns [`None`] on integer overflow.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::page::{page_align, PAGE_SIZE};

Add an extra line to separate the imports from the code.

> +/// // Requested address is already aligned

Please consistently finish sentences with a `.`.

> +/// assert_eq!(page_align(0x0), Some(0x0));
> +/// assert_eq!(page_align(PAGE_SIZE), Some(PAGE_SIZE));
> +///
> +/// // Requested address needs alignment up
> +/// assert_eq!(page_align(0x1), Some(PAGE_SIZE));
> +/// assert_eq!(page_align(PAGE_SIZE + 1), Some(2 * PAGE_SIZE));
> +///
> +/// // Requested address causes overflow (returns None)
> +/// // The check asserts that `None` is returned when a value is request=
ed within one `PAGE_SIZE` of
> +/// // `usize::MAX`.

We can see what the check does by looking at it, so this last sentence
feels heavy and unnecessary.

> +/// let overflow_addr =3D usize::MAX - (PAGE_SIZE / 2);
> +/// assert_eq!(page_align(overflow_addr), None);
> +///
> +/// // Requested address of `usize::MAX` would overflow, and subsequentl=
y returns `None`.
> +/// assert_eq!(page_align(usize::MAX), None);

This test is basically equivalent to the previous one and can be
discarded imho.

I have checked the tests and rustdoc fwiw, and saw no issue, so this
looks good to go after these last details are fixed.
