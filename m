Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8C427A09;
	Tue, 20 Jan 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913535; cv=fail; b=nWczHLwwVvYSsOM8d1j41d2s39plEqlumRmbFWNxk47kxb2dCk3ZelA/eSWWIGHVMcHCXhJf0KLCR33G0mBCTc5XVil7drfINesh61rrE674pykqKnlfKortQy/NZsOBWsLqrnvcN6z+CAwS6XfMVXFEbP9Rj7uh3LEvmYR2dfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913535; c=relaxed/simple;
	bh=GHH8/fF6u0KJS8KHLpVk4PMKJShm9bUaMZu/6HpbB2Y=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=Cm/N20LyzaQGKaCkQY11kiOJ/NddzIvsQfE1TbD7PMEh/XMMp5i+tlAq4mLcoWVGtWvsrb6EaAM6lRrMP6DuLU6Gzcb6NzFwqhzTzsuvr3RhndA0m5vkUfkbR634GT2WqZXR6Zip+0vQ4BGcM/k3thGNUcIdiIxerJcXbPOCrnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FapKSp8i; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FapKSp8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T42UZl2R+9FOT6JDv0LNBuIO65XDXljW8GiKx3vR6ANcBgx3uS1U0o1104eWRRV5Z4i0WKcpFgixiAt+a7m7zEfW9RgYSgIpkyRyPYmJc7yBybf5Dn47CR0Cl4LC7mK+1nsq4aqdF5XA2ZcjTfyKKoY6SfhuN44J7RNKIIkZbLncCf4VYWTFor+F47NoNFFB0wZQpYRAL2qmDgQyXE4TOevuQWE/gcffPCx1GUmSr820kMB00VxMGeG0/XUTnWyZHEW2QJWCws+ZGmRLCR5tirEZq5XbyK9v31LRm5cwWZqK/aX5sdE7k3JOUS7BnQeqGivlEZmGaMNjY7XZHgZWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEoLMxYU8nXFOGxkwPakLgp8J3qN4XYSVe8ja8lD3Vs=;
 b=ACPN8COaiz3QSL6+NqzqXq2MdrJMNKjU8qQgjzbH+k/bYJh0UrI7hVT3T2kTr/NracWy3t29rq0yFpWc5Yii27W15yx2HKRSFUsfSvVAHo2fpR1z8QDtrt7wf1nDq7E1papdA5keb+a+gPaTIFX9bRXPWjHRNqbvKXq1TuR/hIbmri53Q3Yt3HVGXJE7MZq9DcUmr2lrgL3RZux6pxP+ki546v9H2PAEbVL/BZ8wnQ4+DB9XRPvAkukJ9Isr1XDPEB6KTFKZv6/uWU1VAREAppDWEgwTlbutCzzNvzLCWgUnj+KyimULLbf/SRNVN6oTW8PaCaIXQRAw4pIQ38hXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEoLMxYU8nXFOGxkwPakLgp8J3qN4XYSVe8ja8lD3Vs=;
 b=FapKSp8itBhP+EVgjFBqXjWgXozbGw0tQeDyXp1Qn53gza2Swgrhde4A0fEJXa3tkURrlZqvmMsY2m6cavQSRpcHmfBiXRSavTQ2AzdK2DgX87H2/A49CxeF9Z+4C155StQ+Bn4r7fsF+6Wl94zhXABpP4vDfAzpoFTJj1SmiPqoTqCq1LaDJ4BQvj2MpNXZ36Gt0OsB1cmVGH2SN2QsLqeRsrnxDi4PA2Op5aRxL/6L5zqb1k+qLZvAlhT2F5TFdEqS+bHwIYDPZyp1ZuxnfBQz7w1qY0FDr2cVyQTjLUWodmVhL1tIoi9CP++na3QY3IiL78ezIm2rsN9GcJFTtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 12:52:09 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 12:52:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 21:51:59 +0900
Message-Id: <DFTFICFYMS05.1DC65YR0HDI0F@nvidia.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com>
 <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
In-Reply-To: <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
X-ClientProxiedBy: TY4P286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: b11b51f9-5928-4537-68f6-08de5822b54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1lTK1BNV0RnZlRqOXMxQnFGSW5peEx0TW16N3hrS0RaM1VZWm9mZHdFUmdU?=
 =?utf-8?B?c2FrSkFYQ2Nwc2c2MDQvTDQwaUwxQy90YW95NVFmUWphNEZMcGdjM1BISWFt?=
 =?utf-8?B?NkttaHM4VnlDMHd4TnFTNHVKSlJoSUZJTm1sV3pibEplakh6ZjhhQUhNYWJu?=
 =?utf-8?B?V3lqZDB2aWYzdVJLZExZNERLOHhPNTRocjF3S3N0UWx1bld5MFFYMk02UkhY?=
 =?utf-8?B?QVA1bXFzR2pTNTdTdlQ3RnVPR0ZHanFKVnR1VHRHRFNRNGcxd2ZyUWZXeFZV?=
 =?utf-8?B?UmNEOXpwK09xdHRuMW1mUXZqOFN0SDlrNFJmYU1yYWNabHFodDhNMFROcVBv?=
 =?utf-8?B?elRHSENVcC9OYW5yNVpwR1d2VEFuSWtUS3JGR3JpY2IxbG5oaWRXYWNpaVdT?=
 =?utf-8?B?SWYrM25mR1dnZFdtUVZWQ2ZISVVuSG9xWWJBamhadGN6b1c4aHB4dGJZQ2tC?=
 =?utf-8?B?OW1FZnlmcGZyeWVUSDVwMXZXNGtXMHRBSnI5LzZCYWIvblJLQ2dzY1lDUk9T?=
 =?utf-8?B?MHIzMG13RnFvVGs2dmN3TzFNckJ3UEJja1h6SXd0WHQ1S09CdjJiUitrS3Nw?=
 =?utf-8?B?RUJNb1MweWMvVEV5eEsrekZZZm5PUkJXSTM4dWJtOW8xOC9zdStsMUdUSDJC?=
 =?utf-8?B?YVF2cVhwblV5K0MxbG41V0NHZ1JSTUM5c0lPRlJseCtvS0dBU0Z3V0R5RllE?=
 =?utf-8?B?TWZXcFhzVnp0UVlJSUZuUUxkR2hWdWdVbGpWclAwWjR1RVFmMnJURkVXcGZj?=
 =?utf-8?B?Wjk4OUpWeHhDUnNST1dQazZNS0g0djFYaEtxU2E3T3Njd2NWeEdualRKM1hn?=
 =?utf-8?B?YmJyd0pVbmc0NmtvUUF0K1RDMC9XT0xFR2NwaXdERnZzZk1IVDNTenNMaE54?=
 =?utf-8?B?QXhQVGJZSngxYyt6L1hSTm00RmozS3AzbG1Gc0kyTkl1WUt6SkRGQnVqVHdm?=
 =?utf-8?B?UVRHdmZHVXRiVXphZ2JBNGs2V3pTbnhsU2s2RlJVQTNodjhXeVc2dzBralBa?=
 =?utf-8?B?cE9OTU03dW5TTHUzKzYvUGlzNTZGdHZvd1RiZTFTQXloWkZJSDJSZ1VQYnZO?=
 =?utf-8?B?cE5wdGlvRkc4SDNjUlVNK0ZEeWdXV3R6N0NSNVpQeFJJTmtQUHIyN25yaDZV?=
 =?utf-8?B?YmlZSkFyVzV4eDROdG8ydGdseXlZOHpQR1Rla3FQM1RuQXV0TVdEaS82T3VY?=
 =?utf-8?B?SlZaQzBZYk82d2tDTVo2THUvMTQ2OUVreTNwN2N4NkJLMjJhUGdUVFg0aFNG?=
 =?utf-8?B?cXAyRHhVRjQzU0EzVWJoaVFmK0JTSnBPUC9mUVhNMmVNTGlXVCtybWEzVlFp?=
 =?utf-8?B?ZEQ4ZkRHYitjOVhoN0pjdEVSVllkUmtFTDVueXNSQjdaejJHaDJ4WXoyejBO?=
 =?utf-8?B?Sy9NZUhYZFdIRE56bnVCeWZCQ3JEQ2NXNnhVbUZQMmV3Vmk4VUxVeDlnVG11?=
 =?utf-8?B?dmxxYVBnekdHdTRyUHFxd2VGcExZcDVPV0M0M2RvL3hLaUxmMjlXRkRKZzZ6?=
 =?utf-8?B?c0l1bjdXcU1tVDR5QUxMWWorQUQweDZ6cVdBY1hvT0JWUEEzQ1krWjJUTkZi?=
 =?utf-8?B?QVdOZ0tHUVJyK3VIcXFDTnZUZGdoTDZhM1ZKU1dNQmhFOGFrRmx4L3lxTWN4?=
 =?utf-8?B?Z0NxY1hDbnc5UUJFcWxvVFhLNDVDQ3A5V1U3dGZCVVE0MWRDQzBTS0hQaWF6?=
 =?utf-8?B?dlJwQ0RpeGxSV05vakZBMjlvWjdOUlJHZ3g5V0dQTWEyWmhXMEtOQm9LNStr?=
 =?utf-8?B?WjdtU3k0VXRtRXJBZEVCM3dBbGJ1S2hQcGpQdzBOM2FibFpVMExneHVjelVM?=
 =?utf-8?B?ekV3Y1M5V0E3L0pNSDlYRnNFOXVmTXpvZHFTOFlrd0JvUXA4ZytlL1BvS0lt?=
 =?utf-8?B?bURBV2JGa1FTb094bHJ6TFd3bFBoNEZ2elJSc2FoVEcwV3VKSjIrZG1Pd3pC?=
 =?utf-8?B?U2NXeUV1N2JFTTV0QTdKRlphb2pzendXNDZiYjVMSzRBSVZMTW5VM2o5aUVB?=
 =?utf-8?B?TFNWM0ZpYXdTdm1vU1ZuSjRnaEFaMjdIeWIrSVlkQ2VybHRRVUMzUmNia3JN?=
 =?utf-8?B?cTlZYnltWVRLWkV5UWllUDRCTko5S3Bvd0x1alVqaElaSnVnUElEMWo4b05p?=
 =?utf-8?Q?mnpc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXN1TFRDOE42SGx2Tm50ZFZhQWJzRldBeDNxWTdxNHlqeStTQklEUi9QQXZG?=
 =?utf-8?B?MEVMR0ZSeUN3bmNTNWNkRDQ4U3R4OHVUdml2UytwUGtEVWg2eW9lMUc0dEo3?=
 =?utf-8?B?WGJwVzR2eHRmYXo5eW5tRFZOSE1lMi9uY2tobWZJaldCMnJEZnFPaWk4UUdi?=
 =?utf-8?B?ZHlaTFNxbndWRTg3clN5MzQ3aHIxNmZ4akQwWllSOTgxOFZTSjg4ZWlubzVq?=
 =?utf-8?B?Vjhxb1V4akYvOFlOelQvYmtjWXdnWVptSGRSaWZveVVqZ3oyamMxdlJ6dlpG?=
 =?utf-8?B?enVnVHFSV2NGM2RsNng3OHcxUzBaUVZySzg1b0FyK21xM2czOXJPdFlTS2lF?=
 =?utf-8?B?c084OUVKU1dvWTJJLzRwQm5LWlFjNGhicjhMWlF5c3pod1R3S1YzSStzcS81?=
 =?utf-8?B?ZjZjTHR0d1RNSHpaMjFRUVJPU2YzYVNVQ25wSWNnVkg3aFZ2TjhQZWxMSzJj?=
 =?utf-8?B?TjZ3TXhZdVkvVjE5d0VVMGR5cG4wSXFGYUY3RlhDUHkvZlE2UFcxakhqNk03?=
 =?utf-8?B?UWp2aFYrV1ZnZWpVdzZmMldpY1k0OXc2eHdqdUNGSm12QktJc0E1QUVEM21k?=
 =?utf-8?B?RW1RNE5aYmc3MU9CTkNNNVpBR2VMM3J4aCtwdlJBOEsxSEtFeFIwaWpnTjRI?=
 =?utf-8?B?T1BQOXFOYk1GR2lTa2tseTlzMmZHN0NqWkRxbEthYmlyd2ZYc2t6Qzhnd0hs?=
 =?utf-8?B?UWdzTlVoRHVlVUU3elFRMzcyWUhWeG1OWFF0dmM5TTNqVm16S08zQUtCeGRH?=
 =?utf-8?B?UDYwaUs1VWNoaDF3dWljRXlnTjgzSXF1QXVlK3dGdUV5TXFMYm03bjYwcEFM?=
 =?utf-8?B?YVJIUFo1MjlMMy9WNFZVaU1NbDA3Y1l5VXhaUFpYQW1wL0Yra1lCRjRnWHZO?=
 =?utf-8?B?ZW9WZkc3MFh6bFA4YmhQUnY2WGdHQWxoWHZ0b0t0b2lqaXV4WWFyQVFCM3pT?=
 =?utf-8?B?eFE3VUNaQ2ptV2NyNkdyYWRJcnZ0MXN1bTBSZktCZldFZXZscTc1R1FxSysw?=
 =?utf-8?B?c1BuTnBtaHVOOWl1d0p6STcwOXdGTmlnV2I1NGRMbllPc1VkeFZhNU15OXRo?=
 =?utf-8?B?VVQ3VW9QVE5UdUdpRnIzMnRzRE5iZzBzNkpSRzEvcGNZaUNpK2lKNktFdWl5?=
 =?utf-8?B?a2M5MjB1citEaWFFRy8xTzBIeDNyTXJvN0tGdzFIeHJYc1JiSmtsWnZ4cUtF?=
 =?utf-8?B?S0lEckZxa1lQamwrT3MxY2RlZTNYQWpXcEpxMFVXL1RwNXEvRGNnY2Z6SkIx?=
 =?utf-8?B?SXQyRnlHdmlROGdFZHBVbWxWbG56aWJBU24rcVl0OXNxaVFlcWcwcVJrT2lP?=
 =?utf-8?B?NUxGeVdYS2h3YmhPdS9wWXJISkRwRzJYWkJDL1ZhR0ZGWWNiVUNnaENEb0kv?=
 =?utf-8?B?b0krK0FyNTdkbnZ1UUNESFp4NjZVT1F3WFVKT3JlSHVwd1lvYy81bXVjcHJz?=
 =?utf-8?B?RWVLTERja3Q1R2l6TUthQjNMTVFUUVlqeVVyWDRMUjFpdjBPRCtFNUFBTFFw?=
 =?utf-8?B?TnJ6eXBxcUc5SitBdnlKbVkycjlSKy82NkxjZHBUb3pvUDZkMHBKSlI0WUtL?=
 =?utf-8?B?em82THJJMC9QUjRZNTY0VndvMlVnYU14ZkZvdStsRUZ4ay9Sd0xCOTJLS0M5?=
 =?utf-8?B?dDc4dmdpY2pqR2gvZGFwWGVJWGc0cnc0b2NFcnBYcktwbmt1bjlnR3IxN1pQ?=
 =?utf-8?B?N1pZWWp1NG1Beis0WGwzbURqdXA4MzFWVUorMGQ1ZVVwaS9YT0wwTHZoUTlt?=
 =?utf-8?B?Y3l6alRJa1FOMm5iM2hpaGpSU3pYenUyS1BLZ293QUhhRW5yK0YxeUt3ZVJC?=
 =?utf-8?B?NDlBWHNjcysveXJ2NWlUMzJKS3NBbGF4QWNBQ1pHQjNZM28xcy8zd1huUTNi?=
 =?utf-8?B?V1NnUTlsTzFmNzIycjlpMG9NTzRFeFM1MXRMMS9acy9GZmNNbjFKc3pwSjhr?=
 =?utf-8?B?Vm5SdHRHbXBOV3MrOTFLdkIwdFJ0UTBYdWVKMFh0MnpLTW9CY3Ywc1JLbDhW?=
 =?utf-8?B?MFUwMzRiM0N4Q29mdVJFVWFOTFlpdXBnQ05vVTcwVjRpRkNlcFprSEZ0Z0pl?=
 =?utf-8?B?M2ZZRGQ5bW90VnBDUFZ5VmNLSU12ZmI0UHlQamVYZHF2MjEyeGJBVEd6VzdS?=
 =?utf-8?B?elFMQzNnbmNjV01HOUFOZ0NmRUd3bXp2WUdnOFZBd3lPSjdMSTRKK0FkN1cw?=
 =?utf-8?B?SXlhbFhpOFFjMTFXUG1sbk5ISkpmaElPSnBPNkRtamV5ajFHZGJvOXRFM3FN?=
 =?utf-8?B?TStEbnE0SWhnZUdNVmd5YitBYVJYZTZRQ3d0bVJWUSswNHQzcEdQN0tJNDNy?=
 =?utf-8?B?MEQybGhENTBGVnZIZ01xcXY3MHlqODE4T0JBaVVRVVp1N0gyNWMwbFAwQ1Bw?=
 =?utf-8?Q?YSz9Ph/8CIPkHJs6pnWaMjhJw+vUpgY/GyBrOxO0Fb63d?=
X-MS-Exchange-AntiSpam-MessageData-1: vSEXYST6Evixnw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11b51f9-5928-4537-68f6-08de5822b54e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 12:52:03.1285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dB1ikj115fEb4FAFkOXZwl35R38/EUipp6OHDapz+CrVqQVm8GSpdSVg1+UHNViCjtDq3EcOxzi+ObAg7zgpjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341

Hi Dirk,

On Tue Jan 20, 2026 at 8:45 PM JST, Dirk Behme wrote:
> Hi Alexandre,
>
> On 20/01/2026 07:17, Alexandre Courbot wrote:
>> Add a macro for defining bitfield structs with bounds-checked accessors.
>>=20
>> Each field is represented as a `Bounded` of the appropriate bit width,
>> ensuring field values are never silently truncated.
>>=20
>> Fields can optionally be converted to/from custom types, either fallibly
>> or infallibly.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>   rust/kernel/bitfield.rs | 503 ++++++++++++++++++++++++++++++++++++++++=
++++++++
>>   rust/kernel/lib.rs      |   1 +
>>   2 files changed, 504 insertions(+)
>>=20
>> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
>> new file mode 100644
>> index 000000000000..2926ab802227
>> --- /dev/null
>> +++ b/rust/kernel/bitfield.rs
>> @@ -0,0 +1,503 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Support for defining bitfields as Rust structures.
>> +
>> +/// Defines a bitfield struct with bounds-checked accessors for individ=
ual bit ranges.
>> +///
>> +/// # Example
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// bitfield! {
>> +///     pub struct Rgb(u16) {
>> +///         15:11 blue;
>> +///         10:5 green;
>> +///         4:0 red;
>> +///     }
>> +/// }
>> +///
>> +/// // Setters can be chained. Bounded::new::<N>() does compile-time bo=
unds checking.
>> +/// let color =3D Rgb::default()
>> +///     .set_red(Bounded::<u16, _>::new::<0x10>())
>> +///     .set_green(Bounded::<u16, _>::new::<0x1f>())
>> +///     .set_blue(Bounded::<u16, _>::new::<0x18>());
>> +///
>> +/// assert_eq!(color.red(), 0x10);
>> +/// assert_eq!(color.green(), 0x1f);
>> +/// assert_eq!(color.blue(), 0x18);
>> +/// assert_eq!(
>> +///     color.as_raw(),
>> +///     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
>> +/// );
>> +///
>> +/// // Convert to/from the backing storage type.
>> +/// let raw: u16 =3D color.into();
>> +/// assert_eq!(Rgb::from(raw), color);
>> +/// ```
>> +///
>> +/// # Syntax
>> +///
>> +/// ```text
>> +/// bitfield! {
>> +///     #[attributes]
>> +///     pub struct Name(storage_type), "Struct documentation." {
>> +///         hi:lo field_1, "Field documentation.";
>> +///         hi:lo field_2 =3D> ConvertedType, "Field documentation.";
>> +///         hi:lo field_3 ?=3D> ConvertedType, "Field documentation.";
>> +///         ...
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// - `storage_type`: The underlying integer type (`u8`, `u16`, `u32`, =
`u64`).
>> +/// - `hi:lo`: Bit range (inclusive), where `hi >=3D lo`.
>> +/// - `=3D> Type`: Optional infallible conversion (see [below](#infalli=
ble-conversion-)).
>> +/// - `?=3D> Type`: Optional fallible conversion (see [below](#fallible=
-conversion-)).
>> +/// - Documentation strings and attributes are optional.
>> +///
>> +/// # Generated code
>> +///
>> +/// Each field is internally represented as a [`Bounded`] parameterized=
 by its bit width.
>> +/// Field values can either be set/retrieved directly, or converted fro=
m/to another type.
>> +///
>> +/// The use of [`Bounded`] for each field enforces bounds-checking (at =
build time or runtime)
>> +/// of every value assigned to a field. This ensures that data is never=
 accidentally truncated.
>> +///
>> +/// The macro generates the bitfield type, [`From`] and [`Into`] implem=
entations for its
>> +/// storage type, and [`Default`] and [`Debug`] implementations.
>> +///
>> +/// For each field, it also generates:
>> +/// - `field()` - getter returning a [`Bounded`] (or converted type) fo=
r the field,
>> +/// - `set_field(value)` - setter with compile-time bounds checking,
>> +/// - `try_set_field(value)` - setter with runtime bounds checking (for=
 fields without type
>> +///   conversion),
>> +/// - `FIELD_MASK`, `FIELD_SHIFT`, `FIELD_RANGE` - constants for manual=
 bit manipulation.
>> +///
>> +/// # Implicit conversions
>> +///
>> +/// Types that fit entirely within a field's bit width can be used dire=
ctly with setters.
>> +/// For example, `bool` works with single-bit fields, and `u8` works wi=
th 8-bit fields:
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +///
>> +/// bitfield! {
>> +///     pub struct Flags(u32) {
>> +///         15:8 byte_field;
>> +///         0:0 flag;
>> +///     }
>> +/// }
>> +///
>> +/// let flags =3D Flags::default()
>> +///     .set_byte_field(0x42_u8)
>> +///     .set_flag(true);
>> +///
>> +/// assert_eq!(flags.as_raw(), (0x42 << Flags::BYTE_FIELD_SHIFT) | 1);
>> +/// ```
>> +///
>> +/// # Runtime bounds checking
>> +///
>> +/// When a value is not known at compile time, use `try_set_field()` to=
 check bounds at runtime:
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +///
>> +/// bitfield! {
>> +///     pub struct Config(u8) {
>> +///         3:0 nibble;
>> +///     }
>> +/// }
>> +///
>> +/// fn set_nibble(config: Config, value: u8) -> Result<Config, Error> {
>> +///     // Returns `EOVERFLOW` if `value > 0xf`.
>> +///     config.try_set_nibble(value)
>> +/// }
>> +/// # Ok::<(), Error>(())
>> +/// ```
>> +///
>> +/// # Type conversion
>> +///
>> +/// Fields can be automatically converted to/from a custom type using `=
=3D>` (infallible) or
>> +/// `?=3D>` (fallible). The custom type must implement the appropriate =
`From` or `TryFrom` traits
>> +/// with [`Bounded`].
>> +///
>> +/// ## Infallible conversion (`=3D>`)
>> +///
>> +/// Use when all bit patterns map to valid values:
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
>> +/// enum Power {
>> +///     #[default]
>> +///     Off,
>> +///     On,
>> +/// }
>> +///
>> +/// impl From<Bounded<u32, 1>> for Power {
>> +///     fn from(v: Bounded<u32, 1>) -> Self {
>> +///         match *v {
>> +///             0 =3D> Power::Off,
>> +///             _ =3D> Power::On,
>> +///         }
>> +///     }
>> +/// }
>> +///
>> +/// impl From<Power> for Bounded<u32, 1> {
>> +///     fn from(p: Power) -> Self {
>> +///         (p as u32 !=3D 0).into()
>> +///     }
>> +/// }
>> +///
>> +/// bitfield! {
>> +///     pub struct Control(u32) {
>> +///         0:0 power =3D> Power;
>> +///     }
>> +/// }
>> +///
>> +/// let ctrl =3D Control::default().set_power(Power::On);
>> +/// assert_eq!(ctrl.power(), Power::On);
>> +/// ```
>> +///
>> +/// ## Fallible conversion (`?=3D>`)
>> +///
>> +/// Use when some bit patterns are invalid. The getter returns a [`Resu=
lt`]:
>> +///
>> +/// ```rust
>> +/// use kernel::bitfield;
>> +/// use kernel::num::Bounded;
>> +///
>> +/// #[derive(Debug, Clone, Copy, Default, PartialEq)]
>> +/// enum Mode {
>> +///     #[default]
>> +///     Low =3D 0,
>> +///     High =3D 1,
>> +///     Auto =3D 2,
>> +///     // 3 is invalid
>> +/// }
>> +///
>> +/// impl TryFrom<Bounded<u32, 2>> for Mode {
>> +///     type Error =3D u32;
>> +///
>> +///     fn try_from(v: Bounded<u32, 2>) -> Result<Self, u32> {
>> +///         match *v {
>> +///             0 =3D> Ok(Mode::Low),
>> +///             1 =3D> Ok(Mode::High),
>> +///             2 =3D> Ok(Mode::Auto),
>> +///             n =3D> Err(n),
>> +///         }
>> +///     }
>> +/// }
>> +///
>> +/// impl From<Mode> for Bounded<u32, 2> {
>> +///     fn from(m: Mode) -> Self {
>> +///         match m {
>> +///             Mode::Low =3D> Bounded::<u32, _>::new::<0>(),
>> +///             Mode::High =3D> Bounded::<u32, _>::new::<1>(),
>> +///             Mode::Auto =3D> Bounded::<u32, _>::new::<2>(),
>> +///         }
>> +///     }
>> +/// }
>> +///
>> +/// bitfield! {
>> +///     pub struct Config(u32) {
>> +///         1:0 mode ?=3D> Mode;
>> +///     }
>> +/// }
>> +///
>> +/// let cfg =3D Config::default().set_mode(Mode::Auto);
>> +/// assert_eq!(cfg.mode(), Ok(Mode::Auto));
>> +///
>> +/// // Invalid bit pattern returns an error.
>> +/// assert_eq!(Config::from(0b11).mode(), Err(3));
>> +/// ```
>> +///
>> +/// [`Bounded`]: kernel::num::Bounded
>> +#[macro_export]
>> +macro_rules! bitfield {
>> +    // Entry point defining the bitfield struct, its implementations an=
d its field accessors.
>> +    (
>> +        $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty)
>> +            $(, $comment:literal)? { $($fields:tt)* }
>> +    ) =3D> {
>> +        ::kernel::bitfield!(@core $(#[$attr])* $vis $name $storage $(, =
$comment)?);
>> +        ::kernel::bitfield!(@fields $vis $name $storage { $($fields)* }=
);
>> +    };
>> +
>> +    // All rules below are helpers.
>> +
>> +    // Defines the wrapper `$name` type and its conversions from/to the=
 storage type.
>> +    (@core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty $(, $comm=
ent:literal)?) =3D> {
>> +        $(
>> +        #[doc=3D$comment]
>> +        )?
>> +        $(#[$attr])*
>> +        #[repr(transparent)]
>> +        #[derive(Clone, Copy, PartialEq, Eq)]
>> +        $vis struct $name($storage);
>> +
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            /// Returns the raw value of this bitfield.
>> +            ///
>> +            /// This is similar to the [`From`] implementation, but is =
shorter to invoke in
>> +            /// most cases.
>> +            $vis fn as_raw(self) -> $storage {
>> +                self.0
>> +            }
>> +        }
>> +
>> +        impl ::core::convert::From<$name> for $storage {
>> +            fn from(val: $name) -> $storage {
>> +                val.0
>> +            }
>> +        }
>> +
>> +        impl ::core::convert::From<$storage> for $name {
>> +            fn from(val: $storage) -> $name {
>> +                Self(val)
>> +            }
>> +        }
>> +    };
>> +
>> +    // Definitions requiring knowledge of individual fields: private an=
d public field accessors,
>> +    // and `Debug` and `Default` implementations.
>> +    (@fields $vis:vis $name:ident $storage:ty {
>> +        $($hi:tt:$lo:tt $field:ident
>> +            $(?=3D> $try_into_type:ty)?
>> +            $(=3D> $into_type:ty)?
>> +            $(, $comment:literal)?
>> +        ;
>> +        )*
>> +    }
>> +    ) =3D> {
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +        $(
>> +        ::kernel::bitfield!(@private_field_accessors $vis $name $storag=
e : $hi:$lo $field);
>> +        ::kernel::bitfield!(@public_field_accessors $vis $name $storage=
 : $hi:$lo $field
>> +            $(?=3D> $try_into_type)?
>> +            $(=3D> $into_type)?
>> +            $(, $comment)?
>> +        );
>> +        )*
>> +        }
>> +
>> +        ::kernel::bitfield!(@debug $name { $($field;)* });
>> +        ::kernel::bitfield!(@default $name { $($field;)* });
>> +    };
>> +
>> +    // Private field accessors working with the correct `Bounded` type =
for the field.
>> +    (
>> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi=
:tt:$lo:tt $field:ident
>> +    ) =3D> {
>> +        ::kernel::macros::paste!(
>> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive=
<u8> =3D $lo..=3D$hi;
>> +        $vis const [<$field:upper _MASK>]: $storage =3D
>> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
>> +        $vis const [<$field:upper _SHIFT>]: u32 =3D $lo;
>> +        );
>> +
>> +        ::kernel::macros::paste!(
>> +        fn [<__ $field>](self) ->
>> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
>> +            // Left shift to align the field's MSB with the storage MSB=
.
>> +            const ALIGN_TOP: u32 =3D $storage::BITS - ($hi + 1);
>> +            // Right shift to move the top-aligned field to bit 0 of th=
e storage.
>> +            const ALIGN_BOTTOM: u32 =3D ALIGN_TOP + $lo;
>> +
>> +            // Extract the field using two shifts. `Bounded::shr` produ=
ces the correctly-sized
>> +            // output type.
>> +            let val =3D ::kernel::num::Bounded::<$storage, { $storage::=
BITS }>::from(
>> +                self.0 << ALIGN_TOP
>> +            );
>> +            val.shr::<ALIGN_BOTTOM, _>()
>
> What have I missed?
>
> error[E0747]: type provided when a constant was expected
>     --> rust/kernel/bitfield.rs:318:37
>      |
> 318 |               val.shr::<ALIGN_BOTTOM, _>()
>      |                                       ^
> ...
> 566 | /     bitfield! {
> 567 | |         struct TestPageTableEntry(u64) {
> 568 | |             0:0       present;
> 569 | |             1:1       writable;
> ...   |
> 574 | |         }
> 575 | |     }
>      | |_____- in this macro invocation
>      |
>      =3D help: const arguments cannot yet be inferred with `_`
>      =3D note: this error originates in the macro `::kernel::bitfield`=20
> which comes from the expansion of the macro `bitfield` (in Nightly=20
> builds, run with -Z macro-backtrace for more info)
> help: add `#![feature(generic_arg_infer)]` to the crate attributes to ena=
ble
>     --> rust/kernel/lib.rs:59:1
>      |
> 59  + #![feature(generic_arg_infer)]
>
>
> $ rustc --version
> rustc 1.81.0 (eeb90cda1 2024-09-04)

Ah, I'm the one who missed something - this code builds fine with rustc
1.92, but on older versions the second generic parameter of `shr` cannot
be inferred and we need to specify the expected number of bits
explicitly. I will fix that in v2 as we need to support 1.78 anyway.
