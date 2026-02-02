Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C2259C92;
	Mon,  2 Feb 2026 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770068265; cv=fail; b=fhEc65Pa8ZX0dT0+kYlpmBGnBdyCqw+gZZQfThj8sbljEbRhPcGClJSQ14mGPWk39nxG1LbDeey/PVFFi5TDthOGTNqbP0x1uj/2lq2cmmLhcLDC09nb1Uy+EyvGJRsodAnbjphtlecBvgqBlv2SFmcY7lPs+YxV1rhFHxXdMrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770068265; c=relaxed/simple;
	bh=ujLbJ81hU1SFkLzaDWhTR5AKkGQag07ROkYuz0VDhHQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LUpLXe17Yr61kMya2FeLo/xNfuzn2PfZEjZ0PO5oqKXch3Hj9ZOCYKzQ+2rFpgDKSao4oay/j0RsPf5vseoykanknIOvbek34+JxGlpzPv4sv96kfllCluGAzxup00Exv6tVkIfmR+AgTnJ5imMLIRKrhkH1C6+Wojnbiae/JOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P1Z2Ox9i; arc=fail smtp.client-ip=40.93.196.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P1Z2Ox9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5rGY4GfvvjpCnd4zgQCcE4Jn4CO12HT0jEv8PyM58p1nSlvusOX0NaLEdZP2PfMvurYQt5wn1I1u4ppOPn9WyIe+v0gqSWo1w0/LQ8EfFRrYwWQsEpgHi+AsoEcvhCBpurmX1/chyy62iGnB9Mx8AsOolQqU3/OY0/OdTRzOtaML/s4zEcTEFvg79FRA9mQazEMd+Ngt/EmxMXxgDO5GvK2bVVKeP66Nh2B48S9b+Rtv9K8AVhOFUjAmjd61HCYPMVHZDpe4os2XzqCVE4eTG29bu2wDK6cxDbYJsSEZRpHduIhgejpM0Ht8r6niY0b8SD/Kwz9TEgA+huEQvnvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j2iJ8y71UxAD763k/sQEDCGQgNSh/7+e7QH36slBEc=;
 b=hPTmWO+wS4tQW3+tbiXMl48jtTJArBrHcnIXlaZXDFRIv9xgIxEKs1IOY+dTxayBDck87gyre5BReum6oLWZFB0WNo5LlHaYj0rkotaAz6PzSNfL43OOs61OpOMDPCA5NSrkyvBPRXAXLkj9nmzwvcG5lOXf39DcoIib4xO1WWhAKHhYoCPpjYXw323VXyX1I0ScBBfUtJLn8XJhIjwClvBQRIaG0Kz0U/JIpvHTtBK2U6hEQDJofcDqQgBgqBS73g+N6L4O3ytcuUsrPqgmOjSOcu9/oJoloZzRWbVyrWdGBd2GvatnFvQ3FqP09Z56Rvtn4XN/kGEUtiOvd7xzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j2iJ8y71UxAD763k/sQEDCGQgNSh/7+e7QH36slBEc=;
 b=P1Z2Ox9i0MctVJgYaLi4r1lI2KDSGv7wdXtnJG2n0zxESP2alZ0zlGQyDHjcgcwKXpwfH6funZe81K8oml/JhKvn5aPjsmvU7jBGQAA+R1Yi2/1SJl5TYhLnYuKsXdLZPAqS+T85TukHLHJM3PXJrUUlQT0CRKkFdAMwyLNZGcHoMjTOIhAzWU6zx6BigCKcjXAG636aWDu9Ett+o150bOnUKpBHKGVJlhwJfSzc8EyIlGuJ4fplfzaX93rA7rloPAC+fOO0viUCPFQtJrbIxONIsNE/+xHDJI3qpX+XoCtpFMC30RfKHxawsds34rhl9z6N6w5PKpW74+4ijC9wSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 21:37:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 21:37:37 +0000
Message-ID: <8a708e6c-d02d-4f71-b026-83d5549989fd@nvidia.com>
Date: Mon, 2 Feb 2026 13:37:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
 <20260131005604.454172-9-jhubbard@nvidia.com>
 <DG4K5PA5DYIF.1BWA30EA8G1LQ@garyguo.net>
 <DG4K7YGOOHA0.PR72G7RL07PE@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG4K7YGOOHA0.PR72G7RL07PE@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb5790b-6ff2-4601-a2b2-08de62a348a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWw2S3hEMUJacFN1VXRKR2NTT2c3R3IxcE1jY0ZCSXF1QXhUbXZmWlpWSW5E?=
 =?utf-8?B?c0thNGJQOWllcmZXek5zbG52N3U3L3hTeDZVUlFOMWNPVWJnQWJuY09JZm9y?=
 =?utf-8?B?SHJ1RTF0YVp6L0wzYVlZQkdTNEE3a1NsT3RsTHJRWSs0NEh6YW9BcDhKVW5i?=
 =?utf-8?B?TDg5amJRNVYvNFFVdlJjcnUwRHhKVmRZRTlDZjhQUkpSWEkxVTRrdTRha0w0?=
 =?utf-8?B?STh5cVFRTzlYUzV2QnVRNWprUWFiclJwS01XZU9CTWEwWEZYM1RsTlZrRFM2?=
 =?utf-8?B?dE8yS0hCNW95WHJ5MEZYc3FPUVhKWVVPK1grbHhJNHJtdFhNUXhERzNwV01l?=
 =?utf-8?B?RDROM1REM2tIaEdtSUYxMUlBdVJmcUpGckptemFLMWY4aG9SWU95R0UxUG91?=
 =?utf-8?B?U0dYQVEvMTZHVXlUQTlvazBDYWlmNGZGbHkwbThFK2hyOVhISEk4MzBCbU4w?=
 =?utf-8?B?MVgyMXNrdUJlS3hZN0Jza0hwOWxFY1E3SmhwUXhsMVc3MTZvRFN1TWJyaUFy?=
 =?utf-8?B?b2ZtTHVmWFc4b2xMdlh0MmN3RnF4YzQvMW9lbm04clN4MHoyNThZbGgxME8y?=
 =?utf-8?B?UFduTHVBUW12M2NTVWtjOGl6VnBENXUxTDlla1l0T0JVb0RndW9OMWdxL0VT?=
 =?utf-8?B?SjFVeFBnc0lVNjZnMXNjdEgzZ3N3L01GS3pibFRiQUphMjJWT2ZJWmxjWnBQ?=
 =?utf-8?B?L3R4cUgzUVJoUmoxR2RpMHBMUm1BcEYwekZNOWs4TUphU1dZTW1nUFlTM1Mw?=
 =?utf-8?B?Ymg4aUM3MXhPcWFWTWNTV28xUHNTQ0lXKzdtM3JCTXQxSEpBYjlMMzlod2tr?=
 =?utf-8?B?cHhpODRuQVFjNEVjZGlOdS84YzlsVEhvdjFGZnR3SFRadzhwTDZjUXhRdnJh?=
 =?utf-8?B?YlZYbU1xdDlqU2lRTzVPMGJVdzg1YjZKdmNiL0dkK2ZyMlJFSkd4SFVQNzl5?=
 =?utf-8?B?NTRVSHBRK3hZUzN5eC9YbnlKRFFsaU82Rm9aaFF5bkJsdFpXUnJiTWRrTTlX?=
 =?utf-8?B?bmJnNkVhSy9xU2JUYkdoUXRnbU45Wm9MRXZ2SDdneWFzSHZXUFFEUnpJdnZH?=
 =?utf-8?B?dHRXeDhOOCtBd01JMWE3NnNQaDJXYkxPZ2xkRjlDQlZxTnBrS3pEQlY0MVM4?=
 =?utf-8?B?Mk9XUStlUlY5eG83b1Bpa2pMcktBMFlLM3VlZk8rNC9YUG54cittWDVnZmdh?=
 =?utf-8?B?SE1LbjI3a2NEQmg4cnI0Yk9DeGc1emh5YkpxQlBzM0Y4YlkrRGZIQXVaUk9V?=
 =?utf-8?B?YkV1MzBXdmQ2UUlRMkxHcURKYmM1Zk9rZ1l0N0V2WGZmek5aMnV0Z09pcDJ2?=
 =?utf-8?B?Vm9jWGdzTmRubGNsSk11R1pnUnNFdFlFdm9PMDJpQURVdTZ1L3Jyb1hxYWMw?=
 =?utf-8?B?bFJSMG5IeHhsZ1dzRTgranllTTlhVWtLSTkzSHhKSWV0QzVISUNWK2k0cTJi?=
 =?utf-8?B?cFNnRDZaRk5kWnZPVVR1ZzJuZ3ZNQ3l4Zkd5Z2p3NHFUL0N6WjJGS3RObXZO?=
 =?utf-8?B?b0NiUFpVVE8rNVJCQTExd3ZDWlR0NmJCNmMzTkJwTHllNCt4a3ZSREdHZ1lK?=
 =?utf-8?B?TFROaVlpbnhoNXMzMEZidHE4OXUraFJIT2hjUjZrcFNUeFJRVmtNdnBJWFIz?=
 =?utf-8?B?ZC9DczNPeWtTdDBlUWg3TktUUEwwMmFLWUxFTnJKeE1hK0dWOEdUdE10TWMw?=
 =?utf-8?B?Q1FITkRXRVkwbURIUHQxcUp1Q0dJdU1CaUlIeGc1REI2WDhoTXpWcTV6Ymtj?=
 =?utf-8?B?Uy9YcExrZSs2UXdySk9NN2dTd3BvMk84c2R6SGJQMjJLOWVSSXU4akN2cmx5?=
 =?utf-8?B?RFhxaVlaeUxhc3A3UG1SeWNJbktGNUkrdDhYYVBVTmtjZlNYd0RPeEFyUGRr?=
 =?utf-8?B?ZCtWdk5JaDVoeEd3eDM1STRNWEtieU1TeUx2dUJWQ1NRanE3NmpQYkZ0dUxn?=
 =?utf-8?B?QmdyRUt5Q1VnUWh1R0tOY3VxTUYxbXdrRk11VWlWMVZVYlN5THdneVJNYXMy?=
 =?utf-8?B?ZSt1dGVodnpqNDczNG0xU3puQWZEVC9GTUdYYnhoQWVVTmdITk5xek1hRkFm?=
 =?utf-8?B?Myt3RmhWVCtRVUNHY1JIcVptUkxUbmVyYjlidlNTQU5ySFJJcWI2bzNuSWZa?=
 =?utf-8?Q?FgHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEJpRlJVM1lxcGxxcXpZV0tCSlVPcGpTWk02SitYY2lXUzI4TFY5L2UxR2Ey?=
 =?utf-8?B?UGhrdVJxcmpoMWttd01nSWkwQU9OZU9lNGZqb3UxbVBDUUQrelZ6N3pONTFB?=
 =?utf-8?B?YWowak10QUZRZXRGcTZpbytxazBrZjhCaEpKQlVRRmtPNWtQdCtmSFRPOVlw?=
 =?utf-8?B?MitkVnpheHdoNXorOTI0V0pMRm4vRnIzS3o2UG44aFZlaC9SQjEyT0tUdnFF?=
 =?utf-8?B?RjhicVpIekplRU12YXcwT2dET2dLUEJ0VURyT3N5RUExOWJUK3VBMmsyVlRy?=
 =?utf-8?B?SXRic0dVcVV4bW5CNkNQeCtMdWNzVmFDbFpKRUpGVGM0TGtrNlF1a01hOGdC?=
 =?utf-8?B?TEZmT1JKek9VaTY0cmVVWXdSdXU3MWh6dThueHhDeHZmc08yV0NPK2FXUW1v?=
 =?utf-8?B?Ykw2T04vSU16c2VyOWRDaXcybGIvSmRwOG9DRGN3NU1DVlBjZkl4S3FoaDFK?=
 =?utf-8?B?SlpNZXhyTmNjanQ5WU45cFZPak0raWhYNGREdG5QSE9DZm0rQlRtREhodDFZ?=
 =?utf-8?B?U3VDWEJrM1JtaC9UdWJuTFcycTFOdDlkWkFaWmo1RCtycW5iNVhpNVVGblp5?=
 =?utf-8?B?VElENlVtcDBldzRqVVRZMWxuaEVPdFRKM1RheGx0R0pHeUhxWUlVN3ZCdTR6?=
 =?utf-8?B?TnFENGxzZ2hHaDB3ZkN1ekNDUnhWR3drSmd3aTZMRTR3MUVNZDJnUVlKWnAr?=
 =?utf-8?B?dWt6WFIrVzZmU0RtdjdYRk1rcDVsMTZNMG9ONHpnUk9SZ3MxUTkzMnIwanhM?=
 =?utf-8?B?b0RBSmJKN01CaEwrQ3VEci9oWkpnUWRyZ3pkVkV5am1xRURnWmVPSEt0Q1lH?=
 =?utf-8?B?RTB1WTh2cnZWNEd1Z0Y3eW9TcjA2TzY1cEUwN2lHVnVLSFY3SjVPd3czZTZy?=
 =?utf-8?B?ckltYS9CM1ZyQXVpVWZNT3dpQTdYcE9qOXhhb0k1VHpxYlJOMEs2YkVyR1Zn?=
 =?utf-8?B?eFg5a1Zzc1R1NDlaSjhqTmJYNDFUUko1QmZselU5dHpWRzFSYzI2eGNsNUNy?=
 =?utf-8?B?SFBUM0svSUVvZzhKQ3VPM3J4TkU4TUV0MUpQOTJKYVVsL242dDJXc3hkd1h0?=
 =?utf-8?B?NFRuNUJLOVVzK0lWQlJDeEwrSmNsMkZpdG5GY3lyQjFpMy9Qb0oxT3laeU1Z?=
 =?utf-8?B?dGhiYzhCQUtnNk53N2lTRG1nUUduYWVYZ3hYbFMyaEdNRDlmb1UvMllBeHpU?=
 =?utf-8?B?SVVGek80VDduNytweEpQbnF0RkRkd3k0eGV2ZmJrYTdEcVNPWEwvVU16eHp0?=
 =?utf-8?B?WllGVWVaTjkwK2h2Uzgyb0dqTlQ1c0xLVzdEM0YyMGFNbDYybzdsTlU4RHcv?=
 =?utf-8?B?bHdWR0xURmlJbTNpdmk0MnBiWjBOU252TG1qanllZzkyb0ZMcUFKQk9yZHVG?=
 =?utf-8?B?c2k0V2FvSTh6dkFuSWtUbVljM0dCV1pRVklUaER0U2U1TGw3aWdESHNabzdy?=
 =?utf-8?B?ZC93UnU3dzV6MEEzTXhoTDBlTGVxL2RvNE9XY25nR2N5TXplSVNDZ09sQkZV?=
 =?utf-8?B?SGN0QUEveVhxbXRMWSt5L1Z2OHJYcHJXb3ZqcjZ1c1hybDJPelZaM29qSTNy?=
 =?utf-8?B?MU9mS2M4a3RERXBxUEJjc1ZuTkJJR2JCamp1M3lJcFJmYWo5SVhWVDYyUC9o?=
 =?utf-8?B?ODJJRWZWbkNHcGJnRVR2MUJPd0o2R1lJd3NvYkJUYWx6RlRodjhxQy8xQ2Fu?=
 =?utf-8?B?ZGpXQjBSdmJmYmlNWWx0RnYvSTlER0FDRDQzbVhaU29tSzVEM3Mxc1ZJbXZn?=
 =?utf-8?B?b0kzaWRseUdXZ3l4T1dKaENjeHQwaUpSWFVRLzZ0WERDMTFCQll4Zm1jdVFB?=
 =?utf-8?B?KzRXaENLVEZOMFZrRHprSGFIcXBuM0FxT2FWajNPYXE2bDV2OUxZNjVDODlJ?=
 =?utf-8?B?VjJRd2hRVmJnS0dBbnBVUHQ4ZmtLSTBRWVIwclhDdklPRWtsNkhjamYrTUZa?=
 =?utf-8?B?Qk5SK01DMXVmcTRpMEN3dGVSaVVoWmgvUjlTaG9IYnp5MUwrRDhiUkhzV1dO?=
 =?utf-8?B?bWpGSlA1dDR2WUhTY2xlYW9sLzNTQVpjTGJ5MERPRkJBcVNKbDBqQ0YwSkEx?=
 =?utf-8?B?YVZRQVcyL0FUMFptMmI0QTVCZ1ZGSWJNOTRDckZ0YUh2TEJEMWMrN1pRNWlV?=
 =?utf-8?B?WVMzQ0R2UHVmdHRHNUxMWjhsMW9yOEFxQy9LUGVYS0JWdjMvaVRuTXY3YmZ5?=
 =?utf-8?B?bE9OVmg0RElta0Z1Q3hPV3V5bWlVV2pkUk9YZEUzbGJzVlRLcHZXSytiUVZt?=
 =?utf-8?B?VzRhc0Z4ZUpIN3ozVjZCTU41RGVVVXVZQjRXdGxUcDRyM0dvOUMwZ1JWQnhO?=
 =?utf-8?B?emZielBScVQ4UGlHSmlEaE8xb0ZLTVNhS2VKUTFQMnZrVHo1VDYwQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb5790b-6ff2-4601-a2b2-08de62a348a6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 21:37:37.3400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xpu3yHTUXJfM1dUJ3rZpl1MYJXvfVlwvSwZk7Qhcerni1EAS5R3NrzC6pwbzOnv074DE9D7egncpsKh3NT2cMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277

On 2/2/26 6:52 AM, Danilo Krummrich wrote:
> On Mon Feb 2, 2026 at 3:49 PM CET, Gary Guo wrote:
>> On Sat Jan 31, 2026 at 12:55 AM GMT, John Hubbard wrote:
...
>>> +                    gfw::wait_gfw_boot_completion(bar)
>>> +                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
>>
>> I think the `as_ref()` here is no longer necessary?
> 
> Current drm-rust-next does not have the required changes yet, but it will after
> -rc1 is out. I'd recommend basing patch series on linux-next if they do not
> target the current cycle.

OK, I can do that. Maybe ASAP, so that reviewers don't have to deal with
"old" issues that are solved in linux-next?


thanks,
-- 
John Hubbard

