Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71E1E5207
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Apr 2026 04:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776227648; cv=fail; b=nrccBdjB49zFHhKYWBs4oVa9iqbHDPxcpTYyMNiq9GF8gXoBa/vwyaEQP1GbOzNZzEDSqTfZ49KiL6o7/gB4cN/YyZ0TVPoE6nG8y93LAgdwsbkQxnG7s+OTprbJhhtSx4y/ITiYGARn5tUNi/0qr88/WRSsQPa81iCBDt6Y/Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776227648; c=relaxed/simple;
	bh=bDpVaymiSr2EPUJT/Swkqmf6gTETSZZDCIoKcLAF0eE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VgWd3XFGIzZ3q6qDW9uVTV+C2iRmic7VdOuSHrvus9xB/CQAvPY9Sh37n+YHiBcfPyK2y/i2Wu/qSwfCFaysoXs9J2N+xnvWjjfxDCUQ5JmjWKAyB6HmtjYgI3v5GZrnumotUBc8GhAhptG9vMcZG4pDB1rZBAVC/m/Wr+Rf2uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P30TaNd2; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P30TaNd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJlykBeBFDu6qagLO+74/i49RICsCl0XPD7QRcnO2GFZz9GJPAcqUfpSjaGMGbAVMnQrGDCFB0SqtgpXZy2JIzx20fmoF4qv64T5lJSA836dlhRfZSs4eOJPf/2RH+uQBBoS7q/V6pLJpddErmACJgwbyGzT9UV+PQCz/yCsL96Jw4XUnz6zpSL3UUWYh8fbSuTANogvPiUvdXBjhmz284UwZi5qmz9TTwfAMSoSUcw42h3RpCBawgoiUjyjl9pa6ByEjpUfQZcxpXgWQ5VCLuuT9zppjfP7A7RJvMdIXQsxYFKbo2wj4egWx6FmQE9xvBVGf8XEf7735RwQJtkvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp7KZWY+rSmXAQ5SCEB3P3q7I3CVjpVlgvmrpX/w5sY=;
 b=bfdhzMp/kOPfvrjwEiM7FoZXon+Dk2b7bk3IIQ6GyDzLfPF6EnzQD1flyBP/9NyuvOnsVgJsBC/nBuaemYtLlLnTl6wEGuvKQoQTW4SnQwhEoCxekbXikKpc2V5MhpoJLp30K90BRCcYgxayzj+Ipgw5wDD2Q1GRK5Hq8rmcCim+DoBTmntNbks4Jyk+eqmkK45kP2nLbS+UYxb9tV5ZXufDHAiRpiy+RxzW9iQmMoCy774BThUr3T6W0+LSkq/xjQNZ8jTpDJMiOs2wX51v6NLWh+BJ8eQYBmNBT0681xe6QpwVUITDYJgoRekVIq5YS2uiYcz57dw5Y9jN9AUZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp7KZWY+rSmXAQ5SCEB3P3q7I3CVjpVlgvmrpX/w5sY=;
 b=P30TaNd26dJ3jej14CtCmbplhkwFdAMZL06ittj4BNBgHUpMLJNa3wr7heHtW5QmK1tU5q4Ew7aMvO0NVVQBJhEiPt3WRg5nhI/QFBQt7ekrybEFpERfzGpP8jWZofZuATsf0/AQC7gjR1Il0dRoaS3ti14C5zGf9c2Mo6ekPo0ms3iDxxsCjG/6kHwBhFvkUB3WtiKyfc0/xVw34GYS90IjZopIaENBvpqfdT68R+idvP1400YtZJOxv7vgLyaxyP5RZj+3R9L0gePh8V/ETy6v0O83kxwGoibE+N2IQKf17h4Sf4t8urCvYorSZYk3T15jLrcIdzDfYAemAR7QOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 04:34:04 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 04:34:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 13:33:59 +0900
Message-Id: <DHTG5CTHJCXY.2PPIJZF1VDUCG@nvidia.com>
Subject: Re: [PATCH v2 3/6] gpu: nova-core: only boot FRTS if its region is
 allocated
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260414235047.439322-1-ttabi@nvidia.com>
 <20260414235047.439322-4-ttabi@nvidia.com>
In-Reply-To: <20260414235047.439322-4-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0067.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA0PR12MB8301:EE_
X-MS-Office365-Filtering-Correlation-Id: 6614d87f-de4d-411c-5bbf-08de9aa838e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jzy4ax4VxDiiqrVLr1udpkYfra0oOKIdPU7YCZb4Di5FVJNyYL5HdQCmQPmaeWX9MXGGNKVyJyM8SGCxOdm3nb565JwV3fEY8hudalKFLzF73Ic5RvEEAMr7MmkfEHm9kCEmDiulOdB0AsB2ww06Cc4ix6lwQiMvVpX/SL5tnXh7AEie/kqhlzQcobyK0qYk715FcDUBNK/cT6d/5SvTw700WfZYfR7pZJiYBGFkPvjMeXpxuQgnhN2WkWEpTAHJPxzfy9HjzaPg41uqTJMzUAPRYQogX0sWGmRkWmxVzulRT8qDpMvEFmm//dA4CQULEayy04oBOWtmpG4xWRrHsHlGQcsMZp0YNrgNXzHddP7hEKo7ZBwhVrcrsIdwNvJdbgFJqiqEfYXA4YGEyUdL4B+PGDsZooZB3r4ChzC/FucsGuSNO4P6W0bPow2rTFvWSkZSNkZOiEvCC8EEoGyilOOHvNDG4Jp1ZywX2wGL5TPgB0fY48sKuVYWwKovwlWL8VortKpHQxEHdqYJZbcxTkdG58cRgnRVqEZCiVfDf8acCiXb8QqKAcOUQFEP2N5AsbycftyxTnPOcJCtRZXKZgEQEFhbN7sH3NvU4kyCBcxoXAKyhZQIKOaF+mT+QMgtwpl8dbXFhztQlmelIYkWnK2t9aAVPS3Tq3ybjicZfU22snlIaDgU9ceBRCmB3yKb4b7w83lmrBzbasKwENvqOipe8JPNGz01ZAL3vRe3r8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHdlUmhpTWt3dWxrUTJtbG1kaERndEMyd2MvSXR3RWtBdldRbFFBWWwxOXht?=
 =?utf-8?B?Q0VLSDZVSDVjc0RkNk5QVGI3WFJBaVVqV2ZVRURzTjJjb0JxSkQ3bjFsVGFm?=
 =?utf-8?B?cXE4bHozYUhiRXVUcWgwSjUxWVJ1ZTVSVE1pZkdjOG5USDdGY3ovZzN4TGVW?=
 =?utf-8?B?dU5EMDl0MytJTGFrWlp3VktUYVYxVklzZTBhZ2hqdHViSGdtTG82OVpWeXJp?=
 =?utf-8?B?M3lXZ0tBTmtTSlVLQUpvaGZGdVc2aTdISitzTDBzenhxQmpqTUcya2pzUXo4?=
 =?utf-8?B?dmdLZHFjajVUUGZoeFh4eW1ZcnRVRVVaSENSQmdmS1Z6TWJuS3VwaUprSTdm?=
 =?utf-8?B?TmRwTXZlTVBrNitUb2Y5WUxEbFhueWY0ZlJCdDIrLzlrWTN6cno4MVVzL1cy?=
 =?utf-8?B?dVBFUUQzcFhKaStaVXpIYm1DRGd1ZXRrZ3dwK1IzalRXa1hjckYwU29UM1FC?=
 =?utf-8?B?NFYySFFHUmVZZHNrYmF6UHlXQlVva2VXS0pseEpBZGJaTE92UVZtaTBJVUox?=
 =?utf-8?B?ZjZzYVdkSG5kMGZPYktKUGM5KzNnMkRiTld0Z1BkN1VqMnF5c3FZZkIwK29r?=
 =?utf-8?B?QS9xOWo5ejM2dDZvL2dCOVpLbGFHM2VqbDdNbmgxZVFTWnhwSUdtUDd3QjVo?=
 =?utf-8?B?dWc1K0ozOVJ5VTluOUdmRlovd0pLRnR5TFFESVJsSmJjSENmNzZ3RGV3SkVW?=
 =?utf-8?B?QURJZ0NmQW9pYmliUzlaaEt4S3Nua2FEUHZmUVRBR2VrOCtCWnpqK3BoSDBa?=
 =?utf-8?B?N2dWbjYrWWlTakwzQnZZK05wc29XaDVCZFpLaWpIa1ozNEc2eCtFd3h4ZEhv?=
 =?utf-8?B?ZkpncXh0eERTQW9lMzJUaGpIY01UV0grWGpTU3lIOEVOeFlORXlhVDN3YjY5?=
 =?utf-8?B?NUNqSThCRjhsSTJoSXpnY0RaYnRCZS9PUHdFY2NvZ1RvbzhyZ0JIa0Q4SHJU?=
 =?utf-8?B?dndoMG5LQ0RnRXZZT2xJeEsweTBEdVYrRnBkTVNHeTFuQmlWbExZL2ZMRFVW?=
 =?utf-8?B?T1Y4SVRzbWRFY241eXRuU29HdGFpdDYrdDhEM0ZJaElZRjVINmJGazJjVnlY?=
 =?utf-8?B?N0VXKzMyWUorbFE1WmRneWdKZVJLYTlqaE1sM1d3Zm5PU25MTGJ1Q3VxRS9u?=
 =?utf-8?B?aUk2U2lkYjluWU0zUnVZbHpWZEVEUXcrQ3JFaFd2ay90SG5XZDhNVCttaExh?=
 =?utf-8?B?cmtwT3Y0dGJGNm5KeTlqaWNhODdLRjBKcmRVdmMrNkVDMlJldWZWNnVYUHJR?=
 =?utf-8?B?ZHFySjNHWmhldWVSZlB0U2JES05VSUVkeEJLL2Q0cWVDZkRIdFFBVmpUcEQ4?=
 =?utf-8?B?SFJyRS9NKy84VGpqZkh3ME1vVUdXcEtEd2FZaVFmUTFVM0w5UHJsYTIwK1JM?=
 =?utf-8?B?UWh2dHlzbmFyUVdYbmZ4VnNXTG9GVWFJK3JKVlRoTnpiWlpnVHY1YnRRc0Y3?=
 =?utf-8?B?UDB5SzdvUzgySllKNVZTNW9MUHpJTm12bWNUaktpZDJzK0paZmtHejNodnlK?=
 =?utf-8?B?cG1NMTVJRVAxRlZZeHk2Z3ljbXpWemxubzZJK0t1SEtNZlFucGltdC9Faity?=
 =?utf-8?B?UVNvY3E1NjJiOXpMM0VzK2twcU1mRkZROUFlemRmVU1VanhtWkpEZENveFlr?=
 =?utf-8?B?OVlORzNZc0RtYU1QUXU0eFhRVzdGWDlDMTV0eisxYTRYUkhoZDNsNkZGVzQ4?=
 =?utf-8?B?dGdGV2VkTXcrc0F0V3lyT2NCQ1ltQWlSV3YxS2xIZEFxOXNxWTUyc1djUzRz?=
 =?utf-8?B?eCtvczgvUUVHaDhzUUkvNStkUWlPdjB6d093NE8xT3NsNG9aRmRMUmgzc3Vo?=
 =?utf-8?B?a2FiaEI2OEtwUWlSQWNkZmMrWEgyaTI3SXNKVzBSSWRtZ3YyQkh6Y3A3MURa?=
 =?utf-8?B?elExSFlDSDBHbmp1ejFZUVJNZkV1OXFVSit4anlzbTZLV0w2Y0M5WitiUStr?=
 =?utf-8?B?R2U4TU1HbUtoUERSN3hReGEwZi9XbS9jZnltVU5MZTBxaHYvV05DS0ZlazhE?=
 =?utf-8?B?c3EwL05VWDFiQTdsd2RkVUVnTm55UVlLR3JIaTFGMGg1MXo3R1QrUGFoUHVz?=
 =?utf-8?B?YnM3RXhaS0YxOTZEVzQ5YWI1dDRIRDVKbk10THIzRHdyZTNESGJwKzJNQzhY?=
 =?utf-8?B?ZVphRCswUXp4T2l4UnQ5VDMyaVUrdWluY2lqUDA0YnUxdXFqMXlrUi9qQmxE?=
 =?utf-8?B?eWhFbzhDUmJHemVBTkFNTGR3MUV2RGR2cFZJRkRHbTJFZitObVlmdWxDNTkz?=
 =?utf-8?B?a2lLMitheGhIdVkrOTNmNEd3c2hhUml3M1BCM1hudjlaK1k3emtrbVB1S01p?=
 =?utf-8?B?MGZ6bnZvTG9oNi9Nam1naFUxc2ZwL2NWKzNBSGhZS1QzS21aQXBjaS9qdkNx?=
 =?utf-8?Q?UsS+Uvz2W/bj01F0ZWLR/b4bNxsV1+14X+Ps9F6Rk5C84?=
X-MS-Exchange-AntiSpam-MessageData-1: dKRcuw8+hG4SvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6614d87f-de4d-411c-5bbf-08de9aa838e8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 04:34:03.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqCeA7fhQ+HK4Dv07jhpDlnT+BLBkJEfmed9XpXpU1sUJPaVANo02+xAp+N+Kij6c7vXopNE5vDMX4fVsCy6gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301

On Wed Apr 15, 2026 at 8:50 AM JST, Timur Tabi wrote:
> On some Nvidia GPUs (i.e. GA100), the FRTS region is not allocated
> (its size is set to 0).  In such cases, FWSEC-FRTS should not be run.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
