Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386630C348;
	Thu, 29 Jan 2026 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693581; cv=fail; b=kfOVKYzv92b3CS14sLdkykbcM7rVNrmCzPLAoj05FRk2ccPqbi5HCjSRkHBCrW72/JDPmRAStFY9YKydBaRBM9dRTS7Nhtxf/XRl2WReZ2WEy2rd4/h87HEig1wW1ehew4UPzA0BTe2a8GTPnUgXSkxAqLBQC2ny7bTTgE0WX2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693581; c=relaxed/simple;
	bh=84GgaeUK76MqxYiLtftWiaa1VTpis6lhPo4+6tn9S9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RTt2mtY69u2BPbn/FRj3sWs+YyUCjLD39OLrSvVI4U9g1Ue6LW9k2kH0KoSVwNWJYdAU5Momb5EMNmpT9v0Y3k8zE3z8DetZIgmIcGYYtXoPxPZ9H2oV3l79zLGa0ATu+ZbNNK7ustr3Oqo3ucXoApA+R/qBp2NmyqOrrXzxols=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uNMijKD+; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uNMijKD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+ktt3C2OScBbvSsZHB4keGwwPtfhgqcl4qG//tzn6tliSQRHRhxLNiHI4Jq0ZctuZkPg6qv7xLtGLaVRJyrfhyX7sTVln1tXIyo1htnx0OT+IGeAqOyIigmyRW3TDeEKxARRPZJIaxgYvAeXUr/X17OA50v+YWJWSKlbLdRZ7xSSTUeTRm8oqVRilWmxdb+omdBwOBZN5L5tgZA5Qp352j2mVbNW3l22YIVzamreMXlWSWR7krmvKP32sbSPaV+B38n9gqNmUMFniGu9LJE50q1QhlZdadF3c8qH5qs4djsCIhsQ1Nv2K97ByylCH96p6uTM/rs9CM0MpZaVLhLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqQBkLUCF5QIXSLvyFriHiYerpueabINsmH/dfLFJBo=;
 b=lcwphmTBN3WT7ZrGN390IbgC/Bb+ViDRGPaZxOlMsLsimA0mnWnKcJoHPgT62SAx0AstoDDLkBl+9CgI1BLYEg4ziAxqw4KiTv0KQzsH0riowPwyy2ZG66XFQNxiatZpam3D3IyK4RYJZJfT2YI9jtrqVPXmZNHZms67YfWoc1rTniqgq4AWcLlAAv3EFnxxfAIgLNNC+Omwij9yE0YL7b4D/k1rJTjTOW+ETM7b/5xwDliBMf4P53QXBS3Zjw8hoJi89MTXQ1iSPlJxCSvapDZQJ9ySRa0ZlOQndk9rbckYt20K8jSkv9ICZ7fIGU/bAAjDSzVOxoXfeuhAI4tF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqQBkLUCF5QIXSLvyFriHiYerpueabINsmH/dfLFJBo=;
 b=uNMijKD+Uhy/yv8jZ2/bXqulNzVLghbPA2OIe6oT3Ze9mANOR8lwae2secny2LCoo6xyulpibQH4jP7f888r8MooKdCnTm34hUiRhRxTMj2xLU7BPo8TKSINE1CKXXywu/WAjHduN+ohViwRUE3mbIqGxBgr/OlxjIYQlsjxdBHj6fDyyG2keVh1RaWJB6SVtkeiqLvEPvIYPdBSRUody9av3m0q1Q2dt9QIrxznEPk2oZ8QnQz0ZitwgIHaiqpMMwlLmvAdYh1gzorCb+xfNvl7nkT0cbzb+8FmTRejkIEVAWhPEMVB+Xv1I3rILEz/Py/g39sZ6SD7Hh9upd3HkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:32:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:32:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 29 Jan 2026 22:32:07 +0900
Subject: [PATCH FOR REFERENCE v5 7/7] gpu: nova-core: use the kernel
 `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-register-v5-7-c4587c902514@nvidia.com>
References: <20260129-register-v5-0-c4587c902514@nvidia.com>
In-Reply-To: <20260129-register-v5-0-c4587c902514@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: b9744ba6-d42a-4b29-c1af-08de5f3adfd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVZzeW0rNWt4Y0UvT3dvNUJmMGxJblYrTlRJOURCTHNwL1BFWDJobDJQK3JI?=
 =?utf-8?B?RFlJRnJXczlnNlU1N3J6QnVHdGNZNXNERU0rK3dxTFQ2Tm94RXJLTDhsQ3pt?=
 =?utf-8?B?SFlaVFVNYWl3NDhobXB1bzZqRW9hWlM1SlZpOGJYOFlmUkpaU3RFOGRGSHps?=
 =?utf-8?B?QmFBQWNVTDN1MHBDZzRPOU4rcUxNS2QvY0JnSTlBd3Y3YnJJaHNLYVBWOUZL?=
 =?utf-8?B?U29mNFlFZnFFa3drd0FVbXVPaTlEckxaUERkTFRwSzNxQ0NiTC9rV3h4STJU?=
 =?utf-8?B?S2k0L2JEN0QrSU9ETG5zT0FpaFpFemdmZTkxNXJGQVk3MzdnTlR0YTNQZDJY?=
 =?utf-8?B?bHc2TXVSWVBpdmZucjBLeFhGcnordFlFV3VxY2NMOTA4RkxtNks0NUw4ZHp2?=
 =?utf-8?B?akJxR3VKTXlpSEdVb1NNQnV1QmxOTjVaMFlqcGZzODI4UUxOQkNjdzA2eEdY?=
 =?utf-8?B?S0drWkd5SU1ScDhBd1FUZ0l3dkVuWVhSVHd1RUVIOVhKQUpGR2E1VnNOdHRJ?=
 =?utf-8?B?Y00zWjZKOElGSFh0UHdmckV2MTQyVWk4aFMwWnFEYkpxL0xpY2JwQkUzOHpM?=
 =?utf-8?B?Vk9wMndKZHEweWV0aHBWNjNKd0FqemlyV1h5b2k3NlFxTXAxd1A1eVV0MEFW?=
 =?utf-8?B?UWxOZmFIVmdrS3JReHRBU0hwbnFtdjV4bU1vMHcwR2NoeUJaQ3VldGFqWHhG?=
 =?utf-8?B?R3VYQzl1SHRxWHQ4cVU3ZndabzJxUEJ4dW50KzRNYzc2TksrMEpiWmZTTjVv?=
 =?utf-8?B?YUlFd3haaDRudkMvK09WT3V6TEV6d1hKbmpYMisyWUg3YzlSUjhkWVNuZ244?=
 =?utf-8?B?bUQ5Uy9lTFZweVRSTzAwZExIK2QxOWZmN2JzMndpN2dwdEJTQmxrYUlWK3JU?=
 =?utf-8?B?Tmh1dVN6dDFKVHBySzNIZ0paV1NwVjQ3ZXpiMXdSZTFDNGRITVVjcXd6RndB?=
 =?utf-8?B?OUhKcy92WE15eXpwaHk4SVhlTnB1RjNLUmFQOTBmK2d3TlkzNUsvWWlPc290?=
 =?utf-8?B?NzhTZ0h1cW9PYUpYOWR1S0lleHROZEVjSXlKY0dqeGRqSTZOYXdNZkZmN2Vz?=
 =?utf-8?B?ZHpLL3VBMVhudXNxdEQzazM2R0F4VEsxNjdSNyt5VWhIYnVsbU1SVTl0MTl5?=
 =?utf-8?B?OE44S2QvQkRXYng1dG41YUg1SmdzVlhWaTRQWEFkRFkyUHNlbTF1dkcwYUZY?=
 =?utf-8?B?MkY3NGJNNjNWeDVaOVZzQ25RV0o3ZGtnbmF3aUpRVlMxTHE1S3V1V0xmOXdN?=
 =?utf-8?B?dW1FeUdSVG5JV3JZYStIMFNuSFhjUFFBN0pnd3RFY0xKbktXUEhHdEdMMmht?=
 =?utf-8?B?dHB3UlRHT3dicmwvNzJ5eWxuRFRTWnJZMzJIR1dIdVNKdmpMLzJXTjQ1ekZ1?=
 =?utf-8?B?RC9DWXVDdVFxQ2lFSGpGNXZxTGJMS3A2ck1tZ0hyUzFtMlFTQ3M3OW1IZjJ6?=
 =?utf-8?B?Tk5JTUdUdlJQMFFqNytIczFTZStJVENZbi8raGluRmh5eVYrdGErTXZPZHRX?=
 =?utf-8?B?dHhuRzUxbnFTejM4VTFvZUVYcUN2a21iS3RpQVV0eDYzN3pFdEhlRG0ycTkx?=
 =?utf-8?B?Uit6VS9iaGx0UnVEclNObE1JZVpVVmdLaklLVGg2V3gvSWErZW93VTNkd2kv?=
 =?utf-8?B?WVV0L3h3UGJkOTNOajk3UHlxWTYrWnJKNTllcVdURlZtemdvSG9XaEZBanBX?=
 =?utf-8?B?eFNLMDdZMW5CUUR4U1hlOGdjSEl5Wk5KMnF2c3VUOGZXZVNSbDkvaW5LOVp6?=
 =?utf-8?B?MFpWNnNZMW1LbnBLRTRCVXNQWFNZcm1pUkpkaUNtQStoYi9la3RTTXRDREJi?=
 =?utf-8?B?NzZNS1hySHdZU1RxeGs3S0kxbFFxeEMyWERGVmZ0VmZDWWZ1RjBhWXc1R0xt?=
 =?utf-8?B?NHgxd2YzMGI2ak1xVWRLa3p2U2IrVWUvZU1HWThBL0ZLYlV2MUlNNklCZXFl?=
 =?utf-8?B?UHRWRWF0QTRkeUw5bTkyVmxKSFB4Y0ZwUnVtU0dmS2x6NlRRV1lWZTM5bGM5?=
 =?utf-8?B?WWtMRkVmeVJWb1djMEg5aTE0Z1JaZEtWUE9HcXUvajQyWUN0NHNLK2w3K3pk?=
 =?utf-8?B?UFY0dFZVcWlLSWkwOHpqZWJpTmNJMXc1K0s4MDZLcUlTa1hHeUdRZWZVNnlw?=
 =?utf-8?B?YzVNSklyRHJZdlN1ZFcrQXZGSjJYR3F1ZURxbzIydWo5UXB3enJQRTNNZ215?=
 =?utf-8?Q?VulhpX70jPDf4tkXiaAgQ2E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWd0NzFsWkNiZkFUTHhQbUVsVUhuK3dCRDc4OXo3K2d6V1VMZk9Pbmd3ZUVG?=
 =?utf-8?B?bkNnTmQ0SXVqMktuYjhVTUJZVTZoaWdGT3M2WUhhblJEWEwzMkZxMEdFSTMx?=
 =?utf-8?B?OWdWNHBuc3NydlByRmlma3poYlA2Z3RMVElJbzhnWXZ1aTk2U2NRT1ZBc3RI?=
 =?utf-8?B?RDBEK05BaUYvRjVUQWtWKzYrc2VRYnlQZzF1eVk4SkFKdjRLZVdaSUR4T1Nh?=
 =?utf-8?B?OUVHUGI4WHcrS1QrV2hRZ2srM2s2SU5MQlJpL1JYZ29NYk03Y2xmTGVWRHlC?=
 =?utf-8?B?L2V6VzZEY3crVlRDVmFmSFBFUWZIQWdYVjR3eDRsSU02KzJVV3hsYjNJMjQz?=
 =?utf-8?B?Y0Z5L3djakw3R29hRTFzNVBjYlgzQnlSUnU4d1VpYThaNHhjTnY1R1doSi9y?=
 =?utf-8?B?WUFwM3YvUzlOTnBnbmxaYlZLY1R6TTJEMnhwdlpxOVREby8xdm5hUXhlRXhZ?=
 =?utf-8?B?eTEyUHlJc0pub2twcW55Zy9Sd3ZBV1A4RU5hb3dWK3Z1bW9md3c0Yk41WjU0?=
 =?utf-8?B?S3l4VjhJYnVqcklpa1ZKdS9yc0MrenVQK1hva3hhdW5IcVBTU0R0dXJuUGRW?=
 =?utf-8?B?TXh0elgwRllTemFCUGJXNnc4N1VySjVmRjdRYVZPUmF4b1B6UFFESUs3MzlS?=
 =?utf-8?B?YWJoUWxUVjhwK2ZDTWRNZnMwRTFlVnB6RjFqdkxyaW1nSTZUR1BHc210VWVS?=
 =?utf-8?B?VGcyV0JwcERwSWVuSldCQzcwSTFQeVBTL0RBKy9QOTJIUExwYlB4U2RLbVQy?=
 =?utf-8?B?OEYvVDhaaVN2MXZQVXgyMUpGdHNGV1czaUdiS3JVcHowcG9KMklVUW5OMEVC?=
 =?utf-8?B?UkVoWDBLSTI2OGdHT2F2bkhmeU8xYnhlQlllTDBqTU52dk9zdnNQMkZTdDFx?=
 =?utf-8?B?cml3V1ZUaVI3UUg0Y1k4MzRKZ0psNHN1dnE2T3FwSXNNQmgwcFBkZXBqb2V1?=
 =?utf-8?B?aEpEN1BlbDFFSk9GUnYra1J2cUtVWldlVlRkT0dqalhRNHd6bFVBMk1idkx0?=
 =?utf-8?B?ODJkbGRJRzY2dTRhRnRWb1d4YkVkQi9xdXZSWEFjMmpuM1RQaml1cHVQWm9H?=
 =?utf-8?B?cnM2QS9kRVEzcVVzVXh0R3RpVVBsRUlrZjBHUEtCSVpTbzRhSkFHWW5zdFVQ?=
 =?utf-8?B?MXE1Q0xWdHJ6cEVmaE5IU2dJc2I5enA5eWpabGFFcW84WVF2dkxEcllJOW5H?=
 =?utf-8?B?emNUVFduclN0YUdoZmh5YzhDYlh5OUt4QVdpVTlTM3dGVXpMRGNTWU96UWNt?=
 =?utf-8?B?WGJNYnVpUVhXeUlWUHlLM0ZhMjBOcW1QdFpCdlFtVUJYVU4xZE50OGgzbXVJ?=
 =?utf-8?B?SGVLVjJjQU5QMkcyT3FrYmxsbjZMbXRNVy9TbG9lb25HdVcxSDFOME5SdTVh?=
 =?utf-8?B?ekpJVkRhbUNsK3U2ME9FcXllMGQ4UG9NVUk0Yk8ydno1Qlc4Q2wzOGRyNG43?=
 =?utf-8?B?ajNNcm02Slo4SDl6bnlxdEw0UGRZYU9BcGJtdEV3OFNHeUpLamRPRDdpYnlj?=
 =?utf-8?B?Z1RwRmxvYjhFelI0N1g0cjVJekpxNmlScXB0Y0VuT2gzWGdoMU0vaXhSVTFP?=
 =?utf-8?B?eWx5dVpRNytUS1I1RW5rVUQ4Y2FzdDJEOE55S2ZBZUU3d1FiUHQ4U2VNeldK?=
 =?utf-8?B?OFlYZmw0SC9BOFBvMlhyc3IzYUEwM1h1Z1F5bE4xcis0enN3Vi9uemVWL2RY?=
 =?utf-8?B?NzkxT0dPalBSd2JpQmFnNFFLLzdGRXRYdjVITFVaZG5SMWdsZ1BuTGlKNlhU?=
 =?utf-8?B?VFlTOVB4Z1l2QXJibklpYzd1Qzdxd0xmZUYwdGg4cE9PUWRWSU9NMFVjYmZu?=
 =?utf-8?B?aWtJOHBvdk5Zemx2UEJTTHg5STR6ZXJzT3NMSnh4QjAveG1GSUFmb2RQRnBL?=
 =?utf-8?B?QUdoNUNOSGJ0aG5VMHN5T2tlNnA3V09VNUJ2dkZaT3R2K1dnSTM4WjhrYXRl?=
 =?utf-8?B?ZFRQQi9TQnJYOFEzTUtDUXZJd0dkT1VJcWlGZGpTa2pQVmhvcTBxVW5aZnYw?=
 =?utf-8?B?bWdRc1ovOWtNL0JRaFJYSlFMNGdMcUxwODIyTWpNQ0lURTBXM2FkZmN1dnlF?=
 =?utf-8?B?MTNyTUZyY2RvS0RFQjN6cnEyWFZqNVlUSFppOUg3SDRGTDloQ0NTY3lNNWhK?=
 =?utf-8?B?ZEpSbVNTTmhhMWRVSEc0Visza0l2b255MHBKSk9tbWpZdFJiNDVKWTRTMkt5?=
 =?utf-8?B?c0kwaTlZWnRIdTZTSkRnM3ZQa1pVa0RzT3E3VTltNFRoODBWZjVSL0lXdGRN?=
 =?utf-8?B?WitjWGJUUVQyZXd5VlpwVk80RHd2WU00SmRhNXRSYXVvbFMvdDg2SHVrVXFR?=
 =?utf-8?B?YjF1eGFLMHlVUkxRcGhRUGVPOWJEUEppZkU0d3RxSnNmcnV3Z2NNbkdKSDFw?=
 =?utf-8?Q?SeyF4W91zT09C337HymKRXlc0QjrXDww0BNum4T9sfOQt?=
X-MS-Exchange-AntiSpam-MessageData-1: 614AyZ7BrE4kuw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9744ba6-d42a-4b29-c1af-08de5f3adfd7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:32:40.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /X8I0Zqps5ob5ABw+wtuvGFMOHGWOwFUwhHcU9TEu60XCg90cdDG99ECQUY5J2bpULOdKOsGgN1ykC/10nmEnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146

Replace the nova-core internal `register!` macro by the one defined in
the `kernel` crate and remove our own private implementations.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 205 ++++-----
 drivers/gpu/nova-core/falcon/gsp.rs       |  14 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  25 +-
 drivers/gpu/nova-core/falcon/sec2.rs      |  13 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |  19 +-
 drivers/gpu/nova-core/fb/hal/tu102.rs     |   4 +-
 drivers/gpu/nova-core/gpu.rs              |  31 +-
 drivers/gpu/nova-core/gsp/cmdq.rs         |   4 +-
 drivers/gpu/nova-core/regs.rs             | 494 +++++++++++---------
 drivers/gpu/nova-core/regs/macros.rs      | 739 ------------------------------
 10 files changed, 420 insertions(+), 1128 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..cf8a93f69ca8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -9,7 +9,11 @@
 use kernel::{
     device,
     dma::DmaAddress,
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::RegisterBase, //
+    },
+    num::Bounded,
     prelude::*,
     sync::aref::ARef,
     time::{
@@ -27,7 +31,6 @@
         IntoSafeCast, //
     },
     regs,
-    regs::macros::RegisterBase, //
 };
 
 pub(crate) mod gsp;
@@ -35,11 +38,11 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
+macro_rules! impl_from_enum_to_bounded {
+    ($enum_type:ty, $length:literal) => {
+        impl From<$enum_type> for Bounded<u32, $length> {
             fn from(value: $enum_type) -> Self {
-                value as u8
+                Bounded::from_expr(value as u32)
             }
         }
     };
@@ -47,10 +50,8 @@ fn from(value: $enum_type) -> Self {
 
 /// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
 /// register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRev {
-    #[default]
     Rev1 = 1,
     Rev2 = 2,
     Rev3 = 3,
@@ -59,16 +60,16 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
+impl_from_enum_to_bounded!(FalconCoreRev, 4);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
+impl TryFrom<Bounded<u32, 4>> for FalconCoreRev {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 4>) -> Result<Self> {
         use FalconCoreRev::*;
 
-        let rev = match value {
+        let rev = match value.get() {
             1 => Rev1,
             2 => Rev2,
             3 => Rev3,
@@ -85,46 +86,38 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Revision subversion number of a falcon core, used in the
 /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
 pub(crate) enum FalconCoreRevSubversion {
-    #[default]
     Subversion0 = 0,
     Subversion1 = 1,
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
+impl_from_enum_to_bounded!(FalconCoreRevSubversion, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRevSubversion {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
+impl From<Bounded<u32, 2>> for FalconCoreRevSubversion {
+    fn from(value: Bounded<u32, 2>) -> Self {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
+        match value.get() {
             0 => Subversion0,
             1 => Subversion1,
             2 => Subversion2,
             3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+            // SAFETY: `value` comes from a 2-bit `Bounded`, and we just checked all possible
+            // values.
+            _ => unsafe { core::hint::unreachable_unchecked() },
+        }
     }
 }
 
-/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
-/// register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone)]
 /// Security mode of the Falcon microprocessor.
 ///
 /// See `falcon.rst` for more details.
+#[derive(Debug, Copy, Clone)]
 pub(crate) enum FalconSecurityModel {
     /// Non-Secure: runs unsigned code without privileges.
-    #[default]
     None = 0,
     /// Light-Secured (LS): Runs signed code with some privileges.
     /// Entry into this mode is only possible from 'Heavy-secure' mode, which verifies the code's
@@ -138,16 +131,16 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
+impl_from_enum_to_bounded!(FalconSecurityModel, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
+impl TryFrom<Bounded<u32, 2>> for FalconSecurityModel {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
         use FalconSecurityModel::*;
 
-        let sec_model = match value {
+        let sec_model = match value.get() {
             0 => None,
             2 => Light,
             3 => Heavy,
@@ -160,24 +153,22 @@ fn try_from(value: u8) -> Result<Self> {
 
 /// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
 /// register. It is passed to the Falcon Boot ROM (BROM) as a parameter.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum FalconModSelAlgo {
     /// AES.
-    #[expect(dead_code)]
     Aes = 0,
     /// RSA3K.
-    #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
+impl_from_enum_to_bounded!(FalconModSelAlgo, 8);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
+impl TryFrom<Bounded<u32, 8>> for FalconModSelAlgo {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 8>) -> Result<Self> {
+        match value.get() {
+            0 => Ok(FalconModSelAlgo::Aes),
             1 => Ok(FalconModSelAlgo::Rsa3k),
             _ => Err(EINVAL),
         }
@@ -185,21 +176,19 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
-#[repr(u8)]
-#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+#[derive(Debug, Copy, Clone, PartialEq, Eq)]
 pub(crate) enum DmaTrfCmdSize {
     /// 256 bytes transfer.
-    #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
+impl_from_enum_to_bounded!(DmaTrfCmdSize, 3);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
+impl TryFrom<Bounded<u32, 3>> for DmaTrfCmdSize {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 3>) -> Result<Self> {
+        match value.get() {
             0x6 => Ok(Self::Size256B),
             _ => Err(EINVAL),
         }
@@ -207,33 +196,24 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Currently active core on a dual falcon/riscv (Peregrine) controller.
-#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum PeregrineCoreSelect {
     /// Falcon core is active.
-    #[default]
     Falcon = 0,
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_bounded!(PeregrineCoreSelect, 1);
 
-impl From<bool> for PeregrineCoreSelect {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for PeregrineCoreSelect {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => PeregrineCoreSelect::Falcon,
             true => PeregrineCoreSelect::Riscv,
         }
     }
 }
 
-impl From<PeregrineCoreSelect> for bool {
-    fn from(value: PeregrineCoreSelect) -> Self {
-        match value {
-            PeregrineCoreSelect::Falcon => false,
-            PeregrineCoreSelect::Riscv => true,
-        }
-    }
-}
-
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -246,10 +226,8 @@ pub(crate) enum FalconMem {
 /// Defines the Framebuffer Interface (FBIF) aperture type.
 /// This determines the memory type for external memory access during a DMA transfer, which is
 /// performed by the Falcon's Framebuffer DMA (FBDMA) engine. See falcon.rst for more details.
-#[derive(Debug, Clone, Default)]
+#[derive(Debug, Clone)]
 pub(crate) enum FalconFbifTarget {
-    /// VRAM.
-    #[default]
     /// Local Framebuffer (GPU's VRAM memory).
     LocalFb = 0,
     /// Coherent system memory (System DRAM).
@@ -257,14 +235,14 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
+impl_from_enum_to_bounded!(FalconFbifTarget, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
+impl TryFrom<Bounded<u32, 2>> for FalconFbifTarget {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
+    fn try_from(value: Bounded<u32, 2>) -> Result<Self> {
+        let res = match value.get() {
             0 => Self::LocalFb,
             1 => Self::CoherentSysmem,
             2 => Self::NoncoherentSysmem,
@@ -276,34 +254,25 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 /// Type of memory addresses to use.
-#[derive(Debug, Clone, Default)]
+#[derive(Debug, Clone)]
 pub(crate) enum FalconFbifMemType {
     /// Virtual memory addresses.
-    #[default]
     Virtual = 0,
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_bounded!(FalconFbifMemType, 1);
 
 /// Conversion from a single-bit register field.
-impl From<bool> for FalconFbifMemType {
-    fn from(value: bool) -> Self {
-        match value {
+impl From<Bounded<u32, 1>> for FalconFbifMemType {
+    fn from(value: Bounded<u32, 1>) -> Self {
+        match bool::from(value) {
             false => Self::Virtual,
             true => Self::Physical,
         }
     }
 }
 
-impl From<FalconFbifMemType> for bool {
-    fn from(value: FalconFbifMemType) -> Self {
-        match value {
-            FalconFbifMemType::Virtual => false,
-            FalconFbifMemType::Physical => true,
-        }
-    }
-}
-
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
@@ -384,8 +353,8 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
 
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self, bar: &Bar0) {
-        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        regs::NV_PFALCON_FBIF_CTL::update(bar, &E::ID, |v| v.with_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::zeroed().write(bar, &E::ID);
     }
 
     /// Wait for memory scrubbing to complete.
@@ -413,12 +382,12 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             Delta::from_micros(150),
         );
 
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.with_reset(true));
 
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         fsleep(Delta::from_micros(10));
 
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.with_reset(false));
 
         self.reset_wait_mem_scrubbing(bar)?;
 
@@ -431,8 +400,8 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         self.hal.select_core(self, bar)?;
         self.reset_wait_mem_scrubbing(bar)?;
 
-        regs::NV_PFALCON_FALCON_RM::default()
-            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+        regs::NV_PFALCON_FALCON_RM::zeroed()
+            .with_value(regs::NV_PMC_BOOT_0::read(bar).as_raw())
             .write(bar, &E::ID);
 
         Ok(())
@@ -495,29 +464,27 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         // Set up the base source DMA address.
 
-        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+        regs::NV_PFALCON_FALCON_DMATRFBASE::zeroed()
             // CAST: `as u32` is used on purpose since we do want to strip the upper bits, which
             // will be written to `NV_PFALCON_FALCON_DMATRFBASE1`.
-            .set_base((dma_start >> 8) as u32)
+            .with_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
-        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            // CAST: `as u16` is used on purpose since the remaining bits are guaranteed to fit
-            // within a `u16`.
-            .set_base((dma_start >> 40) as u16)
+        regs::NV_PFALCON_FALCON_DMATRFBASE1::zeroed()
+            .try_with_base(dma_start >> 40)?
             .write(bar, &E::ID);
 
-        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
-            .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
-            .set_sec(if sec { 1 } else { 0 });
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
+            .with_size(DmaTrfCmdSize::Size256B)
+            .with_imem(target_mem == FalconMem::Imem)
+            .with_sec(sec);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
-            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
-                .set_offs(load_offsets.dst_start + pos)
+            regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
+                .try_with_offs(load_offsets.dst_start + pos)?
                 .write(bar, &E::ID);
-            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
-                .set_offs(src_start + pos)
+            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                .with_offs(src_start + pos)
                 .write(bar, &E::ID);
             cmd.write(bar, &E::ID);
 
@@ -539,8 +506,8 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
         self.dma_reset(bar);
         regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {
-            v.set_target(FalconFbifTarget::CoherentSysmem)
-                .set_mem_type(FalconFbifMemType::Physical)
+            v.with_target(FalconFbifTarget::CoherentSysmem)
+                .with_mem_type(FalconFbifMemType::Physical)
         });
 
         self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
@@ -549,8 +516,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
         // Set `BootVec` to start of non-secure code.
-        regs::NV_PFALCON_FALCON_BOOTVEC::default()
-            .set_value(fw.boot_addr())
+        regs::NV_PFALCON_FALCON_BOOTVEC::zeroed()
+            .with_value(fw.boot_addr())
             .write(bar, &E::ID);
 
         Ok(())
@@ -572,11 +539,11 @@ pub(crate) fn wait_till_halted(&self, bar: &Bar0) -> Result<()> {
     /// Start the falcon CPU.
     pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
         match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
-            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
-                .set_startcpu(true)
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::zeroed()
+                .with_startcpu(true)
                 .write(bar, &E::ID),
-            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
-                .set_startcpu(true)
+            false => regs::NV_PFALCON_FALCON_CPUCTL::zeroed()
+                .with_startcpu(true)
                 .write(bar, &E::ID),
         }
 
@@ -586,14 +553,14 @@ pub(crate) fn start(&self, bar: &Bar0) -> Result<()> {
     /// Writes values to the mailbox registers if provided.
     pub(crate) fn write_mailboxes(&self, bar: &Bar0, mbox0: Option<u32>, mbox1: Option<u32>) {
         if let Some(mbox0) = mbox0 {
-            regs::NV_PFALCON_FALCON_MAILBOX0::default()
-                .set_value(mbox0)
+            regs::NV_PFALCON_FALCON_MAILBOX0::zeroed()
+                .with_value(mbox0)
                 .write(bar, &E::ID);
         }
 
         if let Some(mbox1) = mbox1 {
-            regs::NV_PFALCON_FALCON_MAILBOX1::default()
-                .set_value(mbox1)
+            regs::NV_PFALCON_FALCON_MAILBOX1::zeroed()
+                .with_value(mbox1)
                 .write(bar, &E::ID);
         }
     }
@@ -657,8 +624,8 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
 
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
-        regs::NV_PFALCON_FALCON_OS::default()
-            .set_value(app_version)
+        regs::NV_PFALCON_FALCON_OS::zeroed()
+            .with_value(app_version)
             .write(bar, &E::ID);
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 67edef3636c1..fa8f6324c412 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 use kernel::{
-    io::poll::read_poll_timeout,
+    io::{
+        poll::read_poll_timeout,
+        register::RegisterBase, //
+    },
     prelude::*,
     time::Delta, //
 };
@@ -14,10 +17,7 @@
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::{
-        self,
-        macros::RegisterBase, //
-    },
+    regs,
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
@@ -39,8 +39,8 @@ impl Falcon<Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
-        regs::NV_PFALCON_FALCON_IRQSCLR::default()
-            .set_swgen0(true)
+        regs::NV_PFALCON_FALCON_IRQSCLR::zeroed()
+            .with_swgen0(true)
             .write(bar, &Gsp::ID);
     }
 
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..6c337b9d3752 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -26,8 +26,8 @@
 fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
     let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
     if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
-        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
-            .set_core_select(PeregrineCoreSelect::Falcon)
+        regs::NV_PRISCV_RISCV_BCR_CTRL::zeroed()
+            .with_core_select(PeregrineCoreSelect::Falcon)
             .write(bar, &E::ID);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
@@ -59,7 +59,7 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
+    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
         regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0004 != 0 {
         regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
@@ -68,24 +68,25 @@ fn signature_reg_fuse_version_ga102(
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
         return Err(EINVAL);
-    };
+    }
+    .into();
 
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
     Ok(u16::BITS - reg_fuse_version.leading_zeros())
 }
 
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
-    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
-        .set_value(params.pkc_data_offset)
+    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::zeroed()
+        .with_value(params.pkc_data_offset)
         .write(bar, &E::ID, 0);
-    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
-        .set_value(u32::from(params.engine_id_mask))
+    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::zeroed()
+        .with_value(u32::from(params.engine_id_mask))
         .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
-        .set_ucode_id(params.ucode_id)
+    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::zeroed()
+        .with_ucode_id(params.ucode_id)
         .write(bar, &E::ID);
-    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
-        .set_algo(FalconModSelAlgo::Rsa3k)
+    regs::NV_PFALCON2_FALCON_MOD_SEL::zeroed()
+        .with_algo(FalconModSelAlgo::Rsa3k)
         .write(bar, &E::ID);
 
     Ok(())
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index b57d362e576a..5d836e2d17dd 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,12 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::{
-    falcon::{
-        FalconEngine,
-        PFalcon2Base,
-        PFalconBase, //
-    },
-    regs::macros::RegisterBase,
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
 };
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index e0acc41aa7cd..84a5be84846b 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::prelude::*;
+use kernel::{
+    num::Bounded,
+    prelude::*, //
+};
 
 use crate::{
     driver::Bar0,
@@ -19,15 +22,17 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 }
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
-        // CAST: `as u32` is used on purpose since the remaining bits are guaranteed to fit within
-        // a `u32`.
-        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::zeroed()
+        .with_adr_63_40(
+            Bounded::<u64, _>::from(addr)
+                .shr::<FLUSH_SYSMEM_ADDR_SHIFT_HI, _>()
+                .cast(),
+        )
         .write(bar);
-    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+    regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::zeroed()
         // CAST: `as u32` is used on purpose since we want to strip the upper bits that have been
         // written to `NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI`.
-        .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
+        .with_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
         .write(bar);
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index eec984f4e816..9e3c20ba6d7e 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -21,8 +21,8 @@ pub(super) fn write_sysmem_flush_page_gm107(bar: &Bar0, addr: u64) -> Result {
     u32::try_from(addr >> FLUSH_SYSMEM_ADDR_SHIFT)
         .map_err(|_| EINVAL)
         .map(|addr| {
-            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
-                .set_adr_39_08(addr)
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::zeroed()
+                .with_adr_39_08(addr)
                 .write(bar)
         })
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..e42b1aec95b4 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
     device,
     devres::Devres,
     fmt,
+    num::Bounded,
     pci,
     prelude::*,
     sync::Arc, //
@@ -122,24 +123,19 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 }
 
 /// Enum representation of the GPU generation.
-///
-/// TODO: remove the `Default` trait implementation, and the `#[default]`
-/// attribute, once the register!() macro (which creates Architecture items) no
-/// longer requires it for read-only fields.
-#[derive(fmt::Debug, Default, Copy, Clone)]
+#[derive(fmt::Debug, Copy, Clone)]
 #[repr(u8)]
 pub(crate) enum Architecture {
-    #[default]
     Turing = 0x16,
     Ampere = 0x17,
     Ada = 0x19,
 }
 
-impl TryFrom<u8> for Architecture {
+impl TryFrom<Bounded<u32, 6>> for Architecture {
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
+        match u8::from(value) {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
             0x19 => Ok(Self::Ada),
@@ -148,23 +144,26 @@ fn try_from(value: u8) -> Result<Self> {
     }
 }
 
-impl From<Architecture> for u8 {
+impl From<Architecture> for Bounded<u32, 6> {
     fn from(value: Architecture) -> Self {
-        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
-        value as u8
+        match value {
+            Architecture::Turing => Bounded::<u8, 6>::new::<0x16>().cast(),
+            Architecture::Ampere => Bounded::<u8, 6>::new::<0x17>().cast(),
+            Architecture::Ada => Bounded::<u8, 6>::new::<0x19>().cast(),
+        }
     }
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    major: Bounded<u8, 4>,
+    minor: Bounded<u8, 4>,
 }
 
 impl From<regs::NV_PMC_BOOT_42> for Revision {
     fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
         Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
+            major: boot0.major_revision().cast(),
+            minor: boot0.minor_revision().cast(),
         }
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3991ccc0c10f..4fffd16e3dde 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -475,8 +475,8 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
 
     /// Notifies the GSP that we have updated the command queue pointers.
     fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
+        regs::NV_PGSP_QUEUE_HEAD::zeroed()
+            .with_address(0u32)
             .write(bar);
     }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..dbc6fa121ef9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -1,12 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// Required to retain the original register names used by OpenRM, which are all capital snake case
-// but are mapped to types.
-#![allow(non_camel_case_types)]
-
-#[macro_use]
-pub(crate) mod macros;
-
 use kernel::prelude::*;
 
 use crate::{
@@ -29,20 +22,64 @@
     num::FromSafeCast,
 };
 
+// All nova-core registers are 32-bit and `pub(crate)`. Wrap the `register!` macro to avoid
+// repeating this information for every register.
+macro_rules! nv_reg {
+    (
+        $(
+            $(#[$attr:meta])* $name:ident $([ $size:expr $(; $stride:expr)? ])?
+                $(@ $offset:literal)?
+                $(@ $base:ident + $base_offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            $(, $comment:literal)? { $($fields:tt)* }
+        )*
+    )=> {
+        $(
+        ::kernel::register!(
+            @reg $(#[$attr])* pub(crate) $name(u32) $([$size $(; $stride)?])?
+                $(@ $offset)?
+                $(@ $base + $base_offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            $(, $comment)? { $($fields)* }
+        );
+        )*
+    };
+}
+
 // PMC
 
-register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
-    3:0     minor_revision as u8, "Minor revision of the chip";
-    7:4     major_revision as u8, "Major revision of the chip";
-    8:8     architecture_1 as u8, "MSB of the architecture";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    28:24   architecture_0 as u8, "Lower bits of the architecture";
-});
+nv_reg! {
+    /// Basic revision information about the GPU.
+    NV_PMC_BOOT_0 @ 0x00000000 {
+        /// Minor revision of the chip.
+        3:0     minor_revision;
+        /// Major revision of the chip.
+        7:4     major_revision;
+        /// Meta-variable `newbase` repeats 0 times, but `offset` repeats 1 time.
+        8:8     architecture_1;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// Lower bits of the architecture.
+        28:24   architecture_0;
+    }
+
+    /// Extended architecture information.
+    NV_PMC_BOOT_42 @ 0x00000a00 {
+        /// Minor revision of the chip.
+        15:12   minor_revision;
+        /// Major revision of the chip.
+        19:16   major_revision;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// Architecture value.
+        29:24   architecture ?=> Architecture;
+    }
+}
 
 impl NV_PMC_BOOT_0 {
     pub(crate) fn is_older_than_fermi(self) -> bool {
         // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
-        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
 
         // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
         // GF100, means "older than Fermi".
@@ -50,13 +87,6 @@ pub(crate) fn is_older_than_fermi(self) -> bool {
     }
 }
 
-register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
-    15:12   minor_revision as u8, "Minor revision of the chip";
-    19:16   major_revision as u8, "Major revision of the chip";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    29:24   architecture as u8 ?=> Architecture, "Architecture value";
-});
-
 impl NV_PMC_BOOT_42 {
     /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
     pub(crate) fn chipset(self) -> Result<Chipset> {
@@ -89,35 +119,50 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 
 // PBUS
 
-register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
+nv_reg! {
+    NV_PBUS_SW_SCRATCH[64] @ 0x00001400 {}
 
-register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
-    "scratch register 0xe used as FRTS firmware error code" {
-    31:16   frts_err_code as u16;
-});
+    /// Scratch register 0xe used as FRTS firmware error code.
+    NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe] {
+        31:16   frts_err_code;
+    }
+}
 
 // PFB
 
-// The following two registers together hold the physical system memory address that is used by the
-// GPU to perform sysmembar operations (see `fb::SysmemFlush`).
+nv_reg! {
+    /// Low bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations (see [`crate::fb::SysmemFlush`]).
+    NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+        31:0    adr_39_08;
+    }
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
-    31:0    adr_39_08 as u32;
-});
+    /// High bits of the physical system memory address used by the GPU to perform sysmembar
+    /// operations (see [`crate::fb::SysmemFlush`]).
+    NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+        23:0    adr_63_40;
+    }
 
-register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
-    23:0    adr_63_40 as u32;
-});
+    NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
+        3:0     lower_scale;
+        9:4     lower_mag;
+        30:30   ecc_mode_enabled => bool;
+    }
 
-register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
-    3:0     lower_scale as u8;
-    9:4     lower_mag as u8;
-    30:30   ecc_mode_enabled as bool;
-});
+    NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+        31:0    address;
+    }
 
-register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
-    31:0    address as u32;
-});
+    NV_PFB_PRI_MMU_WPR2_ADDR_LO @ 0x001fa824 {
+        /// Bits 12..40 of the lower (inclusive) bound of the WPR2 region.
+        31:4    lo_val;
+    }
+
+    NV_PFB_PRI_MMU_WPR2_ADDR_HI @ 0x001fa828 {
+        /// Bits 12..40 of the higher (exclusive) bound of the WPR2 region.
+        31:4    hi_val;
+    }
+}
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
@@ -134,10 +179,6 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
-    31:4    lo_val as u32, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
-});
-
 impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
     /// Returns the lower (inclusive) bound of the WPR2 region.
     pub(crate) fn lower_bound(self) -> u64 {
@@ -145,10 +186,6 @@ pub(crate) fn lower_bound(self) -> u64 {
     }
 }
 
-register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
-    31:4    hi_val as u32, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
-});
-
 impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
     /// Returns the higher (exclusive) bound of the WPR2 region.
     ///
@@ -167,29 +204,30 @@ pub(crate) fn higher_bound(self) -> u64 {
 // These scratch registers remain powered on even in a low-power state and have a designated group
 // number.
 
-// Boot Sequence Interface (BSI) register used to determine
-// if GSP reload/resume has completed during the boot process.
-register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
-    26:26   boot_stage_3_handoff as bool;
-});
-
-// Privilege level mask register. It dictates whether the host CPU has privilege to access the
-// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
-          "Privilege level mask register" {
-    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
-});
-
-// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
-// element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234[1] {});
-
-register!(
-    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
-    "Scratch group 05 register 0 used as GFW boot progress indicator" {
-        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+nv_reg! {
+    /// Boot Sequence Interface (BSI) register used to determine
+    /// if GSP reload/resume has completed during the boot process.
+    NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+        26:26   boot_stage_3_handoff => bool;
     }
-);
+
+    /// Privilege level mask register. It dictates whether the host CPU has privilege to access the
+    /// `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {
+        /// Set after FWSEC lowers its protection level.
+        0:0     read_protection_level0 => bool;
+    }
+
+    /// OpenRM defines this as a register array, but doesn't specify its size and only uses its
+    /// first element. Be conservative until we know the actual size or need to use more registers.
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[1] @ 0x00118234 {}
+
+    /// Scratch group 05 register 0 used as GFW boot progress indicator.
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0] {
+        /// Progress of GFW boot (0xff means completed).
+        7:0    progress;
+    }
+}
 
 impl NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT {
     /// Returns `true` if GFW boot is completed.
@@ -198,16 +236,17 @@ pub(crate) fn completed(self) -> bool {
     }
 }
 
-register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
-    31:0    value as u32;
-});
-
-register!(
-    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
-    "Scratch group 42 register used as framebuffer size" {
-        31:0    value as u32, "Usable framebuffer size, in megabytes";
+nv_reg! {
+    NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
+        31:0    value;
     }
-);
+
+    /// Scratch group 42 register used as framebuffer size.
+    NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 {
+        /// Usable framebuffer size, in megabytes.
+        31:0    value;
+    }
+}
 
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
@@ -218,10 +257,14 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 
 // PDISP
 
-register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
-    3:3     status_valid as bool, "Set if the `addr` field is valid";
-    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
-});
+nv_reg! {
+    NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
+        /// Set if the `addr` field is valid.
+        3:3     status_valid => bool;
+        /// VGA workspace base address divided by 0x10000.
+        31:8    addr;
+    }
+}
 
 impl NV_PDISP_VGA_WORKSPACE_BASE {
     /// Returns the base address of the VGA workspace, or `None` if none exists.
@@ -238,48 +281,127 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
 
-register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+nv_reg! {
+    NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
+        15:0    data;
+    }
 
-register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+    NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
+        15:0    data;
+    }
 
-register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
-});
+    NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
+        15:0    data;
+    }
+}
 
 // PFALCON
 
-register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
-    4:4     halt as bool;
-    6:6     swgen0 as bool;
-});
+nv_reg! {
+    NV_PFALCON_FALCON_IRQSCLR @ PFalconBase + 0x00000004 {
+        4:4     halt => bool;
+        6:6     swgen0 => bool;
+    }
 
-register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
-    31:0    value as u32;
-});
+    NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase + 0x00000040 {
+        31:0    value => u32;
+    }
 
-register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
-    31:0    value as u32;
-});
+    NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase + 0x00000044 {
+        31:0    value => u32;
+    }
 
-// Used to store version information about the firmware running
-// on the Falcon processor.
-register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
-    31:0    value as u32;
-});
+    /// Used to store version information about the firmware running
+    /// on the Falcon processor.
+    NV_PFALCON_FALCON_OS @ PFalconBase + 0x00000080 {
+        31:0    value => u32;
+    }
 
-register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
-    31:0    value as u32;
-});
+    NV_PFALCON_FALCON_RM @ PFalconBase + 0x00000084 {
+        31:0    value => u32;
+    }
 
-register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
-    10:10   riscv as bool;
-    12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
-    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
-});
+    NV_PFALCON_FALCON_HWCFG2 @ PFalconBase + 0x000000f4 {
+        10:10   riscv => bool;
+        /// Set to 0 after memory scrubbing is completed.
+        12:12   mem_scrubbing => bool;
+        /// Signal indicating that reset is completed (GA102+).
+        31:31   reset_ready => bool;
+    }
+
+    NV_PFALCON_FALCON_CPUCTL @ PFalconBase + 0x00000100 {
+        1:1     startcpu => bool;
+        4:4     halted => bool;
+        6:6     alias_en => bool;
+    }
+
+    NV_PFALCON_FALCON_BOOTVEC @ PFalconBase + 0x00000104 {
+        31:0    value => u32;
+    }
+
+    NV_PFALCON_FALCON_DMACTL @ PFalconBase + 0x0000010c {
+        0:0     require_ctx => bool;
+        1:1     dmem_scrubbing => bool;
+        2:2     imem_scrubbing => bool;
+        6:3     dmaq_num;
+        7:7     secure_stat => bool;
+    }
+
+    NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase + 0x00000110 {
+        31:0    base => u32;
+    }
+
+    NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase + 0x00000114 {
+        23:0    offs;
+    }
+
+    NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase + 0x00000118 {
+        0:0     full => bool;
+        1:1     idle => bool;
+        3:2     sec;
+        4:4     imem => bool;
+        5:5     is_write => bool;
+        10:8    size ?=> DmaTrfCmdSize;
+        14:12   ctxdma;
+        16:16   set_dmtag;
+    }
+
+    NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase + 0x0000011c {
+        31:0    offs => u32;
+    }
+
+    NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase + 0x00000128 {
+        8:0     base;
+    }
+
+    NV_PFALCON_FALCON_HWCFG1 @ PFalconBase + 0x0000012c {
+        /// Core revision.
+        3:0     core_rev ?=> FalconCoreRev;
+        /// Security model.
+        5:4     security_model ?=> FalconSecurityModel;
+        /// Core revision subversion.
+        7:6     core_rev_subversion => FalconCoreRevSubversion;
+    }
+
+    NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase + 0x00000130 {
+        1:1     startcpu => bool;
+    }
+
+    /// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the
+    /// falcon instance.
+    NV_PFALCON_FALCON_ENGINE @ PFalconBase + 0x000003c0 {
+        0:0     reset => bool;
+    }
+
+    NV_PFALCON_FBIF_TRANSCFG[8] @ PFalconBase + 0x00000600 {
+        1:0     target ?=> FalconFbifTarget;
+        2:2     mem_type => FalconFbifMemType;
+    }
+
+    NV_PFALCON_FBIF_CTL @ PFalconBase + 0x00000624 {
+        7:7     allow_phys_no_ctx => bool;
+    }
+}
 
 impl NV_PFALCON_FALCON_HWCFG2 {
     /// Returns `true` if memory scrubbing is completed.
@@ -288,108 +410,42 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
-    1:1     startcpu as bool;
-    4:4     halted as bool;
-    6:6     alias_en as bool;
-});
-
-register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
-    31:0    value as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
-    0:0     require_ctx as bool;
-    1:1     dmem_scrubbing as bool;
-    2:2     imem_scrubbing as bool;
-    6:3     dmaq_num as u8;
-    7:7     secure_stat as bool;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
-    31:0    base as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
-    23:0    offs as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
-    0:0     full as bool;
-    1:1     idle as bool;
-    3:2     sec as u8;
-    4:4     imem as bool;
-    5:5     is_write as bool;
-    10:8    size as u8 ?=> DmaTrfCmdSize;
-    14:12   ctxdma as u8;
-    16:16   set_dmtag as u8;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
-    31:0    offs as u32;
-});
-
-register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
-    8:0     base as u16;
-});
-
-register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
-    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
-    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
-    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
-});
-
-register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
-    1:1     startcpu as bool;
-});
-
-// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
-// instance.
-register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-    0:0     reset as bool;
-});
-
-register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
-    1:0     target as u8 ?=> FalconFbifTarget;
-    2:2     mem_type as bool => FalconFbifMemType;
-});
-
-register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
-    7:7     allow_phys_no_ctx as bool;
-});
-
 /* PFALCON2 */
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
-    7:0     algo as u8 ?=> FalconModSelAlgo;
-});
+nv_reg! {
+    NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base + 0x00000180 {
+        7:0     algo ?=> FalconModSelAlgo;
+    }
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
-    7:0    ucode_id as u8;
-});
+    NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base + 0x00000198 {
+        7:0    ucode_id => u8;
+    }
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
-    31:0    value as u32;
-});
+    NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base + 0x0000019c {
+        31:0    value => u32;
+    }
 
-// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
-// element. Be conservative until we know the actual size or need to use more registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
-    31:0    value as u32;
-});
+    /// OpenRM defines this as a register array, but doesn't specify its size and only uses its
+    /// first element. Be conservative until we know the actual size or need to use more registers.
+    NV_PFALCON2_FALCON_BROM_PARAADDR[1] @ PFalcon2Base + 0x00000210 {
+        31:0    value => u32;
+    }
+}
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
-    0:0     halted as bool;
-    7:7     active_stat as bool;
-});
+nv_reg! {
+    NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base + 0x00000388 {
+        0:0     halted => bool;
+        7:7     active_stat => bool;
+    }
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
-    0:0     valid as bool;
-    4:4     core_select as bool => PeregrineCoreSelect;
-    8:8     br_fetch as bool;
-});
+    NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase + 0x00001668 {
+        0:0     valid => bool;
+        4:4     core_select => PeregrineCoreSelect;
+        8:8     br_fetch => bool;
+    }
+}
 
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
@@ -397,15 +453,19 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 pub(crate) mod gm107 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
-        0:0     display_disabled as bool;
-    });
+    nv_reg! {
+        NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }
 
 pub(crate) mod ga100 {
     // FUSE
 
-    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
-        0:0     display_disabled as bool;
-    });
+    nv_reg! {
+        NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
+            0:0     display_disabled => bool;
+        }
+    }
 }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
deleted file mode 100644
index ed624be1f39b..000000000000
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ /dev/null
@@ -1,739 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! `register!` macro to define register layout and accessors.
-//!
-//! A single register typically includes several fields, which are accessed through a combination
-//! of bit-shift and mask operations that introduce a class of potential mistakes, notably because
-//! not all possible field values are necessarily valid.
-//!
-//! The `register!` macro in this module provides an intuitive and readable syntax for defining a
-//! dedicated type for each register. Each such type comes with its own field accessors that can
-//! return an error if a field's value is invalid. Please look at the [`bitfield`] macro for the
-//! complete syntax of fields definitions.
-
-/// Trait providing a base address to be added to the offset of a relative register to obtain
-/// its actual offset.
-///
-/// The `T` generic argument is used to distinguish which base to use, in case a type provides
-/// several bases. It is given to the `register!` macro to restrict the use of the register to
-/// implementors of this particular variant.
-pub(crate) trait RegisterBase<T> {
-    const BASE: usize;
-}
-
-/// Defines a dedicated type for a register with an absolute offset, including getter and setter
-/// methods for its fields and methods to read and write it from an `Io` region.
-///
-/// Example:
-///
-/// ```no_run
-/// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
-///    3:0     minor_revision as u8, "Minor revision of the chip";
-///    7:4     major_revision as u8, "Major revision of the chip";
-///    28:20   chipset as u32 ?=> Chipset, "Chipset model";
-/// });
-/// ```
-///
-/// This defines a `BOOT_0` type which can be read or written from offset `0x100` of an `Io`
-/// region. It is composed of 3 fields, for instance `minor_revision` is made of the 4 least
-/// significant bits of the register. Each field can be accessed and modified using accessor
-/// methods:
-///
-/// ```no_run
-/// // Read from the register's defined offset (0x100).
-/// let boot0 = BOOT_0::read(&bar);
-/// pr_info!("chip revision: {}.{}", boot0.major_revision(), boot0.minor_revision());
-///
-/// // `Chipset::try_from` is called with the value of the `chipset` field and returns an
-/// // error if it is invalid.
-/// let chipset = boot0.chipset()?;
-///
-/// // Update some fields and write the value back.
-/// boot0.set_major_revision(3).set_minor_revision(10).write(&bar);
-///
-/// // Or, just read and update the register in a single step:
-/// BOOT_0::update(&bar, |r| r.set_major_revision(3).set_minor_revision(10));
-/// ```
-///
-/// The documentation strings are optional. If present, they will be added to the type's
-/// definition, or the field getter and setter methods they are attached to.
-///
-/// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
-/// for cases where a register's interpretation depends on the context:
-///
-/// ```no_run
-/// register!(SCRATCH @ 0x00000200, "Scratch register" {
-///    31:0     value as u32, "Raw value";
-/// });
-///
-/// register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
-///     0:0     completed as bool, "Whether the firmware has completed booting";
-/// });
-/// ```
-///
-/// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
-/// providing its own `completed` field.
-///
-/// ## Relative registers
-///
-/// A register can be defined as being accessible from a fixed offset of a provided base. For
-/// instance, imagine the following I/O space:
-///
-/// ```text
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///  0x100--->+------------CPU0-------------+
-///           |                             |
-///  0x110--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           |                             |
-///           |                             |
-///  0x200--->+------------CPU1-------------+
-///           |                             |
-///  0x210--->+-----------------------------+
-///           |           CPU_CTL           |
-///           +-----------------------------+
-///           |             ...             |
-///           +-----------------------------+
-/// ```
-///
-/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
-/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
-/// them twice and would prefer a way to select which one to use from a single definition
-///
-/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
-///
-/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
-/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
-/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
-/// into code:
-///
-/// ```no_run
-/// // Type used to identify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
-/// register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
-///     0:0     start as bool, "Start the CPU core";
-/// });
-///
-/// // The `read`, `write` and `update` methods of relative registers take an extra `base` argument
-/// // that is used to resolve its final address by adding its `BASE` to the offset of the
-/// // register.
-///
-/// // Start `CPU0`.
-/// CPU_CTL::update(bar, &CPU0, |r| r.set_start(true));
-///
-/// // Start `CPU1`.
-/// CPU_CTL::update(bar, &CPU1, |r| r.set_start(true));
-///
-/// // Aliases can also be defined for relative register.
-/// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
-///     1:1     alias_start as bool, "Start the aliased CPU core";
-/// });
-///
-/// // Start the aliased `CPU0`.
-/// CPU_CTL_ALIAS::update(bar, &CPU0, |r| r.set_alias_start(true));
-/// ```
-///
-/// ## Arrays of registers
-///
-/// Some I/O areas contain consecutive values that can be interpreted in the same way. These areas
-/// can be defined as an array of identical registers, allowing them to be accessed by index with
-/// compile-time or runtime bound checking. Simply define their address as `Address[Size]`, and add
-/// an `idx` parameter to their `read`, `write` and `update` methods:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
-/// register!(SCRATCH @ 0x00000080[64], "Scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// // Read scratch register 0, i.e. I/O address `0x80`.
-/// let scratch_0 = SCRATCH::read(bar, 0).value();
-/// // Read scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
-/// let scratch_15 = SCRATCH::read(bar, 15).value();
-///
-/// // This is out of bounds and won't build.
-/// // let scratch_128 = SCRATCH::read(bar, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime index returns an error if it is out-of-bounds.
-/// let some_scratch = SCRATCH::try_read(bar, scratch_idx)?.value();
-///
-/// // Alias to a particular register in an array.
-/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(FIRMWARE_STATUS => SCRATCH[8], "Firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let status = FIRMWARE_STATUS::read(bar).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(SCRATCH_INTERLEAVED_0 @ 0x000000c0[16 ; 8], "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(SCRATCH_INTERLEAVED_1 @ 0x000000c4[16 ; 8], "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-///
-/// ## Relative arrays of registers
-///
-/// Combining the two features described in the sections above, arrays of registers accessible from
-/// a base can also be defined:
-///
-/// ```no_run
-/// # fn no_run() -> Result<(), Error> {
-/// # fn get_scratch_idx() -> usize {
-/// #   0x15
-/// # }
-/// // Type used as parameter of `RegisterBase` to specify the base.
-/// pub(crate) struct CpuCtlBase;
-///
-/// // ZST describing `CPU0`.
-/// struct Cpu0;
-/// impl RegisterBase<CpuCtlBase> for Cpu0 {
-///     const BASE: usize = 0x100;
-/// }
-/// // Singleton of `CPU0` used to identify it.
-/// const CPU0: Cpu0 = Cpu0;
-///
-/// // ZST describing `CPU1`.
-/// struct Cpu1;
-/// impl RegisterBase<CpuCtlBase> for Cpu1 {
-///     const BASE: usize = 0x200;
-/// }
-/// // Singleton of `CPU1` used to identify it.
-/// const CPU1: Cpu1 = Cpu1;
-///
-/// // 64 per-cpu scratch registers, arranged as an contiguous array.
-/// register!(CPU_SCRATCH @ CpuCtlBase[0x00000080[64]], "Per-CPU scratch registers" {
-///     31:0    value as u32;
-/// });
-///
-/// let cpu0_scratch_0 = CPU_SCRATCH::read(bar, &Cpu0, 0).value();
-/// let cpu1_scratch_15 = CPU_SCRATCH::read(bar, &Cpu1, 15).value();
-///
-/// // This won't build.
-/// // let cpu0_scratch_128 = CPU_SCRATCH::read(bar, &Cpu0, 128).value();
-///
-/// // Runtime-obtained array index.
-/// let scratch_idx = get_scratch_idx();
-/// // Access on a runtime value returns an error if it is out-of-bounds.
-/// let cpu0_some_scratch = CPU_SCRATCH::try_read(bar, &Cpu0, scratch_idx)?.value();
-///
-/// // `SCRATCH[8]` is used to convey the firmware exit code.
-/// register!(CPU_FIRMWARE_STATUS => CpuCtlBase[CPU_SCRATCH[8]],
-///     "Per-CPU firmware exit status code" {
-///     7:0     status as u8;
-/// });
-///
-/// let cpu0_status = CPU_FIRMWARE_STATUS::read(bar, &Cpu0).status();
-///
-/// // Non-contiguous register arrays can be defined by adding a stride parameter.
-/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
-/// // registers of the two declarations below are interleaved.
-/// register!(CPU_SCRATCH_INTERLEAVED_0 @ CpuCtlBase[0x00000d00[16 ; 8]],
-///           "Scratch registers bank 0" {
-///     31:0    value as u32;
-/// });
-/// register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
-///           "Scratch registers bank 1" {
-///     31:0    value as u32;
-/// });
-/// # Ok(())
-/// # }
-/// ```
-macro_rules! register {
-    // Creates a register at a fixed offset of the MMIO space.
-    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $offset);
-    };
-
-    // Creates an alias register of fixed offset register `alias` with its own fields.
-    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET);
-    };
-
-    // Creates a register at a relative offset from a base address provider.
-    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $offset ]);
-    };
-
-    // Creates an alias register of relative offset register `alias` with its own fields.
-    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
-    };
-
-    // Creates an array of registers at a fixed offset of the MMIO space.
-    (
-        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_array $name @ $offset [ $size ; $stride ]);
-    };
-
-    // Shortcut for contiguous array of registers (stride == size of element).
-    (
-        $name:ident @ $offset:literal [ $size:expr ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $offset [ $size ; ::core::mem::size_of::<u32>() ] $(, $comment)? {
-            $($fields)*
-        } );
-    };
-
-    // Creates an array of registers at a relative offset from a base address provider.
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
-            $(, $comment:literal)? { $($fields:tt)* }
-    ) => {
-        static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
-    };
-
-    // Shortcut for contiguous array of relative registers (stride == size of element).
-    (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        register!($name @ $base [ $offset [ $size ; ::core::mem::size_of::<u32>() ] ]
-            $(, $comment)? { $($fields)* } );
-    };
-
-    // Creates an alias of register `idx` of relative array of registers `alias` with its own
-    // fields.
-    (
-        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
-    };
-
-    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
-    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
-    // to avoid it being interpreted in place of the relative register array alias rule.
-    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        static_assert!($idx < $alias::SIZE);
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
-    };
-
-    // Generates the IO accessors for a fixed offset register.
-    (@io_fixed $name:ident @ $offset:expr) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<T, I>(io: &T) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                Self(io.read32($offset))
-            }
-
-            /// Write the value contained in `self` to the register address in `io`.
-            #[inline(always)]
-            pub(crate) fn write<T, I>(self, io: &T) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                io.write32(self.0, $offset)
-            }
-
-            /// Read the register from its address in `io` and run `f` on its value to obtain a new
-            /// value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, F>(
-                io: &T,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io));
-                reg.write(io);
-            }
-        }
-    };
-
-    // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<T, I, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                let value = io.read32(
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn write<T, I, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                const OFFSET: usize = $name::OFFSET;
-
-                io.write32(
-                    self.0,
-                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
-                );
-            }
-
-            /// Read the register from `io`, using the base address provided by `base` and adding
-            /// the register's offset to it, then run `f` on its value to obtain a new value to
-            /// write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base));
-                reg.write(io, base);
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of registers.
-    (@io_array $name:ident @ $offset:literal [ $size:expr ; $stride:expr ]) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from its address in `io`.
-            #[inline(always)]
-            pub(crate) fn read<T, I>(
-                io: &T,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            #[inline(always)]
-            pub(crate) fn write<T, I>(
-                self,
-                io: &T,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, idx));
-                reg.write(io, idx);
-            }
-
-            /// Read the array register at index `idx` from its address in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<T, I>(
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to the array register with index `idx` in `io`.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<T, I>(
-                self,
-                io: &T,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
-            /// new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<T, I, F>(
-                io: &T,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-
-    // Generates the IO accessors for an array of relative registers.
-    (
-        @io_relative_array $name:ident @ $base:ty
-            [ $offset:literal [ $size:expr ; $stride:expr ] ]
-    ) => {
-        #[allow(dead_code)]
-        impl $name {
-            pub(crate) const OFFSET: usize = $offset;
-            pub(crate) const SIZE: usize = $size;
-            pub(crate) const STRIDE: usize = $stride;
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            #[inline(always)]
-            pub(crate) fn read<T, I, B>(
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize,
-            ) -> Self where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-                let value = io.read32(offset);
-
-                Self(value)
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            #[inline(always)]
-            pub(crate) fn write<T, I, B>(
-                self,
-                io: &T,
-                #[allow(unused_variables)]
-                base: &B,
-                idx: usize
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                build_assert!(idx < Self::SIZE);
-
-                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
-                    Self::OFFSET + (idx * Self::STRIDE);
-
-                io.write32(self.0, offset);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            #[inline(always)]
-            pub(crate) fn update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                let reg = f(Self::read(io, base, idx));
-                reg.write(io, base, idx);
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_read<T, I, B>(
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result<Self> where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::read(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Write the value contained in `self` to `io`, using the base address provided by
-            /// `base` and adding the offset of array register `idx` to it.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_write<T, I, B>(
-                self,
-                io: &T,
-                base: &B,
-                idx: usize,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-            {
-                if idx < Self::SIZE {
-                    Ok(self.write(io, base, idx))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-
-            /// Read the array register at index `idx` from `io`, using the base address provided
-            /// by `base` and adding the register's offset to it, then run `f` on its value to
-            /// obtain a new value to write back.
-            ///
-            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
-            /// access was out-of-bounds.
-            #[inline(always)]
-            pub(crate) fn try_update<T, I, B, F>(
-                io: &T,
-                base: &B,
-                idx: usize,
-                f: F,
-            ) -> ::kernel::error::Result where
-                T: ::core::ops::Deref<Target = I>,
-                I: ::kernel::io::IoKnownSize + ::kernel::io::IoCapable<u32>,
-                B: crate::regs::macros::RegisterBase<$base>,
-                F: ::core::ops::FnOnce(Self) -> Self,
-            {
-                if idx < Self::SIZE {
-                    Ok(Self::update(io, base, idx, f))
-                } else {
-                    Err(EINVAL)
-                }
-            }
-        }
-    };
-}

-- 
2.52.0

