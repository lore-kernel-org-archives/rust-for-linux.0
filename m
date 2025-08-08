Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2089.outbound.protection.outlook.com [40.107.96.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9C4C79
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 03:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754623965; cv=fail; b=e/SQ1Eb8zSIxaISIFRd1Sy//Axk4x0l3Lh7NGOzZ1+J9UrXTFAWmpq3RA0PwQQYHBxeMwloCLsRoL660GxysxQEU+98pQPE5Kwc+ciIi+XY9ADK91buvOrwDC9zbk5IYjJfDP7qiuTvsME35Q9eG87R2tqhmndAlrz4cBt+sxgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754623965; c=relaxed/simple;
	bh=3QGsvWaqNJYe++bs1j3BrCKTvptx8TybSf+oTWHxtFc=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=pIoPNSh4hrt53IyVOXiYkCSj2/nC8P1gZn/9LPj/HolXbPO28CsFj2VjLiyHn2bUErUQcSSHruNtUGsMnArW3Xn1O7HVe+SwDJVtN+JGYqSEh1yaDk19y8L28MHs+C/xAmJBxwwGI2DemyeHBDy6WcDO1B2Si98Le6AXSSGcJDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iSCk3zsu; arc=fail smtp.client-ip=40.107.96.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iSCk3zsu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7cz61rCqQZBVnthHJIIhPonsuzeVFuCr8PEymt3bOv6furMAJC5a0ZwkDRp2bzz+nKrYSWaDYJBvpjNsJu3Q59wcG+OXAoRZKxgLjKMx7W0hJ0F/jj52ALAN7+drAPDE/MVP4cZF8Ss9y+2+uMo6mZO1yz9pU0iqTMtMoL35HgFegO6ORnP4UZb+s0/5RECFXXaGsnEnk8RhhYnSegl3EcE4GCNKveKo+v4IydGO1kBTx0jDT4xKEKFTfBMIK7QG2Xrmf8RcBoCjX2jiAx7i3pjbDeLwR1JanYeC9klXVoWOTCgzNlijPk4OicrCT0HO9O4NHR/+d35Cqq+r9JZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1YFWyb2z8N/9LX3lwHpQjfP9NmKoVuZeTqrkfddDzk=;
 b=cwIkEhtzTpr2QtWuoM6z5GUo6JoFyRnhmrJXb/LVopIOkXB1EkN5SMtUyf6QrlLQdrkm2QqItzEKvIyqihCr7ZnTf+UFjPrRktnl/86865NeMOZ47pSwhQghDaVPRC/nL6PjaKaY2eOfSkQsSG3waELCZlJlSUY5fo7p9znQqJPQd0Vo7Mt0AThx303J0HW/VBFwyh0tXU9+q4uSMVKjBObrQFtfPd7PvX6q5zJufHs7d4HkniJNXDiHaHNB20cySchLFTNYla1IvXRInG7MccLN82Dq6s4AYsjDeym/aYV+cgexh+pUYIWeWdOsa4TzWGIt2NaM/Es+VsxfEwg8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1YFWyb2z8N/9LX3lwHpQjfP9NmKoVuZeTqrkfddDzk=;
 b=iSCk3zsuMH8L2I48zd+zQwZJHmLlrlangYzfHfzcF7mlMrMGc5TYEg0ixNVZN4l6vJR9n3Pv6DkJfn/eWiEkHPA7sCXb5z6TolMRwJuQHrZTgQph5kvg0Kdx7+sJ+FYu5WIwOIP+/NylpPHRfu1CNh4UH8QVDYwrOJjZX4pOVwL5KmbHksfZWx4WR7U23Uqz4MhYMXaoKjHkxgZg9vsC6Zt0mD8Q/oJ2Tqe2DN/IgjeetrF+MbXR2XWVVQHwAqR3isMqsVAXpN+aItOplq0vmW5dqPuPyfpuSrObsEGckWru70uxqq0TrMLyORPm3ebWGRv25bfId3AtLn+PIklrfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Fri, 8 Aug 2025 03:32:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:32:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Aug 2025 12:32:35 +0900
Message-Id: <DBWQA5FJS2V7.4QFZQZA6V58L@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <lorenzo.stoakes@oracle.com>,
 <vbabka@suse.cz>, <Liam.Howlett@oracle.com>, <urezki@gmail.com>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <abdiel.janulgue@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] rust: page: define PageOwner trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-3-dakr@kernel.org>
In-Reply-To: <20250806205044.85085-3-dakr@kernel.org>
X-ClientProxiedBy: TY2PR06CA0040.apcprd06.prod.outlook.com
 (2603:1096:404:2e::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d5651d1-0ce6-46fe-056d-08ddd62c3944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STVRR3ZueW5ITmdJNmlkTkU0UFNsZ2c1V3ErMzRENXcwK0JvcXA0ZVdHUk04?=
 =?utf-8?B?R2VqT2FHMTRGajYvdVBEc1ZrcmJ2RlZsR0NHR2w0eEFDSEtYbkkwNklNbktV?=
 =?utf-8?B?MjVUcDBSTjNWaTZZc0d5NEN3eWh1UGx6bmkxMFArSnVHb202VEMxbmpJNmxR?=
 =?utf-8?B?ZG9YZEdxd0pKbjJRbjUzbU4vQ2pJNmRCWDlPeVc1dEliWUJUd25SM1pGdGJF?=
 =?utf-8?B?QTZQVGV5dXhBM0cxcmllZGN3VDI3ZVI2eWJUUHNSMUlqaktTOXl2MVZDNUVr?=
 =?utf-8?B?QmtRQmNOcjFDbTd5ZnFzUzk4UEIvYlF6ZUE5eWJZTkJtT0pSR1FTbVBZNVhv?=
 =?utf-8?B?NnkwUTJiNW1YZDN0WmVtRnBENTRpdHdDZ1BkWjEvWHdVbytDbDF5ajJjVXNY?=
 =?utf-8?B?ZHVTWm5mamRMTkJocHZ3SUh2N2Y0d0ZCbE43WXlxRW9Gamwra3oySGlqTnRY?=
 =?utf-8?B?WXduU1NaeDFmMHRrL1FpRlMrMDk0ZjlZUmQzeVduR3dBdGJLb0hhdnQrMUl2?=
 =?utf-8?B?MFZjLzBmMVFHSXp5dHFnT204MTVRT0U0SzVDMDhmZ1AydHdIRzJ4a2hoTHdI?=
 =?utf-8?B?ZDVHNmxtUklxOUErZi9IRFpmNjNsWmhIVjI0MWREUCs4OVJEWWRlbytScTVZ?=
 =?utf-8?B?TStiVzY2SnRDNFo5MFZUYThqRzMwQmdFSGlMaEgzeE1MOFl6VExtZ2cyeCth?=
 =?utf-8?B?UGxlVmpDSG1QbnVxWlNpWHQ1eHFDVTdpRTJ1bUNZQ1NJakMxS2FxaHJGbW4w?=
 =?utf-8?B?THhNZlZzSitxbzJTazVadVE3eEtydkFaY1BEUlVrbDVLdmdHaUEzakZsQ1dp?=
 =?utf-8?B?SVBYcDlFeENZU2lsSzhMOWdnYXE2aGF3M3pBOWJKTXl2SXRCOXZEakZHSmVW?=
 =?utf-8?B?bzJxbi8zbTZZRk5CR3NnNy9SSWVaNUJMamxVVkVpUk4vSkdtNnprRThxVGVo?=
 =?utf-8?B?cy9xTWVsTnZpZXhwYzNoOHlQV1lESGdOZXpuUU95NS9EeFdsb1ZVdVY2aGt5?=
 =?utf-8?B?OEU1L3Y0TVNZeHBIWmlXMXNWSTg3YmtQakJObERqTCthU1lOUDA3VTExemVO?=
 =?utf-8?B?WjI0N0NRZmlLbGJVS2lRYVNSOE5GY2VKckFiS1NMNGdyckVOMzU2NkRjU05L?=
 =?utf-8?B?OHY2VjMxNTZ0dmk3Q2ZyYllRK1lFWDRTaVhMdkRoZkNlZDZKd1RYYi9YQmRB?=
 =?utf-8?B?UzcyM1hKdVNjK0JYM2J4dmZab1V4cCtlVlhHU2NLM1VTME9vUXRVWUFra3JF?=
 =?utf-8?B?dmFWcnM2N0w1Sm0wZ0ZsU29CeWZPd0pzNlYveXRJUWhNQ3FqVndRNkJyT0Zz?=
 =?utf-8?B?VHRRWnVDTllZeEhjZEhCSzZEVndUYXJBYnhsbzVDWTFIMG50Wmt1QzAwN1NK?=
 =?utf-8?B?MlZ4cmNEUjNhQUxvSDBuYXZLR0hCb1dVRVFaUkk2NDVPbHpsWndLVjMyVFEz?=
 =?utf-8?B?Wkw2eW9DUDY3TGkrMU1vKzBxdXR2ZmZLVk1abllRS0tyVTRodjd4SXQzZ3pV?=
 =?utf-8?B?Z2xVb1lsS2EzcjkveFZLNnUvTVN5c3FqV3dkMEZDcndDSDVNbVV6MHMwMHMx?=
 =?utf-8?B?RU5tOG9acnJGaFBpSVBtRVByVi92OG1LU3VkRHBkckU5T2ZtWlg2Q3pJUWtI?=
 =?utf-8?B?am9teGh5RTJpN3NlRERUQlBWS2J4WUtCS094QXZwd0J4L3ZJQ1RrQmxLM3Nu?=
 =?utf-8?B?K2M3aDJJcklPSnFCOUtjWWZMeFYyU2VCN2hjZEVGZHdrTktBM0Y4MGN2U0l4?=
 =?utf-8?B?WU9TOFpacFJ3N1cwS0JwTU5DRW9tMUgyZEl1OXpOMjdMQWRIK3VrYy9jRmN5?=
 =?utf-8?B?Q3llUy9TZ1hGVWV0VzBWT0c4QzRsbm5KUXJ3NFJrR1dJZnNzTGlhSkxWSjVp?=
 =?utf-8?B?bDJVRFRJMHFTZGRSQXViZzF0YitCVlNoMFM2R2tjek95cUdYbE1KdXNWSEpW?=
 =?utf-8?B?dktHZWloRi80Yzg0TEVvSWZZcEFMTjFycmhvc3hkRlg3QzFUT2tRb1o2NU5G?=
 =?utf-8?B?UU9uMjh3c293PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1RnK2JMdVU0N3I4V0VBamNxekQ2OGRBbDQwc1hIVDZOOU1TcHp3enpNOXlV?=
 =?utf-8?B?cW1SVGZoYTRtUHUrQkZTaVFvSktJbnhhRjFHWEEwK0RZTnpGbVpXY1VJYndx?=
 =?utf-8?B?WnRHd3FTYTFubkxYUWVQNEVwQjZCeDl4Q21SU2FhL1A2VEdRWUQ0cEhKNDJ2?=
 =?utf-8?B?WmlMT04xWkRkaGFUZW5pMjBIcVQxby8xM1ZuVFBEUUlreEJQaHpiN2JTSW9I?=
 =?utf-8?B?bDZzd2s1OEJFK3hLVE1IekJHeGpwY2hiNDhpZnhtektiS1I5Yi9VMTR6M3Fi?=
 =?utf-8?B?STUwWXN0MnJjcU5GRXNNRGMxcDluSnd2QVg2YnVhRWkvMmM4SzJsTmo4Szhk?=
 =?utf-8?B?NG1BRkJCMVVGTWVPMVJGNlNsUXhPYzRsQ2gyUzJWNFlnVFUrRDQyYTV5Tmho?=
 =?utf-8?B?TG81NkhqUzU2ay9aL2Zoc0hVdjZXS2dNSEZXYWFiejZ5WkI0ejhRMXB1MTB1?=
 =?utf-8?B?My9MOG04MUhvNTBxeUlMNGpKekpOeFlCVW5hTnNNNWxBQWpzTUxsWjJNU05Q?=
 =?utf-8?B?d2ExUytLcU5pQ2N2d0JnUDNYaDhRZHZCRmx1aTdnUE1JOWthMHVLcTV3V2F2?=
 =?utf-8?B?SHhvYzZyY1hwcmpVS0FvN0YxVnJJc1MzclNqbGFId0ZoSEtkTFVldVphandk?=
 =?utf-8?B?RlpSWE80dFN6eC94dWtkVDkxb2tGOFQ0NHE0N3ZFaDZmTlkveS9HUHU5TFA2?=
 =?utf-8?B?OTVOTnV6QVdlVjdENW1vZFU5YitUSmlMaDlkNldySVdsRGRMWDF5K3lzbWpl?=
 =?utf-8?B?dGIxYmMzWWJKb3h6KzJXZW54OGo3MFUyWGExT1cvb3pPS2V0Z2o0WDlDM0tF?=
 =?utf-8?B?SlhLNUZZOFFwSkVNYzRnMEhuSStjbUFMTG5kYWdCd05TV0Y0Z2E3bjFEMmdO?=
 =?utf-8?B?QXVNVCt0N0dRWHZzc2s3Mlo0b2tsZTNQcDJtZ1FPVDE4MEZLQWw5L3NTejNs?=
 =?utf-8?B?UklpR0hrOEZ5UWw1ZDEyNjhvZXRBVkc5NWZQcTQ5ZmQxNzc1QzJlSGVGWlZY?=
 =?utf-8?B?dDA3Q0pvUzZ2amdyQ2toak5STWlSNkwyZ1FVa1d6cmh4dUtOVDRpMG5OU283?=
 =?utf-8?B?bk9DYXdEQ3l3Mkg3eWdOL0NCM2pqWDhlWmo4cXdDV240UnVWbS9DTC9COE1V?=
 =?utf-8?B?SWI1enZNNTNqaGtIU0dXZTUvSWwwemdka05qQ2JGZG5rdTJCeDgxUnFPRHdN?=
 =?utf-8?B?SnVoMlpjM0VxMDlqNjNnOWxacU5va1hiVFM2cmgrZXdxaWpiUFQzZDdCSlBY?=
 =?utf-8?B?RTRXMFpSUkh4WXZoMVdBM0xBQytHRys4U1JuMWxQVlZ1cS9sV1lyNzQwWFJo?=
 =?utf-8?B?dDhGbExsRmZxVWdENnp5c0RkdG12NTFqTHI4R2ZjS2k1dkFmZWJVV3RBc0Zy?=
 =?utf-8?B?WUhudjJNdW84U3VRN2cvbmhIekx0SnFvd04yV2prcHRjbmc5WUF2M2Zldkh4?=
 =?utf-8?B?MHc3NEk1QTN6dTh0Q2tocVlRSFd6cHRvNjI1bG1mSXFPR1JPeThEdTd6OXVK?=
 =?utf-8?B?Yk5HZFRJTHRPODJYUUFSMllRVUk2Yjl5OG9uRDdmY3BrNDFKVDZTL2tqM25K?=
 =?utf-8?B?ZWZsL0llaG14TVpyOGROUW5iMmFBdm5zeEpSdUs3eGRaWmtJUk84VXRJcUJM?=
 =?utf-8?B?SzdqNEdMNDJ2SDhEUVhpZGcwaVpEd2p1TnpRU1BwcmhnYktHNTgxUmYvOWNV?=
 =?utf-8?B?a3dLbWVWYkpuMmZwTENRNk5GSEEvd0RqUDlNWjhxVkZ4TlJ4RzZSRUgzZ2ky?=
 =?utf-8?B?WVZWdlFTUFFuazM1d3ptMHp2ZEhvMlpaK2dpcXFSWVhxQmxsZjN1OEhVVlZQ?=
 =?utf-8?B?NUs5VXdnZThIQmlSblpic2t2Q2QwVFA3ZzZtakJOdURTOXFaMFdKN1NYRloz?=
 =?utf-8?B?WEZabDhvaUIvL1dsQk9uNEU0TDJuZjY5dHI4RVVDZHZCdzVqdDJOdTdCekZV?=
 =?utf-8?B?QnkwcWIrYStSSGVWdkFCMHo5K1BxbWhsSXhoQU5NOURCbTBoVjNBTWRkaXRZ?=
 =?utf-8?B?NHl0Uk5UU0hGaTArL04zSGdhbm5wOWxWeGxtd1l2SW8xMTRJZ2lIOEFrYk9s?=
 =?utf-8?B?Mkw3SjBRcm9waGJvYmprU3ZKY296R0doRWRLeFg2VDEvL0pnUHRRMnFxYldO?=
 =?utf-8?B?K1NDalJmVDdnUWFucGlZeEVNRG4yOGtjMlBXQ0RBUm1icUV2R0dZUkxNZyth?=
 =?utf-8?Q?X1bMzb0bTC4s6BM9TAl9NFkTcZUu2LwsIpHbqp2FhZ4w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5651d1-0ce6-46fe-056d-08ddd62c3944
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:32:39.3279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bn9+r84fWhfp8FEXLsqztPEUy4QPWaZ1Jj1rim2x9c96V006oIPmo5QkkTgvXy0CWlPNTi81mjz9ViB4Sojkyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271

On Thu Aug 7, 2025 at 5:50 AM JST, Danilo Krummrich wrote:
> Introduce the PageOwner trait, which can be implemented by any entity
> that potentially owns one or multiple pages and allow users to borrow
> them.
>
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/page.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 631718a6ad7d..93ce4956f782 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
>      }
>  }
> =20
> +/// Represents a potential owner of one or multiple [`Page`]s.
> +///
> +/// This trait may be implemented by types that potentially hold ownersh=
ip of memory pages. It

Why "potentially"? I'd expect types implement this to be certain about
their ownership of the memory they share. :)

> +/// allows users to iterate over those pages and borrow them as [`Borrow=
edPage`].
> +pub trait PageOwner {
> +    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages=
 owned by `self`.
> +    fn page_iter<'a>(&'a mut self) -> impl Iterator<Item =3D BorrowedPag=
e<'a>>;
> +
> +    /// Returns the number of pages currently owned by `self`.
> +    fn page_count(&self) -> usize;

Should we add a mention that `page_iter` is guaranteed to yield
`page_count` pages? If this is part of the contract, should the trait be
made `unsafe` as this guarantee cannot be held by a safe trait?

If so, I am wondering whether we should also take the next step and make
`page_iter` return an `ExactSizeIterator` while requiring that its `len`
method is accurate. This would allow us to remove `page_count`
altogether.
