Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B83324DCE5;
	Fri, 20 Feb 2026 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771625171; cv=fail; b=OoMEGUM9RMrVnl8ozK/azhWnzbo56gvaMXk9xRbz0D442tAtV1skESk7EwvJXpc2BnMbfEey236AVQOjR/QGsFksFkO1Mq+uknm0aeSLUJZDlwK2qGBE0bq5eKY9sFoRcI+E+69SYd65enD6gEfSENBBqOmTw7+iftej+/fhBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771625171; c=relaxed/simple;
	bh=wcq2fKSFSK2a6CZ+uksT4hCMO7mD2GDxnOCZTmc5fG8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MTZ5gYphVDhem1JlT2lZO9fPCWFDo6QyTKAWgGzx1yvssNJ4NkXpKbXJmj1KkNaOX0fqXNLUDJEC7oZTV874P23hElJtfMLQPODCsDXJgkJ2+pBmuVgGg+b0v3/AcXDizvhxqDHH8Tn4nnKFAJtSBsod+GJEUrnaJDXXsLg0VyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hTEblSGE; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hTEblSGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbdxLhklm/5/iIqnrcqX7BDow6E1TBUGZSNxW45KPuANdiDqI/2behbPduiprtmdIBL7ZeOCIP1/5WJw64BM9Lh9z8VdyzO51CSjoGYxUoCbwzsX37webIW0832Ptyuum/N5+QatIGb1jleD/CtcBBtGtXz/APUG4gxY1mP7IWIGELx0M3v5krtLnHBuu3988dMwWcXeD9F2wQ/S5qOTiDVspUXEvtmzRycyRIfz5a6PL44Jl4FTHYwykRjDvJsbhBW5vnt0i4b8tB3K8SY63mVO/CYqkeBzBXW+fis31/cY2x3hxyMsEOaBf68Mfkk5Qq7FgK3Lc974jD4TLv7E7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rqntcrh55D8Bxh5V70uZRFiA8BVpKILJHtIj5B5rgwU=;
 b=Wvom8EABKFAlYwbLs18zAaFTC/AcCX+CIAcXB5VxllBN0SppzJ3VUlmV+JRhbyAjmiHWowkVABIiNk81ErLfMtqeOVLtDREeLS/Ru2Z1hECxDUuoV3CKir7p21zOlGQyO+qOQDjrAPFvAhgozkx4wCCswHHODQsDRpvEoJsJga3THWpXT3kg6qZkUO4UxG9quG80cSkCIp1XEgYP1ZXTPo6exLk5J4t4eCrjZciGIhT7hK1UeFZNMjkZsAZxMEzE4iD1vKCbYLciy6B9WjtupkdKTOFfzVxEQ87NSA0wFYg43coLsbodY616ilhAtiSzvdu2IZu33H76Jr2bAhK0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rqntcrh55D8Bxh5V70uZRFiA8BVpKILJHtIj5B5rgwU=;
 b=hTEblSGEIANeQ6sxwfiLYsiK+CKxR4iM/MN5Y6ygltVhCDFHNi1cpfeYAgZGSx2AdMUtI/khODba/Js787Wdh2WD6aTabe5FfiKPAFZDRUvUM38BlWE057+JoiENqtfhJu+4tRN/kQ9eV6OnteGrsewh4c9kTOkq3d15UteO35NzsbO+Uses8ljl1Gb+H0jk6tqw8ikjQcmMEBfgZE/ay28Dnh9+lwwdmgsGI6sFtayUph25McTnsEIqLCfFU787pMYX64sNMSlBm9z2smuiJ7lyOA0b6aZaJ0PquSrfGC7xIeW/TACtmThdSjd+1pb+lGbWRWZMGi/2L933BBdefA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6543.namprd12.prod.outlook.com (2603:10b6:8:8c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Fri, 20 Feb 2026 22:06:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 22:06:02 +0000
Message-ID: <2ecea7db-814b-40d6-847e-7fc12421f36a@nvidia.com>
Date: Fri, 20 Feb 2026 14:05:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Tegra notes for Nova: [PATCH v4 18/33] gpu: nova-core:
 Hopper/Blackwell: add FSP message infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Vikram Sethi <vsethi@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-19-jhubbard@nvidia.com>
 <DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHDN7RWDOYF.1XZHUXB3WBOHI@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fa1c24a-890d-4f86-c230-08de70cc3c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFEvYmlOZWQxK21wY1p1OFZoMzNRdTdpN2d5SUtqVjV5Wmw5dmxvdkFOc29Z?=
 =?utf-8?B?d0o2aDhMSkZtUy9NblZiK2hadXMxZnpqRXZENVFNcVRJWWI4UkhVYU13LytH?=
 =?utf-8?B?eEZueUk1eXIxd1IyZFllRkNQRnQwWDhheTBVNkNiMzRhSm1GYnd3QXJ3dndq?=
 =?utf-8?B?aWVQSmQrdG1QVlByWUR5bkRkZXJiR1NHaGdkVWJpUHhST2llODBQa1NiUXls?=
 =?utf-8?B?c0dpbFp6Uk9VVmVPWHVNQlpqOGZGUnl6Q0h3MHVVUWprVE1GanNhaHRtODds?=
 =?utf-8?B?eFRQT1pGa2NlYmE4S0pRZ1pXbzZnMjd3NEpac2c4cmlRLzNhYVROSDZ1MmZm?=
 =?utf-8?B?akZ1SnRCaDBkRzdTcmtBUEdLalpBejQwNWtwN25ZNzBwNjZTQVZMdktqb0h0?=
 =?utf-8?B?SG43MTEwbG5WZGZQL2dyK0FiRW82REk3VW9wZ3hsWCtFeHF6SDRiREJLcW9F?=
 =?utf-8?B?R1paTHBvL3E0dzdjbklTRnRJNXNvVjNyMDVVUThRWnlxaHR2ZHkrMnNhZzBu?=
 =?utf-8?B?ODRBYTJQSHpHZ21QUzVEZmZHamVaMXhYdmdsUDBvRVpMY3A4RXNyV3psZ1VV?=
 =?utf-8?B?VkM5eGNMYVNLRVFiRml4dWNhelNiTlhWZUEzZ21YOEgxa3dqZ1hIa010Y0RC?=
 =?utf-8?B?TTlFTUsvMVNTQXJNVlQ5OTlXbVdOb0FCemV0b2xpbjc1VmsxaXpCbnhWTWlq?=
 =?utf-8?B?MUNDN010QzJvN3lxUVhvRE80dzdpOFVsa1p0R2VLUDkwNE82cXQ4bFJ6MFJz?=
 =?utf-8?B?aE94QU55UFFvRmlFRzJ5RmRmRmlwK1BMZHZQeG00b3JIUTgvZzdTODlkeDNO?=
 =?utf-8?B?b3h4Z0NLRWhValJma0ZuOFdkNFZENXJ2WmJ4ZWlPWkRtL3N2N1c1bHM3QmE5?=
 =?utf-8?B?MEJuSzVBOVJ0ODZGSEtqUTd3eDY5WWxLZnk0aThjZzg2alVkNHlhNzk4aHpZ?=
 =?utf-8?B?WWk4eU5lK0wrU3lpbklEK0gzS2ZYT2JkUWhDbnlHbmNZSzZuclllR1VWTWVx?=
 =?utf-8?B?ME1KT21Qa09lYkRtd2RVbVZXM0dkV28waUdOSmU5Vzc2QTZ6WlB2Q3A5WU9Y?=
 =?utf-8?B?WDk4ODFJTWJIMVRSenZUSFRKeHpQMmJLT3FFREhtZ3pWaFF5TFAxaDRJaUI2?=
 =?utf-8?B?OSsrU01LdVVvMTVCZDArMjJnNEFTc3BmWC9GeHc4WGNpOVd2T1pXblE0VmRv?=
 =?utf-8?B?eWJFbTBIYWxWeExkNHlNc3Q2THV5Y1NZVXNuTFkvU2l0SjFjZlptblVKMzY1?=
 =?utf-8?B?R3VqckRBMDEwRGo1Sll3REVEdFlZZURqbitSQzI4ODhqcFU3VTlaTi9PeEdl?=
 =?utf-8?B?bkljWjhKcytsTEtCdkdjeVJLUHZIbHc4UXBLdTlEaEYzRitOMXNvVDVSUG5k?=
 =?utf-8?B?NmJQZ21NdEJZRHlEZDN0Tys3T3NFd3MzUlpGdVFzMzM2Z2drSHR4K2lRUjhm?=
 =?utf-8?B?NGZHVHVVV1Q1UVFxOFpIZVRDMjJ1bC9LRW01ZTNqdGZpekQza3FET01iQ2Rs?=
 =?utf-8?B?T3RyZEdPV0t0c2NrT1pMR0Q0RUYxOXIyM0FaVW5YWDVVOFNlNjhHbWIwcjNJ?=
 =?utf-8?B?bG53TnhON05jQ2w0WlA0UVBQRmxrR1NmaG5hdWVPdkY1dytzbm05STNsSCsx?=
 =?utf-8?B?VW5mUCs0Zm0xQkxnTFhLQXBDMGNVK29TTVJOcUdCb25ENThVK3Yra2xxdVkz?=
 =?utf-8?B?bzIxS2JRTEt4QUREUGx3Qjd0QU13OFg2Wk00ZjBsSzN0MmtzMStBeHNaYWN6?=
 =?utf-8?B?Q0FyalBlY3R5WVQyNTUyUVlqNGRSVGFUY3ZlcjVLaWY2eFdnU2MybE5Ta3ZU?=
 =?utf-8?B?SUwvTUZwVUJRRVlCMHB5MnFzaEJjUFpEL2d5SlVqNjFTQUcyMGlrR2JHN1Bv?=
 =?utf-8?B?eU1pa1RHSVE2aFROSkdPc0FJazNySUZCVk1uUGxXMnQvV3Q1aTJ0eUtJREFL?=
 =?utf-8?B?OTlyd1FrUEFOemUxVkdFTGhYVmFHMFByQTVlU29hdTVFc0gyNGhLR09YRnZo?=
 =?utf-8?B?ZlV1d1E3WkJUTU5aRndPMW5OeEpLdnF4UmpkeG1TTmloZE1kMHVPNGxJSFJt?=
 =?utf-8?B?WEdsd1o0WlJCd0dGd0s3bWRvWDFHaWxMWVFHZDc4UU9LNFhSemtOUVQweVNR?=
 =?utf-8?Q?jFDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0NOa3NxRm8yeXBxRmhsS1dpRmVRbmVrZTNFTm5OVFF5ZHdiQ1ovOHlYUmlS?=
 =?utf-8?B?R0RDZXRKZmRDUTRCNWh4WGN3Y1Y4cm1ydjNacG5JRjhxNDl5ZHhsWk9FanRB?=
 =?utf-8?B?TGd4Y21mRFhxREV3RmhQbGhSdWp3Nm5rUmw0UnluZjRTMy9zck5kVE1WNmxV?=
 =?utf-8?B?eDgrSlN0ZDY3UmlneVMyUDkrZkFCY0g5dGVPZWR6bkJaRkpTQ1U3YTVUSTVh?=
 =?utf-8?B?VEtzbVdMTXQ3ek96MVVnTzdXZ3J5OWJRajVSaWxodVphdENCUERnZXV6TWc5?=
 =?utf-8?B?ajQ3WXpFQWgvbnhHN1lKNVp2d2RzZGV4dG5Pa1pZdWlIcGI2cWUxZHQxaVVT?=
 =?utf-8?B?amlGNUlGcXptMy9MbkU1azBsZXU0SVA0cFdObjF1TXFtUllDNDZUVFJwYmp2?=
 =?utf-8?B?SnJVVjg5SjhxVElpcTczdXB5ZzhlNnZMZTN4Ny8xekZRUyt2eURWa1VidWwv?=
 =?utf-8?B?TklVY2dzVmRoNC9WR2NyVlIxcjhqcmd1cktmdzl3Vm4zMDNkdUlKOXV2Umdt?=
 =?utf-8?B?ZkExYlVkOEFlYytSeDlUR1VxQ1VvK3pTaUxOQ2p3aDFpKzdQeVZrdGxkVFFt?=
 =?utf-8?B?MmNOMFgyZC84ZGFVYUNxQWdMdmZvSE5taEw2MzhyZnpZQ2RLZjFOU05uSUJE?=
 =?utf-8?B?RmdLMVJ0UmQyblZJa2ZDb2htdDFZVHUyYjdKM0dMTzlLblRJamRyWXB1VmFV?=
 =?utf-8?B?ci9PeG1PclN3RXp4R1dXNDV4aXJBS2NzZE9SS3hVUFlkQkZxU3puZHBPdE9W?=
 =?utf-8?B?c3hkaTZWZ3N5TC8zOHNJbVQ0eE5IVWZuZnc1c3dzSURpR2hEU2FZaDVXYXNo?=
 =?utf-8?B?VXJxNEd4SC9vQjY3YW85emk2MVVWemJ5T1c0ZytiTjRPUkp4SHEvMlRSc2FT?=
 =?utf-8?B?UHlUblJDRDNmR0lRcmhrZlV2bHhnL1p6TTVmMFc1ZW5IY1V1WWdTNnZoUTgy?=
 =?utf-8?B?NklLeG5vNDNXL1c1TWVNbDc2bTRnRGVDR1FrdXNtcWJpbXNHaTByMWsxdEQz?=
 =?utf-8?B?WnhwUldROE9qSHlkRnY1SGE4TU1mNGtudjE1UzhKMGxqcmFXbEdla2p6c1Fi?=
 =?utf-8?B?UlN6T1JxVnArWDFwRW5vbVp2WnErdzZ0NW4rd2U0dTF5OFBQd0cwOTZadDNG?=
 =?utf-8?B?U3lPVVA4MVRZL3VYR2pDUW0xMnFzNXl4Wk9Majc4REZYQjBEaWswMGtLU0dC?=
 =?utf-8?B?a3N5VlIxSHdXc29pUFVzMGZWUDREUTdSUlJTWU5sVG9iSGxxZW1taHpXNEJ3?=
 =?utf-8?B?MDNmMVhFV0UzOU9NcVZyTG5ZZit0dU1KNkhwWkozbDUxMWNVTmFnSHR5eVZ1?=
 =?utf-8?B?NEpjc3BkVVFBSmxnWkJUQnViUzQ3Z1Z0TDBHMUlwVlRMWW5ybWpCM0s5TlBH?=
 =?utf-8?B?MjM5NXdzSy96aFNZNnYvOWVyc1U1bW5VZFlMSitNdTFCWGpOUWlzLzRIUWdI?=
 =?utf-8?B?cnhDZkYxRlZtY3dKM3Y2YS9EOVdJbWFJQVo5dy9UYzBwdUdYazl4RFZLb2Ni?=
 =?utf-8?B?ZFE5Tkw5cDZUN2t2cHQzVUZadG1oWTNPMUFrZ0dWRlJoTzBHdWhqR2YwRE0z?=
 =?utf-8?B?b2hVYW9TZ3lCSFNqdHk4NWQwZGJvcStPVDZkVVJpTFJYNHA0dEY1RDVPYTA3?=
 =?utf-8?B?a2FCd2pEbUNKWEF6MzJlQXNNWmNncndUaUJPeTJBWXdYV0RzNFpjUUNhazNM?=
 =?utf-8?B?MHlZOEI1YVNFTTVjUlg1UUJiNFczTGRNKzQva3h5S2t0M2ZKa3FHS091Y0RD?=
 =?utf-8?B?V3AzN0R1aG5Lb1BXY0huNS9YOE1NQzhVMDNZQkY2UmNLRFJuOEp3eWVLbmVk?=
 =?utf-8?B?eEExV0RlemZTRHpoaU1jMGpaRmlrYWtDdGZieFBsVlhqUXZ2dTJObStDRVBr?=
 =?utf-8?B?KzdzL2xvYlNCeERuU05MeVR6RllIWkh3NWhnTGNnUlBHaktYdGFJNkEwd2FK?=
 =?utf-8?B?Y3BZSlVvUm5PaFd0Q2ZhL1poVmsxTE1ZRzh6V3A5TVN4K3hYNEx3VHpUUFNk?=
 =?utf-8?B?K1V0SEVIYWVXQTMwM1RJL3JVK09jS1ZqeUxURm5yZ0I2aVhQWVRrOThOck1r?=
 =?utf-8?B?SjQ1NlpMeWM5NzJhc2ZQTks3Qmh1aGt3YnppRE1IU2w4dnJFT1BLNjNKNzA5?=
 =?utf-8?B?TlpPZDNRL3ZtVmRyM0F1dUt2SHhCdjRBVTI1TnRydHo2bU9TM2xEUmJrOXVS?=
 =?utf-8?B?R29qbFh4NmFTWDJxbUYzUFZ5dmVkdG0wYlNnVUdoeWt0S3hSVVR4c2RtdFU4?=
 =?utf-8?B?aUE1YW9xdm5JNUZReFVLLzN0aE1Ic29hcHl5TVdpeUhKelVmeDV4RkNicUda?=
 =?utf-8?B?L1JDcnVUU2lpUWJ4UkFqYVpQVjhlOHR2cTdVMXJucnBsN3BWSmgzZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa1c24a-890d-4f86-c230-08de70cc3c96
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 22:06:02.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pV810K6OgydYUkgLy2ezbu2ZoBF5cgPSuMhBwApBwRj+QEtqfWx/HZuSLD6x6kOjW9wQn5uXC3p03RzL7U5Dfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6543

On 2/17/26 8:28 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>> +    pub(crate) fn send_msg(&self, bar: &Bar0, packet: &[u8]) -> Result {
>> +    pub(crate) fn recv_msg(&self, bar: &Bar0, buffer: &mut [u8], size: usize) -> Result<usize> {
> 
> Just a quick note, since I just reminded myself on this: We should keep in mind
> that at some point we have to replace most (if not all) &Bar0 usages with
> &Mmio<SIZE> as nova-core will also support platform devices.
> 
> I think Tegra chips with GSP-based GPU IPs have a compatible register layout,
> right?

Well...I'd characterize it a little differently. Here are some notes
from a recent discussion with Tegra, to help shed some light on that:

(+Cc: Vikram Sethi, to keep things accurate.)

Some Tegra chips have a Blackwell iGPU that looks like a PCIe device and
acts like a PCIe device, and has GSP, just like a dGPU (discrete GPU).

iGPUs don’t have FSP, nor a separate VBIOS, nor even vidmem. So the boot
sequence for them is different, but only from the first couple of steps
where SoC root of trust does the work of FSP, and boot skips any vidmem
related code.

Tegra display is sufficiently different (with several quirky variations
too) from dGPU that it's an open question whether Nova is even the right
driver to use for that aspect.

The register layouts for Tegra iGPUs vs dGPUs have been similar
(remember that similar doesn't mean "the same") since the Kepler GPUs.

thanks,
-- 
John Hubbard

> 
> (I will prepare a patch to address this for the existing codebase.)


