Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011007.outbound.protection.outlook.com [40.93.194.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1335AC31
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Apr 2026 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419677; cv=fail; b=ndA/Em6s3qzwMFTVazSQ5lOG8rQfOtzLmigqVSBsI5/Bx/65mEoY6oDFZP5jG1iplGMUnRv7eiyRIYSfCEQyhxEbuRS8w9ZRabBEEQGkdA8BdTxdTxjRn6G/SoJrFUBLKtj4DADK/7zis1uCtRztwH1FL+k5fUdirbKfxVXRXNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419677; c=relaxed/simple;
	bh=QUHkNEgE54fye7W3cLb1A/js7Znr0JvJtEM+jclBEmU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=itTrFZG23xyGCOiMBthjto5ATPMHp6TZFeRPBbMH31NW1UGkrwknhH+4f7a6E4wGzi3q8qMQPZuVNc+cIv8BOZWol3Hv6vgJkl9S37iqioa2Lg2NKFtVeuIbmRRtgHkaWJaPs9g4HBQraW2Hwo/rkkKvpq5YKRNu5RoiotP+MvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tG/spTLT; arc=fail smtp.client-ip=40.93.194.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tG/spTLT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q494AN8VgyEeq0iIDVRynTknkJsS7tIdA8L6cy2IFqoqtGCGASkgwfYy5TFf+ZGpExJIy5Nser4neuCLuZben7qDVXAwmthO/ce5wOIM5afHLoW1jGZeoaSoz9vTCiGs0grlSdo/0JbA03mYZhdmr6xtfDJYt8r52c8+qP+AM61Ep7cW6jlIYQ+D4Y+7Zxcl00J1E5+o2Z9VJ3FiLHkJrXK5KQ1DAnyfsLw7sTUanCe04a6RgNWpyqzDEjcGb0wzMpstoVmmOwp2jh/RKwW4vkWYZ0mZyNOp4Mop0o/dy3FZw/Ha6dmnd2WwIF+5qmL3sWGlBpdwpbxRgiDYqyEy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=acCZrIPFF3CCKyQXRkGR90alZbZ5lX0hLpOiY0wyRss=;
 b=G0pO8Mds+yjTzCtVnEfODMIwKczQPN/pqBJ5lwaLpoBhEeTopLxEPStKGYkU+eYyct2Vv3y2mp+mlKvuZAoow4D8NGrAc5QOsAr5fpkt9GKEqBeCy2U6HKo8anpkcpgnAL+EbWo4nIU14GTEnHZLJ5JR/m6ju/HVQX+OH8tdK64q1WtWmxNwojXTQHH5rAwuyySb2jOZBAVC62Tjaunwl4tuhIKlnUPI/J2r/ud7h6kBDVICUZLTWs/VfcYZKCzKI6MgkPeboB8Bj8xnZY+ul1Kj2bMw5hCOx5M3oDByhYvyV24puu/fvV4giwRnD3QTRUnx//mM13JvGYngh05SwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acCZrIPFF3CCKyQXRkGR90alZbZ5lX0hLpOiY0wyRss=;
 b=tG/spTLTM9I3k/qHB36xIPlboypmFzH4kc0rNre5i/2t0xzzxeq5OdB+lH0y2mSNYrRQZqu9f24DSBboQcsjbaTG7gWyMQglCUL1HMoc6a46R9nwKdtjagsOon6FkPLClYNMnFN3aK7NqAOT6tj2LNTor4/HWdfCvNquwrrxep26jWGoE2gjV1dD1R4GNx7a0N++qhgraQByxTprmknpwYbUGik9PyVrr7AK2o4TOxHmJ/bLmkxtEKYFXXvSlECc8/CgO9i3W3Vc19bx4fjq/WBvLSY+uxQdmrpib5hB1kbPgT1ko2Um6sZ8tZMLiim1qpCFUKnUVrzDMr8K0Jg/LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 23:41:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 23:41:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 08:41:00 +0900
Message-Id: <DI56ONOL6ET1.C6F6WBG9322Y@nvidia.com>
Subject: Re: [PATCH] Documentation: gpu: nova-core: document the IFR header
 layout
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260408142132.3911466-1-ttabi@nvidia.com>
 <f86f2dec2c3b6198ec0d175bc69ad3cf8962cf3b.camel@nvidia.com>
 <DHV4SOWXL1YB.103OO4XT2QR2J@nvidia.com>
In-Reply-To: <DHV4SOWXL1YB.103OO4XT2QR2J@nvidia.com>
X-ClientProxiedBy: OS0P286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:169::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6b91e5-285b-4e4c-6ba1-08dea57f9cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LOGYr6jSYeB88nlj0b3syGnSHUlVEaRpLTAIb13KuwnkhgOHi+ni4lgFqIgIg0HDg7yZkTFIAu2uvfzhleNzOPeGwX5yMC6mX1TFu/JvCjARFfIMrsw1QWSrPzgDYiNXSyGhytf41F1YJZ3otW/Hu6UAlf6CeNxaoWh9IW5IFTXEZLJKDViI01+xti149kh+0VhPEkx1hlNojs65ke33PGcrPJphyaJ+aiighdhcgv3taJk01bxqHA2Z3s0i91caRhkyGf8mQnfIbO0M9LwfTkGiyjsW3MSYmaicUuC5h/yCoMSyfMWjNUGyUPTQTvzjkaJpDrv8f8a90IzQkJLKxPfnbAF5BgfJhyD9+cfUCLs5Lrbo/NR7+xhrTEdRGyW2SonybSeEwr8GTrqffbbJ7wrzTQYATxgGgEQUNR9h0yAqASNy3mISQ12DgMR+uZqk8Zw3vpItqmq+oF+4ECiTMsaAoh+rM+TfZ/6nDF6wIq1ApN9zVqPv2m0HFr4yOt7rx2JS1+iVz0/tfcsZwd+3t1UoPguLFhBrYGWQr781KTN4e6mhusxXNiHv9f505LG8pLv29Tbgn3AA92kcWjxdSiiPCTwLlEwcBfx1SPybX3mmg+zrKu40DmUrK/FnkgGyjzjrpA9AHlj+beCy+6RU2n6j0koZdn3xp7vVWtU6QQJcLF7UkXd3J4dUm4o32GjcmFSd19DkOGhUZ6vGLs3KG1laISrydo9EuWyDhlUt1YU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkIzekVLNEo1eVpkWXFDbU53RldsaEd3UUJHV2JPclptdWVrb1R5TzFYWTNB?=
 =?utf-8?B?dzFNNmVqdHJ4YTBoMTlXWHhzOHc2OGJkcHA4b2FWQk5nTFd3b1hnMWEwL0Ro?=
 =?utf-8?B?S1V1K3R4WXVmM2xXeWxmN1hJOG5vdEEyTDZjRlpvaW5qK2YvYlRNNzBMQWZW?=
 =?utf-8?B?WDU0YnRpVTNseVVXWUllQ3VMT1NqRzFCK21CYXZDbmZJbmJvcFdKUHNZYk1V?=
 =?utf-8?B?c1VKOGlaa0lTUlNQeW5YVDgwWG1oT3U2QXQxQ29taWxNSDVNbWtqcUplbnk2?=
 =?utf-8?B?Y1o0Q1UxWXd3RGFwS3lxYXg2bUhQNmlKVXowSXBSWTJxcFRqazN0T0hDR2tQ?=
 =?utf-8?B?RzJ1TFc5U2tDdnlETzFTSnRxY28zOVhYRzhCREtiMmZkcWV6S3h0UVFrNTNi?=
 =?utf-8?B?YnRnU2NQNmd1cVNONUlRdnlYMGZYalZ3Tk1LQkR6N3JKcXA5WTVTZTJUL3pi?=
 =?utf-8?B?U3pmSWJ6VTdwR0RFVDNTUUtqWkIvUlozRCtQSktzZFJTNVdkRkVZWUdzK2ty?=
 =?utf-8?B?K2FYcTU2NHl6emRDdVowaDVsYVJtTHVFS2h6clFlM3VqUE1GSUtpZ2hyd3hz?=
 =?utf-8?B?UHJtNHdBZDNtM251OUFGa0d4d3FycnlQSE11QmhHZDBOV1RJYzQrUDFnMnl4?=
 =?utf-8?B?RVMyejgxYzh6dmRFK2VkOHBwSklrYUI4RG5FeVFZNm5lVjhDOGo0L2NXZ0pJ?=
 =?utf-8?B?R0pSaEdCeGh0T003TnBsbHdmNnZ5V1g5eC8zVVNDbnp2WDRycktaM2ZuZ0s1?=
 =?utf-8?B?d2NqQWQySE1hN05TcGx1RGdWdDZ4VmhWNkI2NU13aXFUb1hNdkdQUnl5UThw?=
 =?utf-8?B?cjNwQVdzWTZSVWtWY0xNd0hGODQ2ZkVIUEVmbG5seWI5d0tkT0pmQ2c0dlNo?=
 =?utf-8?B?eVVBSG9Qa2RtaVhkZFJITkd2V3RyMjJ0Q3N3MmVYNnNYNmFhRGlmbC94QUkv?=
 =?utf-8?B?am1OR3hQVXIyZjlJNkpISUFaVU4vREVsT1NCZ0dISElnOG9SZ3pNRjlsbEtY?=
 =?utf-8?B?c2xzbnZiQUR4Vm9RV1VmV1RvSUdJbXNiTGsvRmFPUit2R2RqS3ZmUTAxSGQz?=
 =?utf-8?B?OFBhNXZjKzlUcVV3UzhNTEVpTXBwcGRPSGVHMHZUZWNFbUJhaGRMZUZqeGw2?=
 =?utf-8?B?eWFhMnBicTZOY3IzRWFNbEFvZTN5V2c0Mi9vVDZ3T1F5Q0lWZVpTUjFUSmF6?=
 =?utf-8?B?c1BZU2Zsa1F1WFJKWWJ6MEt5Qi85MnhyYmhlRDQxWFJkRVVVbVdnQ3UrU2dH?=
 =?utf-8?B?THo0TnFxdmRvZ0JBMmo1YlpBbHpQTTdBWVZ1Ri83b2J4dHZrRzlVcWdNbzRr?=
 =?utf-8?B?R015T2wwUVpvWVBudUQzWVhUT1ZNV1Y4NkdDd1JKQ2NhdjNVKzh5Um5qYzVi?=
 =?utf-8?B?RTJhR0dOOUhHNVdqVUhIOGM2UVVnL05lU3Q2SWFhMGVicUxkSTZHNTA0OS9j?=
 =?utf-8?B?SDBWU1FYZ2ROakcxQ1NaLytGdVdNbGdpSzROb1hVWThZR0tOMmZJS0pUd2lm?=
 =?utf-8?B?WlBIc283NG1YM1Nidm5pMTAyR2dUQ2drc0hoR1FPeDRwUGRVbVdEMHZVT3VQ?=
 =?utf-8?B?cS9pbHFGNUd3MFExSEMrcEVZT0I2aVlLd1ZWYmZ6TTVaN2htVktvYjRRWnF6?=
 =?utf-8?B?Sm9kUVpyUGdoYzB0WTJLU1NmWVpYZmdpVXNObjhqUE5aQ0I1aHVQamdZTm9W?=
 =?utf-8?B?TzYxTXBSbFF2ZjVLVVFQOU9WRTFLUGw1MG5WYUtPR2ExRmpoVFpFM2crNmZS?=
 =?utf-8?B?aWtYNjJNUGNpUGNLMktWOWdZZ3IyZGFJbkRCSTBEb3h6S096TnZmMkwrQWFK?=
 =?utf-8?B?UXEvaVA5MTBqaFZvUVgvK3VBcnpJdk16dTYwcmljbS8zbmdWcGdhS1F0Znh0?=
 =?utf-8?B?aFdGdEJMZFZxbmFGRnJTc2NHMlBGSUVlV0dEUU9KalE0V2ZzMzRvaU9VeHVQ?=
 =?utf-8?B?VTFvTVREYVRTWXFVclRSOWRwUkpOVE5nY1cxVU1jQWZJWDV0dStmRE1iZUtZ?=
 =?utf-8?B?MDFsMU1Ici9yNmhRbitCSTBnSGRyakdzbVpGTkw3cVJXQUxjOUNIZzljZjFZ?=
 =?utf-8?B?dm1HMFBBU2ZKaWRsRGx0V2ZVZjQrUFJQYXBzb05MRnQ3TEdFR0ZucVRtZDlY?=
 =?utf-8?B?OEVhMW91TzlYNzlDVFhrMnNYdFhXemxKdFh2Ly9uU3hkbFdNUGdyOVBBS2NW?=
 =?utf-8?B?cE0xR1dMcms2ckpINWZBNzM3ODNSSmFpYmc5T1ByM1AzdmlLaDhpeTcvNHVU?=
 =?utf-8?B?bngzelZnQWEvMnNTZW1DbEVuNXVrYjdHNVBWUTFHdWZMSFAxUjI1L1RIZjJJ?=
 =?utf-8?B?VUp4TGZXWHhyamV0bG9KaVhqMlZGRklnTXRocGhEdDZrbDJOd3lMSHMwSmZ5?=
 =?utf-8?Q?zubtK6IYCxMqePdYiX9nz56e7P9Okd6+ZNo0Ntc0FiT6b?=
X-MS-Exchange-AntiSpam-MessageData-1: XpF6HvCQ9pPkFA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6b91e5-285b-4e4c-6ba1-08dea57f9cf8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:41:04.8662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+SLqr/0E0qynvjPcxGbUAklaBhJsGQdsQBvHaqwjRkJLqSQzTg6BFEgad4J1E01a/2VwtqJcUHegre3TOi/Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

On Fri Apr 17, 2026 at 1:05 PM JST, Alexandre Courbot wrote:
> On Thu Apr 9, 2026 at 6:36 AM JST, Timur Tabi wrote:
>> On Wed, 2026-04-08 at 09:21 -0500, Timur Tabi wrote:
>>> +=C2=A0=C2=A0=C2=A0 Offset=C2=A0 Name=C2=A0=C2=A0=C2=A0=C2=A0 Fields
>>> +=C2=A0=C2=A0=C2=A0 ------=C2=A0 -------=C2=A0 ------
>>> +=C2=A0=C2=A0=C2=A0 0x00=C2=A0=C2=A0=C2=A0 FIXED0=C2=A0=C2=A0 bits 31:0=
=C2=A0 - Signature (must be 0x4947564E, ASCII "NVGI")
>>> +=C2=A0=C2=A0=C2=A0 0x04=C2=A0=C2=A0=C2=A0 FIXED1=C2=A0=C2=A0 bit=C2=A0=
 31=C2=A0=C2=A0=C2=A0 - Reserved
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 30:16 - FIXED_DATA=
_SIZE Fixed data size (offset to extended section)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 15:8=C2=A0 - VERSI=
ONSW Software version
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 7:0=C2=A0=C2=A0 - =
Reserved
>>> +=C2=A0=C2=A0=C2=A0 0x08=C2=A0=C2=A0=C2=A0 FIXED2=C2=A0=C2=A0 bit=C2=A0=
 31=C2=A0=C2=A0=C2=A0 - Reserved
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 30:20 - Reserved (=
zero)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bits 19:0=C2=A0 - Total=
 data size
>>> +
>>
>> I just noticed that this should say=20
>>
>>                     bits 19:0  - TOTAL_DATA_SIZE Total data size
>>
>> to match the documentation below it.
>
> I'll fix it when applying - staging this for merging, thanks!

Pushed to `drm-rust-next`, thanks!
