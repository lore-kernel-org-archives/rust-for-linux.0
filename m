Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021076.outbound.protection.outlook.com [52.101.95.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C062F1FDC;
	Wed, 28 Jan 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615036; cv=fail; b=LmA1r9wr1Sn5rSNEp8yuvuHg9dtOq9QiVCiIUfIPjfxxw+RQAGkqkm0Gim9HNB7XVoHeDU7+FzKdBknuuATW+zXFO42WRB20qElW7LzDTI72FSHbS6wOHH6Lu7bGtDJARjWwrGcFMOzW1rmR0m2E7C6y+jbLXm/7JtLyTdDjUDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615036; c=relaxed/simple;
	bh=jcKf0SqzJe5eohDxyDkzZbSo4shj+B/gLPOkynx3eaQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PizPVcyis/GzwyM2VvRo/8/k8wRs2A7Jbyph/tlSMOiZov17x1E1rbXuVAFc4GB/yieVbAgQfrRn56qtcPx3qWNt13t6Y9TXrj+H6pLV4GElh4BpDTk/3Wf0ZgiekK7mMnmPefsEUp/IFOV0ecO7YjRoYiHauUo/V2walBPivys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UYsuvf7J; arc=fail smtp.client-ip=52.101.95.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UYsuvf7J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi/0husgLrQ2Mtiftvk2p8cP2l0CjD7QEdErtD+5w5KvhTHIdnnt3nZr0pNw5zy+RO9L14LHda/g4mcfS9QBrJm2VeIsdDxmqm3v/6QLbisVjlihg/l89E/PnlwCHzJVVBith9D+GHSUIMhdHiWveSAIvfSwcdWE8i9Vj4oWW7UWFWlZu4JeK0Ot8Ps8/a/eYWaoRGW3cSFh2DSFOLm1Lxlw+k1aA4kpnXufDBx1dGYiE5WJT23K/qGMsgZxIR5XfF5fbT8Msce2hYznpQAqcgVN+3blXKMIYLcu34deRaxMNqdae3fKZjtwywpMqs2DTstEsGbbHDuV134bGvV1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//gB6vwcpNl8FUom//WhVnXYgZN2I25bEPqhqEtyfiY=;
 b=oG7duIXy8Bg/lJNXy+ryZ8QWMdCqVp1GacHvUb185wLgqSCKCxRH8MwAKCBrk2NJgTnJMenyfqwGcJqa6jmKyjirYZFWIRrgH9F/2+CQaDHgDzEgrnw8szJy2IYRIRjVmFeD5bMK5CJzobxjchLAgcEPFwlx0Td1AnS9FXgbLDUSW6jEb2qjshMBKOHbYe6EDkroveyHQcAdj50a+60V14lNvpuBH8vCN054kSSrJZL+eHG9K3TkqEBrSFMnfVHCb1eLED3sb35yvVKAK7pqCXdxJebCNrfYYgTthC0pTO7E0h/EFLHYvqAApICtwNTGrDG9rPsqxKiLWuHKTSTPzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//gB6vwcpNl8FUom//WhVnXYgZN2I25bEPqhqEtyfiY=;
 b=UYsuvf7Ju+h9Gqintji3FiFZjv4P1nMq4U2Qh7xNbtFjyddyXilnNyax7Ry/8bF/vu+IavTXLGjwZO4GsLjgO5Ib0CKa0P/Rg2Uaj7V8uRX9yDxRyMqYXYf59s7IQQw4OnUMJ/1g7cQfM5I/guGF90n6oTU1psWqr1yqDszH+GI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB8449.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:473::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 15:43:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:43:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:43:47 +0000
Message-Id: <DG0C68O25Y9X.2X8M9OXMW17IS@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/7] rust: num: add `into_inner` method to `Bounded`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260128-register-v4-0-aee3a33d9649@nvidia.com>
 <20260128-register-v4-4-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-4-aee3a33d9649@nvidia.com>
X-ClientProxiedBy: LO4P302CA0010.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f86b65-8424-4ff3-5d0a-08de5e8406eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UThKS3RoRHhPMHhBSjFVNmphSm9oKzRKQk4yd3F6Y09LcW5wc3ExN3ZCZldF?=
 =?utf-8?B?UDJ2WkpyRytyRDU4em1aR0lLbVpzQkcvUkpSUDJDeFRnTDI5WFJjSGR6ZkJr?=
 =?utf-8?B?SHJMaFN2cXRNNjMwSjdRclBsNm4wbmV4TzQvYkpEZEpDRjNOQWptUkFweDJk?=
 =?utf-8?B?Smt3MmJQZGdkdEUvc3N6YWtsOE5MOXhwZnZEWXFsYlJPdDdIczJOSFZUc0RK?=
 =?utf-8?B?ZXFodklqU3l4OGJPRU9xY1FEWnlxVWM1UW9NYU53cGdUMnUvNkxpak8wVkhj?=
 =?utf-8?B?TGhNYXdKTDdGcEtkRElUOGVKY012SkFmWG5UTWhyMGJyK2hNODEzcHVLZm5U?=
 =?utf-8?B?by9TRXBDOWNYS3hKOVR6VjlVMkZKNkZvdFVqd1VJY3dsTjBUYVgvOTg3NkdC?=
 =?utf-8?B?UjJ3WkNxTGhTdnVYOEpEUjFoUjR6dWdDU2tZVTNCTk1qdEhXUkNpeDNNU0dF?=
 =?utf-8?B?ZWxjZU1Ocm1mTzRSMGM2WVRRWWYyM2NQTW9wNEx2N3BDOVFhZ3o5amdPN250?=
 =?utf-8?B?bUs1VFd6U1hYVktDMlUwczRjZVFXREhBQklLeUVIMHgrdmU4eDFZQ2RtY3FG?=
 =?utf-8?B?TXJZNGExYlg1VlkyV2hqTnhUSndOampkU0pZUkwyS2RnMEl5TEVWaDgwTXND?=
 =?utf-8?B?cFdvWkJIbUFlVmV6YU9SRlBZNmZGdVYvVFNYS29Odlcxa2NrRDd0TVI0L2Nw?=
 =?utf-8?B?NGVjalZ6dEpNdlo4VjhMS0N2T0cyNThid1dUTnpvQ3dua09YVnZjZlpvd0Nz?=
 =?utf-8?B?UHRWSEg1NjFDT2FldkJwaTlkbjIrdUpiUlJVNmQ1eWc2ZytQM2w0cFdXa1Zs?=
 =?utf-8?B?SjhWZFlVMHB5aWtZUVY4R09zaEVnbFRHRXFkdHhNM1JUcDRlRXAzY29iSmxT?=
 =?utf-8?B?bFFiYktNSTR3UEVCZ0syUFFtdlJWMXlMeXY3U3pIY3hraSt0WldTMDBBU1hW?=
 =?utf-8?B?T2MxbnZYRjkrN3F2OVp5cTJvb3BlZU1qdWxoeEdySzY5Z20wSVdHYWlSQzBE?=
 =?utf-8?B?bEFWK202SFg1Qzh6eTltczExNkpDUzNJc0lvcUFkWndEZHNic0p3MW1JS2Zk?=
 =?utf-8?B?UUhzVWZFd2xQODRTQm5MRUtlMDAvcUtLLzltRWdWZDk0SFJGN3k0cmhtYzI1?=
 =?utf-8?B?ZHQwWFM1eGZhRmhrV1N6Ulp5ZDVzcG9KNU9YVWd3UURJRjBURTlHM1dJeTNp?=
 =?utf-8?B?UmlvWVdORDJjNjZFb0NoQmxNRVIzdG9Ba1RuZTR0QTBNREVjRnNFN0xTb2J0?=
 =?utf-8?B?bGdTdlZBcm1jR1pWU0swQWJSRDNpRkJnL09oeVpHbG9IQm9PUUozSHhMWHVG?=
 =?utf-8?B?d0RTZVhSbFBkM0JKT1JjMG9WT0tEdWMyc1J0RCtIdmlGblBFeTBpdVNBYkc2?=
 =?utf-8?B?YS9pTjJRM1BMZXY2MVRkZXBtVFNDNjhzZE9mL2h6eUVsSDY5NkZ4OFVqMTA4?=
 =?utf-8?B?VmNMVkxhNnV1ZVJVazA1NFI1QjlVeGk1UGNXTmRGamFrTnh6T0VtN21IazVN?=
 =?utf-8?B?eEs2KzlHWFRmSEc3NVFKUk9TQzlHbzF1Y3NqMXBpMzlHNzJEdm5wL2xqSFl4?=
 =?utf-8?B?MnExOUpid3ZPUmd6d3Z5bVZ2aUp3aGtaRTNiQkNjSHoyeXlaYklXNHJTZUtx?=
 =?utf-8?B?WkEvem9KUEFWSUhrS2h5WlBsRkVtL250RXZndVIrT0NYanhUaHp5UEVsWHhY?=
 =?utf-8?B?ZElpS2JpcTFtMUtISzFYcVBabGZTdUtETkRrMzZZV2JmZ1JuVzJxa0JSa1cv?=
 =?utf-8?B?bFQxRk1Cc0FQZEMvOEdrOWxxYVpMeEJ0b1lWT2orTlQ4ekdmUWEvRGViZGl4?=
 =?utf-8?B?WndhazlqaWdENlVIKzZuZkdRU1E2dXNlMytYck82OXlQN0NqNjZsTDUrbWcy?=
 =?utf-8?B?cUpxd0pkUVVyTnRQc1BUR25vTTh1eUczZ29GSWZVdXVnUElrVUQ5VmNCOHJm?=
 =?utf-8?B?V3p6QkxiclFMdEVJaVpNNmE1STdoNmJSbmF1NForVDQzVFFBeXF6eWZhcU5r?=
 =?utf-8?B?NDlGTVZqZXl1amVTdG0yNG1NQUEwcVY1OEZDNSttQWV1YWc0RDBFNTRVVmx5?=
 =?utf-8?B?Rmhzd3d2eTBBS0JCMktoWGR4RVJ5bmpWcWRGUDl1Wk42TXR0KzRyQ2VOODN2?=
 =?utf-8?B?cWdxTU0wM2gzN2M0SXVZaTZDVmZoTXVSTFFMT2RFTVpUbjRLSHZxQlRxZHhH?=
 =?utf-8?B?Q0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGRrMlRQVCtQdEp0M0YyV2V1cDd2V2NXdWtOeFNrdk9yR0lwTmhWaTl5di9x?=
 =?utf-8?B?Q2tOQzRUcjFNNlFuWURSbHpxa2ZqMkZIOW56NVNWN1dzMmZjTk9BSTBxVGdq?=
 =?utf-8?B?MXlxTWtCYTlkdzAwd05GdVhzcDZlL2V3NXhMOFVrQS9zSm1iNmZJSExwWHpq?=
 =?utf-8?B?UTNOdWdha2lMZzRSMnlGYXBGc3lwdHNaa3ZsTEpFUUFZQk9naVdBNTF0cnNS?=
 =?utf-8?B?T0J2SFF1TzIwbk9WbmFUcHd1ZzkzYlZNY3J1OHVlbzU5S2lHNTYwemNSVllk?=
 =?utf-8?B?ejQyZHhKYTJrZnZFaDdHdVJzY1BVUkdHTTVhT05RRkR1bHdjV3BXbklNUnUx?=
 =?utf-8?B?OEREYUJCRXViTkVGazNOd1BRTUF2Y29GejdML0RuYjJJUXk4dDZna0o2SDB5?=
 =?utf-8?B?UFd1S002Q0l3WlRTcTRLWWJwa1l6TDQxV2ZHN1BxZE1yZ3NRdzNFejZzVGN2?=
 =?utf-8?B?ODI4UEJQWXRnUWFnQ3hEbWlzR1g2Q05oZnhQUy9RZlIvcFJRdnpNQWtCTEpz?=
 =?utf-8?B?UHJrWE1GTGtDbkErcEZYUXNqenhUSlY1NS9HODZNZE51OExZMy9ZUUMrbjc3?=
 =?utf-8?B?cUJtSDdTUmpBRk9SVnU4cWxQUlFlZnhEWnZvVFVRZnhEeUtaN1BmR1k5aGZK?=
 =?utf-8?B?Wmc5RjU4aUk2ZFVZc2VkVE1CdGNDUnNKMFFxQ2p1T1B2cFlWUzlydFdPNldI?=
 =?utf-8?B?aEx3UFhQMFV3ZWxWdVIvYjBCMjdlcW14bFA3WkMxNDFTZjl0UjhtN21Xb2Qx?=
 =?utf-8?B?dlpXQTV5Y0dXN3J1ZlBhWEJ2OXU2cnJ2a2F4NG56L1VXUTdPKzNnZ3JDbkdI?=
 =?utf-8?B?UzI2Smo4R0p5SXQ4S0FBSjNCMGdydUtlaU0vOU9rbnpTK3hMRnEvZVpubEtW?=
 =?utf-8?B?Z1Q0MUErenhOUitsVS9Zc3BsK1pwNHpVc0FNQ2J3OGVLZmFKbnJyd0FPTzc3?=
 =?utf-8?B?WWNibHJWb1JNWFVsR3VIZXpQRU1HazlLbFBkUmlJQkRlbWpUemJFbjQ2Ym1O?=
 =?utf-8?B?VE16MXg4VEVYd1llUytScUxLakxoYVN2b2kyckNORmw1aGd3azRFNkNVR1Rz?=
 =?utf-8?B?ZzN1dXloNlIzbE1PR1kreEJaVE1WRFFTeEFTYXN4RGhtTThWWG9qUlgxWU1u?=
 =?utf-8?B?UW5UVEpXajhTSHFUSHRlMm1BcnZmMkdBc2RsUUpOT2NiRURwdWRjVUhpVXVi?=
 =?utf-8?B?V0pTdmZnb3NOci81TGhuQTNqVS80bnZwQjVSNDFnZFpRTHgzU2NIMXFVMVRX?=
 =?utf-8?B?R3h3YTQxSDBDbHVVWUg5eTc4M0l3T25RdXNvVWlrdWVnM0ZtVGd1bjM3SUNy?=
 =?utf-8?B?ZVNiSGdpSFdnUzBYUkYyM2pTS3Y1VS9kS21qRm1lVmNLRDkrMFJHbFgrclJ6?=
 =?utf-8?B?SExRT2dZcldRRmlKWGdVOXhZbDl2blZPdUtQQlE5dkl3NnR3MFp1Y0FnTFEv?=
 =?utf-8?B?ckxjRHYyRyttU2xqYnluRUF2SlZ4c2dZNXg5V2dKeUFjSWFRU1hMbnBzUEFk?=
 =?utf-8?B?V1k2dFdyWEU2amlMdG5QdVR0SlV1ajFoNG90WWhGNkptODhhRmJKbVgxTC9r?=
 =?utf-8?B?UERWUnpHaVpSNWVsS3V0QWtXV2FZSE5BZTNjTFlYQ3YzN25QakpzTWZkRnV3?=
 =?utf-8?B?UjArakZsTEJNMWRyOC9sT1ZEOVdaUHliRUFVL0tZNWpKNnIzWnkyZTN1RWVu?=
 =?utf-8?B?a1pLRlJvT0xBUFk4QkZNeXRDRDVkRUR4K25HODlUQWgwUjczM2NhNTUwVTV5?=
 =?utf-8?B?ZG4vTXRIOWNuVm5LSzNzUVFlV1k1UVZMMnBMcXI1SHR3RGo2azRNWU9rd0xY?=
 =?utf-8?B?OGZ4RlpHQlN6Z3kvN0kway90eS90Z0pIOUlOZHdiRnFhQm9YZ2E5c1RHSE5x?=
 =?utf-8?B?Mzc3RFJ3aGRScVN2VXFBTHJXVy8zWlZwdzYxeUNsZ3kxVzNOcjlHZlhzWlVH?=
 =?utf-8?B?YmFaSEZDYSt3K3dlRkJwekRsU1pLd250bjJPSEV4RHAzRWYvY3ZoWVV3aWFv?=
 =?utf-8?B?bkJreTkra1RzWmhrMHR0NExZRXBGQWllMm95c2N3Z1ZkYkZuSlo5TjhZQ2d4?=
 =?utf-8?B?Vm95RXNKRDFyTkxaTmdJdWR6aFNYejhJQTFTL1FBUkdSa3pGZDBwZjVXSlFU?=
 =?utf-8?B?dWRjM0RyejR4UUpJZDRMdXdvYWQxakpXWWJyZVBSWnBZODZWdnUxZEM3TlJF?=
 =?utf-8?B?YmxzOXprQzErUG9uZjRtT2s2NkpvYVdDMW1FRXk3c3lUQm1iVk50MzNKRTRC?=
 =?utf-8?B?UG15dWt2eWI1V05SUkw1UmZVdFBIOUcva1hkcVA1V0JjbDFvVFhhb1RzcExU?=
 =?utf-8?B?aUtBNTJjbGlTOVdOR0EvSGpYWWlEcHB3U0pXTEUxK3hUQlpFQWhzZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f86b65-8424-4ff3-5d0a-08de5e8406eb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:43:47.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKolAWutDjoGeJeEpJ8CTNZcUBlzIRIMgpyUd01Afw3pL/OWF2GlfxqH0/6IMx0vjnyDZjLSs0Ea4sAKnWFbCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8449

On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
> This is useful to access the inner value in const contexts.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index b41ca6df1525..850827033f67 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -388,6 +388,22 @@ pub fn get(self) -> T {
>          *self.deref()
>      }
> =20
> +    /// Returns the wrapped value as the backing type.
> +    ///
> +    /// This is a const-friendly variant of [`Self::get`] that can be us=
ed in const contexts.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::Bounded;
> +    ///
> +    /// const V: u32 =3D Bounded::<u32, 4>::new::<7>().into_inner();
> +    /// assert_eq!(V, 7u32);
> +    /// ```
> +    pub const fn into_inner(self) -> T {
> +        self.0
> +    }

This is... just `get`.

You can implement it (with the `fits_with_in` check) in the same manner as =
the
const new.

Best,
Gary

> +
>      /// Increases the number of bits usable for `self`.
>      ///
>      /// This operation cannot fail.

