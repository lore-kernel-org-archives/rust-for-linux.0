Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72891A9FA8;
	Thu, 12 Feb 2026 00:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770856828; cv=fail; b=E9KpZC90aUcdBU7/OeZ4pfPMVxQ3wp2znLPrL91nIEBLnQuymRkFGcY5NmNWUNJt4zoldf+x3E9UhMiwFzgCFQsP1X7zgvBbxnDDRVPk9KFx2LX6mBDmpkOqHHzx1828JxNVCrGuNkc4Tbvywo96JZORHcanDBwidp3msk+ArqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770856828; c=relaxed/simple;
	bh=MHI1jlcP4/Cl8DnOUCi/XB3ztRQu9C+c7pkx4vZyvIc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DhD7xuUvFoVZuD+6VQEsFRybVi4ntCkyIZpQ7gtGBP+yb7/Qx5LNM5l501LLb524d+8xhs8RSQ1/rkxNvQdQCwuVGXdFbE2+0u4AEkhHsgvkXo2HPM9qJvrew3Zxi/UW+hlmfhD/KyCVeW/bX29P79tsXDKjHg7ifzVdIggIJno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RxFTt+up; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RxFTt+up"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8C1v5wbSc0n4SGhWJ3ZN+US25MN+XMGmFH3ssbaXd8TkEhQ/3n4rYZhiYU6k1fU2tdTcFsef9Cg5Kx+YC377/rg64eB+rp1uF6qbDwkyrBEunVBwbZrqBkV0VHBGUIEAu5dMqMnEyqvEj2fIJw0XJtEfLpHXhqQsQ3Cn48g2nqguGE86ccJZiav5FhZikGhf49D1dcxDckZmGSz5Xo13q3Tge/tjc4suQJNidq0zn7BAuZKG76HTagZirGQERgB2svCj7yHiS6r5cCpHWTXMCvfNS4K/OBRrjJO1ONrVzyobyiRlOX2t8IDEwmHi7J7V2xwxHYwZi7OTNpPxViC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESm85or2e2WO9K/OzVgXgGeFW9HVvPPfF97HW3amr1k=;
 b=ij9nosSQLpdIiCauOifOtnN/J4e4zEklriitNbrqfl3842qs2PWSedS7qghZbq2k9ytXOhcVDOuLfDF6/q4DJsF3EVO8drOnYfCp5bJzJx1oFTYjkfv24xid1LHQHNJAdyCWVp75vjJcVr9hdsN9KKB3bbGkfgSz7gTScYv2oURZMSUHdkXkYkfP+SfUt6cf8d2K/Sf9sDMRmC2gdzUTND9yXXaHB3EifBejzNPH2WeFSXcTLBd64N8AsMf9cLaWt7+zWSEaZTGECGCgSw/Lky9ZN+Bs7u4l8rNZ7CPylWOufvJ6j5wgeUKfXBGBeRjDxkqr9gGTdj0AnyZc5wbDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESm85or2e2WO9K/OzVgXgGeFW9HVvPPfF97HW3amr1k=;
 b=RxFTt+upybkCpKRBzAJ97fWo1TvYtf0TQOCsCINEZm7xX2Vn7Y1Rhrc4nEnebkdFu/FXsW0/oEL/3m1bCZBXZIkjil4nA6TmJdCG0/Mmuo/tSQyLVZX+5LfFz1XiMdBn5FrqLoD1xgpd+1wkPhvT14bOP0irBfm1cScfN+4VBDmrgavPZRk0O2x/YJ5c2JH16+AbR0gtyUzuZhgEz/aGoxdNx9q6vvRw5zXgjCJEn+8Xwlw/weGFSnJa3HLtxpnzuPUeluSs3x4zY/rOClNiI70H743qw/tTRTETc/f30YhlAc1DgSn/stnI8wSIRjvweQIor7Y/B1MlYGoP5kua1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5908.namprd12.prod.outlook.com (2603:10b6:208:37c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Thu, 12 Feb
 2026 00:40:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 00:40:22 +0000
Message-ID: <9848ac21-2266-4d42-b801-f4b1505b6687@nvidia.com>
Date: Wed, 11 Feb 2026 16:39:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/33] gpu: nova-core: factor .fwsignature* selection
 into a new get_gsp_sigs_section()
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
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-6-jhubbard@nvidia.com>
 <DGC1YYNXOV10.3P1P49DNY20K7@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGC1YYNXOV10.3P1P49DNY20K7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: a39fe780-4278-4d90-e41a-08de69cf4dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M21hb1dOb0xWVW04UnU2US9sYWk3aS9wczVGVWR5OHd1QmE1T3AwTGdBSWly?=
 =?utf-8?B?RVM4WGxYYVNjL2NtUWhtcndXOThrNzF0NkhDR0hhWm50UWpyeEtrNklkOW9O?=
 =?utf-8?B?RG9IdFFLV3NRU3RpQWRvc3VXNHJpMlVqZzgzNUE1QWNpYUlWU1UwTTc0RllV?=
 =?utf-8?B?cnFwNEtkck9UMlVtd21HNlFoYWMxdFhITm9ydG5LTEpIVnRORldsMnprSEpj?=
 =?utf-8?B?VjFWY0QxRGZMWkZ2QkNhM0MvamVFQ0hEWmFjWWRzclhXNUdZRlA5MHczbkJx?=
 =?utf-8?B?ZUhHdmkrbDhYcEdQQi9JSmMraEJUK1lreTZsSS9GQko1VHpoU0U2KzNqVEpS?=
 =?utf-8?B?bTdUK0ZmTksrcGlWWVp0bm9pTjJvWlZ6ZVdtMVpacVErUTh3WG40cDJUVS9z?=
 =?utf-8?B?TWkzT1ZHZTBhMENvRzJ3a3ZKV2k1eFFlTzcvY2JwSnRYN3hWTHRxSWlVUGRy?=
 =?utf-8?B?UTJPMjVaM2pSOG8xZEUzcmdBRjhrdW9KT0xJTVI1UDNYWFVvUHBYVmg3U2hs?=
 =?utf-8?B?bnN6OXJsN0I4QXFJOE02NnFIYVVHK0pEcWhhb1JYVHpFd1U2LzNIWkExQW5K?=
 =?utf-8?B?RCtXRlA2VnFwRXFiNmZKOVljNkNNYnpnT3BCVUtiSVE2YmZBVlRSZEJVRCt2?=
 =?utf-8?B?UjI1YWZ3OU9zMzNMMytMSnRlcFNXL1dkTlRjKzhJc2ZRaDVYYktPRlptZ3Ux?=
 =?utf-8?B?dU5kNzFxRFBldkhuM0JTMkdrRnM1QW9tRy92RHUvZzhJcE13Q003VmtwSisr?=
 =?utf-8?B?UEY1dTRtNnFYaUN5UG0xNGhEYzRwbUhScnRRaHRzalV1cWpqaG1kcEtlckNp?=
 =?utf-8?B?aGRIRHN6MmtITDdUUjlCSkJFVExRcUhJK1pvZjlPRER2cVcyNm5BY09LWk1T?=
 =?utf-8?B?LzlEVWNOcndXcENRSEt6YXVYeGdqbXpHME83MU9lQWxIT2phMk02KzhKbm5z?=
 =?utf-8?B?L3VZTGdHSDV4eWNmbExSTVAxSE5IdWpJaGFEQXhhSVQxdVlnR2t1ZkJYKzdF?=
 =?utf-8?B?L2lzZEtKUjZmMmI1aW9vbHRFc0cwT3J2K0s0VGV6SDRiQWQ0M3h5ZEJ1WDRM?=
 =?utf-8?B?YlNINkJ5aDJUaFRuRjl6eTJ6MmduRUtzak9XNnlBbEMrUTFrSjcwTHVLLy9B?=
 =?utf-8?B?Si83Yk1GdSthMDBJVmtZdFhmejY3YVJvMlR1eUFCUGlYZVhWQWVwSndRUHov?=
 =?utf-8?B?T1NvNkRudXpieXNFeE5GWjk2bXhqUkF4V1lqSWRjZU5lN3pkUDN2TCtwKzlq?=
 =?utf-8?B?NC9taWwzSWFZMUFLTVVuS0kvRWFIdzdIUjFOcWIvWGQydHVVMEFNVHVtbEFN?=
 =?utf-8?B?T1dRdE9EazJRQ0p3a2sxQ2JnRS9UeHJkeDltU3lvVnpPY3Y1L3FKUE1SbmZq?=
 =?utf-8?B?U3VUb3h5a2h6Zm1Od2V5MExoTFJpL1pLTTFIL3NjbzJUZFVWd0V3WkJ3RW9F?=
 =?utf-8?B?aldXYUFlUWNvZHhSeXR1UmtpK3BldnlDaVl0NEsvdmtqOGJOYzV0Z2lFVWVL?=
 =?utf-8?B?eGhpMTZxdUlsSnJ3SHVPYUJvOEdjc05ZSGpKZUtVbVozbC9mTjhQQzduZ1N2?=
 =?utf-8?B?S1Q2Rlhzd3pMNTlvNkVLbTh2VlpkQ0NRZjNEd0VzRjdROGhpbFdsWmkzQjk1?=
 =?utf-8?B?VndiTlNpaGJ1VkRmNW1nOVIyNnFnT3piNG4vRGQ5LzZ0TWNHOUZRUDJmOXo2?=
 =?utf-8?B?NHpibzV4N3lSOWsweDZxMllkelBtZWhMWnp1OVJWdXl6Zm1DSzVvSDk3Y0Fm?=
 =?utf-8?B?YURVa1BaaUszNmxlZ00zQTUxaU1rc0RTT3FGT1lOOFFlNWErR2hSbGcwQUV6?=
 =?utf-8?B?QUp3U2VheUV1ejhPTC9Dci95dUJwdGN6MjlQR2JXTlRyajhMc3BRY25JOGFR?=
 =?utf-8?B?UU44RjlsKzI4UlVjQVd3UjFGYi9ka0NVY1VOZmMvMFFLTVI2VTJyMFRUcURq?=
 =?utf-8?B?QWZZSE9hdUUvMTExSzBFYURpdXJWNW84ZExSQ2RnQ0YwUEpvQVB5SHNIUUNT?=
 =?utf-8?B?c3BZSTZBNGdpTVgwNldOY3ZpSE5adVFENlV0Qmx2cWxRSkRHaFpTdjBMSG04?=
 =?utf-8?B?ZFBCSVVsZkx2S0lpNkFkVDF2NEtzV2dYM2JQdHp4dmRLTmtuL3RhMENtTmV1?=
 =?utf-8?Q?j9E8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0tKUGZXUUhwMVJTaFFyMGxJcG4yM2twMTBkUGN3VEVrRk94NnRSR2c4SWtI?=
 =?utf-8?B?Z0hpSnZ6cXYwUkMxVVh3ZEdrL0drejdna015MnBibEozQXpkRFEzZklRTmM2?=
 =?utf-8?B?ZzI3NUNQQ3Fod1puQlBTZkE0bmo2V3ZKM01KalV6a2I2RlZWNnEyQjl0em5i?=
 =?utf-8?B?dzdHSGRRUERrVi93OWRYT3pGM3hXWkphNndCVTdWRnZmVDJBYVdPbnROQ0Vm?=
 =?utf-8?B?b0JrblBGY05TY1hlR24rcXRGcXdXczFnUFI2aFJXNTVmRkhEMTlmVnhzbUlY?=
 =?utf-8?B?VEE5ajFiMVJkRmhVUUVFbVNJdVliWlhWZGl5cXpsKzA0WUJ4d2ljMUxlWGV0?=
 =?utf-8?B?WXE3NFZ2bDYzN2tCd2VkbmxzbDhGVGEvaTdsRThURm1vZGRkSjBseXlxTkJX?=
 =?utf-8?B?dXBCUVA0Yk1ncHlhdTZMRFdiMGJka05kRzZRTlg0UnQwM0Rod1d3NU9WVU5X?=
 =?utf-8?B?OFFsbkYrTFd1d3pPK2g0UFFDOStYMTU2QXZXWXBtQS9raGcxdGVkOXRVUXZC?=
 =?utf-8?B?UFAxZ0FVZ3lMbUlqWkNnWkVNWmFlNlpRejZISVJpS1pSMlJXTWtkZnk5VGhQ?=
 =?utf-8?B?WHVodkFPSEdoTWpqNGdKNWRySERKR3ZMZ01YbjVKdXc5TEZTaEduNUpSRTRx?=
 =?utf-8?B?N0FLWHMxRTZWeWRCSGRWU1pnQi9pL1p2aEl5ZWJMV01FUjA2Zm1SQkNYc1pZ?=
 =?utf-8?B?Z2ZnamlqRE90OU5Udk80YnpHVTdTREE0Z1JxbENFN2phUDBTcWtwL1ZXa1lM?=
 =?utf-8?B?RFdyZS91S2M0VFJjS1hSUkxiWkZxM25sU3F1Rm92SkRiZ25sT1Jxc0V5L0VX?=
 =?utf-8?B?R1hpSmp3NUdTTGxLK0Q5VjVHMUhrTGpMQXNWTGg2Zk5TOFNVck5BQUMzMFhZ?=
 =?utf-8?B?dWNlKytlb3ZaQ3o2L0RlMHNWamt5ajJaWUxOS0QvQWRWYVpLT0pNclZONEVU?=
 =?utf-8?B?SjRBS0lCbjJ5Rk85S2NzRFN4MDBaSDZaMWtVODVUWWJRMXBmMnFmMFluTkR0?=
 =?utf-8?B?NXR1MEUyZFVWVk04SmhKOE1lRGZkb283RVJmWnI4d0MzTmpTdzJLR09uUStW?=
 =?utf-8?B?dnl6MnpydHIwVUwyd0hFWUJqSGw0ZlFsQzU3bVh4MmE0Y2k5eUdDTG1CVnEw?=
 =?utf-8?B?VStPb2l0cjM2RHp2N3RvUFBmSzVKeUR2UFg2QWJnYkJaRDFvWVVkd09jUEdN?=
 =?utf-8?B?OVNjSEg1dkpHSm9ZK21laWRwVlY2dmY1SEYrRElhNWppWktncDdDaGZGMXhR?=
 =?utf-8?B?UEticWhNdHJYTEk3RkFaZjlPTkFHdTVuak4vd0E4YklySlJINUhaMm5EN3RR?=
 =?utf-8?B?Smw1YTYvWjR0QTNZSW9zTC8wQnprcTk1ZkNJdnNITkxXYzVPTERNT1lrd0lJ?=
 =?utf-8?B?ZTQ3MXY2c3pBb1BPZ1JDSUlFbEx0RDVkZEx6QnY1aHpyZ2JpZC9MQVhRRmdN?=
 =?utf-8?B?bkwvaDB6WDdrSFdNdGNGU0tmZ0g3cmxxajFkdUgyLzhXSkNoZTZLc3hkNmFC?=
 =?utf-8?B?YXJQb2lxcVN1TjdjSVRFTVN3dzl5RVQ4dmY0WStnbDFldkZHWVh3Z2RJSVky?=
 =?utf-8?B?NjI0Q1l5UU9ySUtETDQzK0VCZ2toZTAwZU1xRHBtNGpiRG1IcWZTUWJldXpK?=
 =?utf-8?B?L0VBM3lZd1RFNE5UZXNicU9heHN1L0x4aE5Nc3dJeG83NWFTdDlaNVZxK011?=
 =?utf-8?B?RXhNZ3JhMVFvMS9mMm5LTExmR2orZWhNRFVWaVhPWHJhMDFHQ3Q3M3dKRDEx?=
 =?utf-8?B?eTQxK3V2dVd6TFVGY0VvUVZGMDBUSGdKRDg0c25FbmRQM3NoSFpTM1NRM2Jo?=
 =?utf-8?B?OHBBRmh6YWtNM3NYRWtsMWszSnA4WTBOMWNpN2Q4bUYrQjN1aHU0VG1NQm1t?=
 =?utf-8?B?am0xdyt4b0FJMy9Kbksvd2pYVTdNdklxaEtGUVd3YkRCUkpPNDZEcCtocExw?=
 =?utf-8?B?L2xUV0F5R09MdG5VZnVXNk9LWjl4VWNWT2hvNVI4NFZwaVNjUG9wNWhIYXJH?=
 =?utf-8?B?MWNYV01ETzBJanpmYjFJamdzS0JoN2IzSThXN0Z6dWhhcVdoWVUzT3lFNXZV?=
 =?utf-8?B?RHFuclhtT0NkcVp6YmhTNWJRcTc1Yi9yTHpUeTdWMFhOd2NtR2dJT095K1Ax?=
 =?utf-8?B?V1h0YTJoZWs5U0MxQU9CeFpqK0FGbVVSbndHOXRLMS93Z3oyTzFhYXlER3Rh?=
 =?utf-8?B?ZEdQdUN2b0dBUi9NZy9zczM5aityd2ErTXZHVTFqMHlPZ3I3aitYb0h5d1RU?=
 =?utf-8?B?MlR4Ym9XTSt4QUZhKzAxOFRwa0F6bktLOUFQTVBsOFFGc2dnZFp0V3FMcUx1?=
 =?utf-8?B?SGlGd25reG90YkNxUVMrSXBkTHF3TUwwSk1zTElNZEsyaHVBTjQrZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39fe780-4278-4d90-e41a-08de69cf4dd9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 00:40:22.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hdiqk2PeHduXHr4rllVCstZxzJzYhne0n/blPBkT317flAINNVc9VH7trKd6VsIqZRQ82Zr2nqijFcHD8TaX5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5908

On 2/11/26 2:16 AM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
...
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
>> index bc2243450989..10761716ed93 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
>>  }
>>  
>>  impl GspFirmware {
>> +    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
> 
> Please don't use the 'get' prefix, as it commonly indicates taking a reference
> count.
> 
> Let's use something like find_gsp_sigs_section().

Done, thanks for catching that.

thanks,
-- 
John Hubbard

