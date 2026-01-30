Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020100.outbound.protection.outlook.com [52.101.196.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849973570A6;
	Fri, 30 Jan 2026 17:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769792496; cv=fail; b=c86KcC613ZUi62AQAv54B2lodoBLRJWT7TXAAMmv0GxLt3frUCCH8JcrtzkBCxFCkK9I+1XUGxhCEMTFEdOLWGOZul87uvP8toStuqN7dm1uGZVr1fHV9t1IfS45+C04GKJ9jyaD3UEjJSKvqiV6+Y1/7mAXCxualD2JCXc+IkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769792496; c=relaxed/simple;
	bh=kbeyaNNYyEpVC6QRWjbhmnUcUsSpHyEBhN58qaOwcOY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SqnNZDXnYULKaDkEABKuVUnUESXt8mW/kneWs+g29hVmrBOjFsuQbC675t2zkmnYbfvu6xRPUrqGqaURqi8Latj3j6/Pk8wkt0DZgEq2affaeuqfSiBW58wKvjSil1ycks77TlqGmvh/MF53KaxHyxKGmsUPimntGxs4n03/83U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CbXJn3hm; arc=fail smtp.client-ip=52.101.196.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CbXJn3hm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBTUq6AGHhPc/Hj3OqyLHx/p0065KEY6A92J6XrRjeS9q8VAhvFN0+shsaWP6wOFLlA3PjWtBhfa4CwDHuYCKOzR07eBs1OFUOp4mVBueqKB1Q0+DRr6fLFnZ7q2sYC8ZyP2HlBqHhBIKfuHFiRqF5nHdeqxrDvYM5eKY2y+i2DZF0AQBFdemYoFCqJOgT8ryQvBaitUgVRFPhJFxPe4gwYuaTx4cAII7XBLfttMbH1jSaAsXRD38gfOcacMBg4V/xlE6OAr5NvQZiqY7pT7djM45RpSE1RP1wwhrMgqYYAq9DdiE7hHgHrgW4Y/Kwgho0SN/7AbH6nhgKWfZsJyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQLPryCMh3T1EAzeq3Q+R5tTVfHc3XehQa4FjuKFZ/k=;
 b=Rp4HPKnhRmQLZP54RpaesvHJng+w0MizaCpLzXiqdqfqa0pp0i+Q4xjP+g3juoICeS/J9RzeJd0SGyIwlPKJ09BrcfWQyf/jAcZHLP5fNKMeKk4/8sbKfnTjWunBxuW4waS9UCZQDLXYFqmkVo2VkXVAiILXsCoOn+nKVDc8j8Kj0u1KOzU0WkZv3lHH9rcnRHgOBYINpzzDCzPIsDoLknf2zSsJirxXhrFmBKiTp/BSpufK9dZexcDms3av1nZDGpj2hQ2RXvz+Iu9WM6FxiY+QvFoEgvHrzcayCqYasJVMO7ahyydI4Ca1EBWks+ap884VENOJT7Ei7crsBKILdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQLPryCMh3T1EAzeq3Q+R5tTVfHc3XehQa4FjuKFZ/k=;
 b=CbXJn3hmG8F/1XXAa3FGgRSO+6iMpJFt+patXzwbAj8/AnCCrfNqETYoarExUjL//uIuBw41De+jevUmYI5yJUW1C4f6doyAZ8F+YszTzQE7JOoszuI3JdywnRsWDepMNfnqlRce3GihXx69lZpEHeT7HT8OmK8LT9LzrO5AP/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8885.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 17:01:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:01:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 17:01:31 +0000
Message-Id: <DG232UE5TCK2.3FQARVQKDTUIL@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] rust: io: add `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-5-aee3a33d9649@nvidia.com>
 <DG0CVJN57L5F.2I6J4RXMJOGQ@garyguo.net>
 <DG0WY7S2QPQM.37S6PROC464QI@nvidia.com>
 <DG14TFQG2C13.2BFREQR1DV4I@garyguo.net>
 <DG1Q6I5CTD87.RYS7QBJCHZ7T@nvidia.com>
 <DG222YZ4WT33.21A5GG66K9X5O@garyguo.net>
 <DG22Q420ISG8.169OONC5IKK7I@kernel.org>
In-Reply-To: <DG22Q420ISG8.169OONC5IKK7I@kernel.org>
X-ClientProxiedBy: LO3P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eab850-3340-4886-c6aa-08de60213793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjJxMURzbXJSTVJjY1pDNzdQbnU5S1hYaEd4U2F1b3BsN1ZxMktqdnpLT3JW?=
 =?utf-8?B?dFN0L2s1RTJpakMveDJzMGpNMEdCQXIyeFJhbGxRUUxvam00a3Z2Wnd6MFhE?=
 =?utf-8?B?YzV3WmlEcFlJaUNzQ2lvUDd3czhyb1hRclFxa1Y3ZVpZeUNCMXFFKzRZZHAy?=
 =?utf-8?B?bDdzOWNEQ2M2RnlSSmdDd05UZUlBSU9CbUxjUjFQWCs4VjZLTjhLc1FCdkl5?=
 =?utf-8?B?Z205TkRITDg2VFNXMmRFT2JQWE9CZnJWanhZVUJURlJ1NTJQN1lKK3NxNFFn?=
 =?utf-8?B?OGVoTnFZNUMwWFE4a291a1lWLzRtRWViTDBLUUprcEg2aktVTjQ2WmlDU2li?=
 =?utf-8?B?N3NWZkRCZVVmWE84M3NyT2xVUzZTNHVQdnhCZGRCWHJRTHp2dTRUMnZXMkhy?=
 =?utf-8?B?YjgzQWF2eHBZWnk2ZThvVVpyMFZRNUVQQ1RMamtRSFhSeGZWamxpSlRTR0xv?=
 =?utf-8?B?ZkpwazZVRFpFY0pJSng5KzVKM1E4d0ordmNEc2MydUNURUU1QXpSZzNTcXFY?=
 =?utf-8?B?ZlN3dmNGL24wUG54VmlIa3NmS2V4aFo0MEN3ZktaVWc5cGlLaGFFb2tONGRX?=
 =?utf-8?B?M2o3WXVNNXJFL2NCUlBwaVNqLzVrcTVJRFlGN2xqM0hMcGVDeFZMNHBJK3Zw?=
 =?utf-8?B?S0RmSUl4OUo3OThJZDhJRmZOT3NsVHY2THgyTDkrTnFzOWEzNm4vR1NtQ2o0?=
 =?utf-8?B?MnZlMHpzZjhRRDBSSlZQSExSdkNjZTN2TnM0T3NqVjZrV2ZCK0xGYm5rR3pQ?=
 =?utf-8?B?VERPbitvQkdmTUwvRWdSMkNJSllzRHBkSXE1SkRNOHNvaGhsRC95YmZCeExF?=
 =?utf-8?B?UWZ4RWZ0clZEaDRtOWxNaDhaMUFQNXRyWTdDSGY2bjNsMld1YldyMGtIcDFB?=
 =?utf-8?B?Z0pMcG5rb3dXWVZ3ZFE3VzlnY2xQY3BkT0lJcmgzejgrLzl1Y2lHVW5OajBF?=
 =?utf-8?B?aVV6c3B5OGlaM3JnMG94MUhKNThpUUlaNkpGdWdyQWhoTWszaC84V1RkdHNn?=
 =?utf-8?B?T0dhNVNFZWMveHZNMitPQ0V3ZUhpcURwc2lsRHZKbUkvT3I2aFBEOFNEek1w?=
 =?utf-8?B?c2x2ZHNGam5lbWViYXA4OW5HNVVsZzhFNjBNaTJoR3NNa0lvOUl5SE11Vlk5?=
 =?utf-8?B?UHRHcE56dk8vNU1tdGxmNENNUnBwYlhEMDZzejltQ1J1SlkzRVozMU0rRmp4?=
 =?utf-8?B?a1poYmhjd1VWdVN3ekd3dmV2NlF3eVVQN0hObEJiZ3BtUDVoTCtVSmxDcUE0?=
 =?utf-8?B?Z0ZsOG91Qi9iazlwdlJWTlNUTFdBalNQSXlUOEhhcWpaWnBJRUxWZGZFSXZU?=
 =?utf-8?B?eXNpa2xUYU9HVUhsTngxb3A4T3haZU5WOHJhVTdDMGFwNkxwdEovV0QyWmNQ?=
 =?utf-8?B?cWxuTE0yTkN1RmVRdXRFcjYrSllZMHp2WXFTNStoTi9MZTFwQTE1YjVEeVRh?=
 =?utf-8?B?Z3lEVU1nd0hEeE9CaTkxbDhxYzlFRTN5aWlLanBidndBdWFzT0JRSk1EZitO?=
 =?utf-8?B?KzVkcXI4NGttVHpyM0NhZGIvWS9oUmtFZ0pkZE5HZVc1RUh5ZVlaVzYwaEpR?=
 =?utf-8?B?V2hFeElzcnpSYzIyLzdBWmJkWDJSWndxUzNpT2xiZkJqekIzKzZhNVhHWE5V?=
 =?utf-8?B?bHVNZ2JodG5LQm11MHRlbS8yMDc1Z0lJdk4vQVRmK1BaT2xGMitXMTB0d3M1?=
 =?utf-8?B?NGxZTXVvRmlNaitZYTRqVTBqdXNMOVhLWU43dVowVEEwaHZiNHBSNWNlU1d3?=
 =?utf-8?B?a3JjWk1VdE1laHhpRmVjRU1zWXA2VUEwQTU3elg1cnluWHFqdEtNZFFrdDUz?=
 =?utf-8?B?bDFkVk1mUnRhaitCeTB6aXZGQjZWeWF2VmwxbHhEVTNSOE1GbkdHSGVrODF5?=
 =?utf-8?B?LzRDNDNHQ2ZFLzNtMm9MQlJlaFcvRG9xTzZmdEdYcWZZWVllZzArNm1abGI3?=
 =?utf-8?B?dHNhN2hVMmY4N2UzMlZmc0dFVjl3SVhwZVhKWUxpYVBWaTB0b2dEOG1RZ3VU?=
 =?utf-8?B?azI1bnNZUS95aDhtTXI5eUlzamUxaHVoa2ZsYUh3V3lkYkJ2aEhNZ2RPWkox?=
 =?utf-8?B?UENHS3E5dkdqcjQ1dVRGY2pWQjgwaTRyZWpEWWMzUlY4QVE4M0o4ZUtnOG1W?=
 =?utf-8?Q?pfMU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZwaDBHRWY4a3N1VnIwT0drOTNqS1BLUzJsRmZNMVVHVm56c2FNS2YwYTJK?=
 =?utf-8?B?QS8reDRlcEswQldVeXVjSTl1eW5yU3RrL2NuZXR1WHBZQ3RiSFpTSGZBM25k?=
 =?utf-8?B?V1Z6Q2FEUVlnRTFVRVJFQlRodjFER29HR1ZlSkpWM2dsbXdpd1ltRHc2STFH?=
 =?utf-8?B?aG9ENFlWWHRtMGVCME1KUy9ZS2FSclZGclJZOFpTUmhKL3lQUzBSK1V1cFVW?=
 =?utf-8?B?SzZkSTZ1MUpaOTZWN0hoUGkxdVN2VUV3cjNLM0daVElwZ1Znb2dmaUp3OTVq?=
 =?utf-8?B?MmdOUHZCNVVqZzI0bENwVTNOeXZpcmsxVTlFMGpDdWxaY0MwV2RFRVZMQjJl?=
 =?utf-8?B?bmcxV2poUTlmNmd3dklzRjlmRCtXVUUzVzlzUVRuTndHZGlNdlVlME85alpV?=
 =?utf-8?B?R1NwKzU1R2QrUnJQRDdoeWdIOEtQck9GQ0VkSVFURXdMaUJmV1lpVHorWTBJ?=
 =?utf-8?B?QmNHNW1nVkxOejVCRTU1R2wrN1lFdTkxV3ZveGdmSFZkbHJ0Ni9uYkRoRG9i?=
 =?utf-8?B?ajdya1lZSWNOUitrSUVOTGFOd2JjU2NzRWZOdlhiSERNWlFva0w5WnV1QndM?=
 =?utf-8?B?Zm9xU1ZobDQ0Y3hhSVVVNnFFREU2bTI0RXF5RjNaZ29jKzZqcGNFQzE5RUNB?=
 =?utf-8?B?WHZHNzVISjFqWU5JMzFvS080emM3aVJqcGdRUzBRMWR3L1R1V0hSUmNJdkR2?=
 =?utf-8?B?amxZRWdiUURveFp2bFVqNEFaU1h2akI2VEJhZXVJdmlMWk1jOUJuOCtRZmhl?=
 =?utf-8?B?cG44bENSUHY1bmpaQlRxTVdMVmdKT1BjTGJ0RTRUSjJmaGlnRlhKYkpsOThX?=
 =?utf-8?B?QzFzam8zUDQwdzl2RzgzeHBXUERKVy9Gakg5ZjhQR0lteERhLzF3RjRmQWZY?=
 =?utf-8?B?aFQwb0dNTDY4N3hUdUhQSWZBVUZDTG1qdVdyekl3RHY2c0g2YkdraURkQmp1?=
 =?utf-8?B?WUp2MjNCTEFKR2R1T0FzUkJzR0JaVUlNUndkYUlhcHFNMngrY09DckJsWUdy?=
 =?utf-8?B?U3hQOWx4SkJCL0ZtS0NBL2tvVVdIRllGTC96NHBIcVBvU2lOYVlqSmY3dFE1?=
 =?utf-8?B?RExBSWpReDJRYWhDc2hSSWhZK3VDb2o4VTlMdHM2dFA2MmM4Mk9jSWpqcjlH?=
 =?utf-8?B?cURXa2VHQTNReHlObUE0SmdnbHZrRTFoaEI3TVlCaEdOU29KeVJkMWtwU2Fr?=
 =?utf-8?B?UnlWRDdRclk5NE8xVzJoRTREeXBwMlpiSDNFREJ3QUx2aWJoend5azN2MHEx?=
 =?utf-8?B?T2N4WGx1eE5nVk5lV0FmcnFESzhuVDNjRGtESHo3SllWdW5Bd0FsdDA3REFR?=
 =?utf-8?B?Y3Uwc1JhSmlpb1FLZmt6VDJ1MWFWY2VjM0JDNnNUbVpwTjdwNy9INWpIdE5y?=
 =?utf-8?B?b3ZPQUo2NGFpRDdEeVpQc2FVOTY1TDQ5em05WllhdTlhZGNJWUdpZnhJaHRG?=
 =?utf-8?B?NGRvTmhhdkVyY2ZJZGxDM0pvZkdtM3NpRzJqblQwRkFsbUFXRjRmVW94blp0?=
 =?utf-8?B?c3lpRTQ3UGNyZ0ZJUDhITEh1c3Z6d2xNUUNpSUhGTkV1MzBBU3VUM1lBMW1I?=
 =?utf-8?B?cVVMWW1YcjdXV0FWSk5VbkFGeVJyVkNSM2pmQXNCUzRUTGhrbjAxZlBhS010?=
 =?utf-8?B?aklCOW5kQnEwK1NJMXZWV1JDTUxlNGdOaS9mTzFQVmpUb2xqMmJhaTNKRWhW?=
 =?utf-8?B?Y2EzdVh5WmtJWktMWHM0dWxpMXJDdk5nTG5ZbzNZUjYvN2d0d3Jib1hsOUto?=
 =?utf-8?B?bTdBeTU3ZTlSOEdUWnhCbVIrU1pmWkZyNFFacGk5QXl4ajJZekpSSlNxNUNV?=
 =?utf-8?B?UXlZZ09pc1Q2cVNmK3hIRVJKREY1ZW9hYVJvNWRPWlZHNHhMUG5UUDVFSlZI?=
 =?utf-8?B?ZjVmdVpJSWg1clp5dEFwc05NbjdqY01ZVXBKZDRiN3VjQjVhN0ZPWkZEbXM2?=
 =?utf-8?B?UDUxU0l3cGMxemxlcXlaenFOK2pqdks0Z05ZNEluUkFta2ROZWVHYks5S2p3?=
 =?utf-8?B?emw3dStMZHd6bCtHRXd6V0UwQmlQS1JoSjk3NnV0V3VlNnphOTZEWFFnc3lo?=
 =?utf-8?B?L29ocSsxREpCdEhRdDV0bEdVV1NDZm5JSUtOaEV5eTVVU3RoTVozUHFwcktT?=
 =?utf-8?B?SHlnekw2aHVTUnNuM3Jtd2tpSlc1Z241U0s1RHFJdnMrMjhTYW50TnhacE1j?=
 =?utf-8?B?VUNPNkRvbW9jR2VORmY2aXZQUFd4OGJuUzU4VUg1WGMwWG9tbERRMnR3UEpC?=
 =?utf-8?B?dExwUUNxSXI3SHJBaEcwZWM1N1FhYTF2Y0h5WGxqaUgrbzJMbjNOZ0cvTHZs?=
 =?utf-8?Q?YxhteB5mztdCQKbPDc?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eab850-3340-4886-c6aa-08de60213793
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:01:31.6651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qoPGm13THLZ+cxhnR8kCWWnsaziFiPS1XJkLtBnW+80QUe7WlYkqDq7BmfAkMCHAd2OeB1f3Fh13pEW9VUy/Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8885

On Fri Jan 30, 2026 at 4:44 PM GMT, Danilo Krummrich wrote:
> On Fri Jan 30, 2026 at 5:14 PM CET, Gary Guo wrote:
>> On Fri Jan 30, 2026 at 6:55 AM GMT, Alexandre Courbot wrote:
>>> No, I'm starting to believe that the fundamental issue is that the
>>> register interface does its I/O backwards, and that design issue is onl=
y
>>> exacerbated by the recent I/O redesign. I.e. instead of doing
>>>
>>>   regs::NV_PMC_BOOT_0::read(bar);
>>>
>>> We should really do
>>>
>>>   bar.read_reg::<regs::NV_PMC_BOOT_0>();
>>>
>>> Because that way we can use deref coercion.
>>>
>>> That's quite a big redesign though, which means I don't believe
>>> `register!` can make it this cycle... I'll give it a try though.
>>
>> Hmm, that's unfortunate, but I think this is indeed a big design change =
that we
>> should iron out before merging...
>>
>> I think you're right that if we put the methods on `Io` then all of the =
deref
>> issue would just went away.
>
> I already discussed this with Alex offline and I think we should not take=
 this
> direction just because of the Deref issue, as we can easily overcome this=
 with
> using AsRef (or a custom trait).

`AsRef` won't work for `Io` which is a trait, unlike `Device` which is a ty=
pe. A
custom trait might work but that's more complex than what Alex purposed.

I'm quite fond of the `io.read_reg(REGISTER_REF)` API suggested. It looks q=
uite
uniform with other I/O acceessor methods, except typed and with constant
offsets.

>
> Whereas the downside of bar.read_reg() is that you end up with a more
> inconsistent and complicated API for drivers.
>
> For instance, with the API as is you can do things like:
>
> 	register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
> 	    0:0     reset as bool;
> 	});
> =09
> 	impl NV_PFALCON_FALCON_ENGINE {
> 	    pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
> 	        Self::update(bar, &E::ID, |r| r.set_reset(true));
> =09
> 	        // TIMEOUT: falcon engine should not take more than 10us to rese=
t.
> 	        time::delay::fsleep(time::Delta::from_micros(10));
> =09
> 	        Self::update(bar, &E::ID, |r| r.set_reset(false));
> 	    }
> 	}

The only benefit of this compared to the newly proposed API is that you can=
 use
`Self`. It's not too bad to have (hypothetical API)

    pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
        bar.update_reg(NV_PFALCON_FALCON_ENGINE(&E::ID), |r| r.set_reset(tr=
ue));

        // TIMEOUT: falcon engine should not take more than 10us to reset.
        time::delay::fsleep(time::Delta::from_micros(10));

        bar.update_reg(NV_PFALCON_FALCON_ENGINE(&E::ID), |r| r.set_reset(tr=
ue));
    }

I also think in most cases these helper function won't be implemented on th=
e
register, so you're not saving much by having the ability to refer to `Self=
`.
For example, in this case you could implement it on `FalconEngine`.

Best,
Gary


>
> and then use this from the driver code like this:
>
> 	impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
> 	    fn do_stuff(&self, bar: &Bar0) {
> 	        //...
> =09
> 	        regs::NV_PFALCON_FALCON_ENGINE::reset_engine::<E>(bar);
>
> 	        //...
> 	    }
> 	}




>
> Having to implement AsRef (or a custom trait) for the corresponding I/O b=
ackend
> implementations is a pretty minor inconvinience compared to the simplicit=
y the
> current API provides to drivers.

