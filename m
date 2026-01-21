Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021099.outbound.protection.outlook.com [52.101.100.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B94322DBB;
	Wed, 21 Jan 2026 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769010354; cv=fail; b=acVZb+9Cj4fyH96x9ZV2qKGJKplBtFv7SYcO7PYx3dQYIw/hRo5CCrHybthwQJdgROKa3Hqw05Ux+m65tsHerRTZ3pWoPeAAfcVGvaHWBFwdVP19Szp3AP8xaHVNf7X8OEPbylLTF+R2uArfV1T2sZaL5AXaczrXUMRDzpMnXfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769010354; c=relaxed/simple;
	bh=UsequymWDb73pJ7qXo3D+/FGL1ZkRKnnhwKw8xpKacM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=fLyj5Tzj/JW3Wo71+ahmGTjzUQjJCU7iIAuzE9nnhWJj+CAd7lzzw4CeP+AXP+B+D2P52bOdTaJZfvYQJQoVRiIFk4QGBnGFAPOPBIfCrH27Y3/DG8kXkxnIV9RV3WBENIktQO2RK//mW1DpEYaw902LajnmnYThgD7E5aKWgYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FwBc2bYb; arc=fail smtp.client-ip=52.101.100.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FwBc2bYb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBzXDEhvM6NvaOPN4k1rOwhY78Ft7KRMI01S07FGD/FMS6nNMI84yR+4yNsiPtc6yAKvl5IVZXsEn6JOa/36iTD5cWXE0oXnfxTB7JOGgUJ/aaOlHpLTdGQTyyuIw3iOqfSkUUMQo3aoW/Zx24um4L01XYEOdbMc6T0Y4jgupuJodqVBDSOHzqFfUDSWPsQv6HXFmjHt43y88ygiHb46KluZ9GkpKuXs5zLhTIcNBesCn2U09RIWoDFk42OOAtu5KpD+8kKzaoQxNFtgM/K/QiZ94aFyidcT9iuRQhldmWiTtRi9qktcYd7aAjl3sP8n2A8nF3MAZ0Fyk5xahdexhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1bzFOtA7Pb3I0vqdNLvgcGpGRYbPyRDobHWoV+EeJw=;
 b=wNnb3KSFZGdI8zQfXZbflSl7JnYTbl2z0nDAkcBXUH6gYhMg+bEkTkTyPEv+bHuNSFnydwjcQIVmsl5mYPBLjy3/gDqZQU+IwNf/PgC+9WeWBgk+f/F+Ril0RPw1JSGvynPNfYFHLktZg31YXNCNtJDBg4PwnULX8sGL+jyNzHs+8+yRZrvwi0kqTcu+iSPctNb5hjdzP7TgmYl82JP7rhJ09NQh/9oaNKYBmXy7yGEFpbAVkewbU/bVQIq/NUXUCIVxVI5kjLVODiLXwPCUcEpDIm2q2nlJ5NVqvjJtoLKZntfRWjCrZkXqCsA9V9Tk/NMsVnYDfP+uFYiz9taOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1bzFOtA7Pb3I0vqdNLvgcGpGRYbPyRDobHWoV+EeJw=;
 b=FwBc2bYbdixjNFfyXDpePBURfZgj8FhzzMyFs+j2dRVU8pWf8S+4EGPDcUuNGm95+OvxucMH4vd33efZt7f5VqyP6lQ5HxDwYX3LTrVLF8Kx2va/+RwHYTYRlwMIrDUQUGW3E7DyjpMuyDHWb2s7Tt4fS6oEU/LUATFWwl7DtRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 15:45:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 15:45:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 15:45:49 +0000
Message-Id: <DFUDTZC4QU3N.39THVUZ4QT83Y@garyguo.net>
Cc: "Daniel Gomez" <da.gomez@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/10] rust: xarray: minor formatting fixes
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Tamir Duberstein"
 <tamird@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-1-9e5ffd5e3cf0@kernel.org>
X-ClientProxiedBy: LO4P265CA0323.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc9990c-a95d-4c61-9db0-08de590426a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3JpQURTZjdUZm5tQlpzOFh1K3lTRmxvUEpjTkFYNkpHdEFhaHJDVUtGQWVF?=
 =?utf-8?B?T2hENkQ4TnR4ek5QVjcyT2l6dVJGOG4yL3FkM0NobjNqaHZ0dWEvUytCMXhX?=
 =?utf-8?B?SDJFZmFsdUppNENlZmVzV1Y3WHg4akd0OSsrUEVtekRnNkJJN3RHc0R4TTBF?=
 =?utf-8?B?bDFyV1FsQ21veWdrTGovTUtIMEhuRFZRZkV0NWduNVFaOEdUemNrZjRMUHUv?=
 =?utf-8?B?K2ZQV0RrZkhQSzJzQUtnQ3FLVVBOZjlGVlc5dWhXUkZMOFR6RUpkWFZuNWx4?=
 =?utf-8?B?SkR3ZmU3VWxqRjFCdnhBdU9PRS81U2wzd2M4NGFvbjZDQUZMZFdlN2hFNHNQ?=
 =?utf-8?B?NURHZEVFeTRLOXJxbnEwS2lWcmRhTkgzOUlmMDFOeHQ3UTB5Zk1iWnpvdUZH?=
 =?utf-8?B?M3pMY3cvZkF5TFJqejY1T0FnVXlsSEcvTGQ2UC9lbkI4aG4wUjYwZFhvZDkx?=
 =?utf-8?B?RE9yTjNOb2hxbmFFVmJjcmxBeGxpTFljaG92dEI4VlpmYXpKOXlYQ1FGTDRy?=
 =?utf-8?B?cWp1Zk54ZFVXcGJJNkRSTHVwWkpCUU5pMEV6TE1Nb3llajNBYUdzUEt1K1gz?=
 =?utf-8?B?bktsajE0Q3Q1ZWxPZENDdTFKRFVEaHFRenZOR2duTEZGcDRLWGpidVB1VWh5?=
 =?utf-8?B?UTRVVUs4WUNmdHFJMzJwSkNJUnhGbHlLVFFncUNaZncxNXNzd3lDT21PNTlS?=
 =?utf-8?B?MjArc3gxaVc1TzFqRG5Ha0hoVjZKS2RuZDA1VGplL3Z5U29xUXc0Rk9naFg1?=
 =?utf-8?B?QndOMjJXdWtUK0FLbkVuLzVKWVVKNWYreDhBSmVUZUtYZFpkRW5CeUJyRm1u?=
 =?utf-8?B?eVJSc2tsY1JkRDQyMGVKVjlUSFpqUnBscGxTZWExS1hsRGVBaDRsb1BDUWo5?=
 =?utf-8?B?SlJ5czJOdzY2bnFGOTNHZVpvcVlEWHVLZXIxR3Q0U3h4ZHhWd3NNN01DeVo1?=
 =?utf-8?B?eFFrUHBTc2Z1ZFovS1ZkbTJocmRDY3V0L2dzbWRoSlpKYTFHUTBoSHBndHY1?=
 =?utf-8?B?eUxwcEZZdVFDcXl4U1VKek05Sm5qU2c2cW5uNHQydWdxbEdqR1RydFNFMDY3?=
 =?utf-8?B?cE1nRnNsRUo2U3Z0dUtHYVNxeE9LV2VNMDJxckxObFNnS2tQYzVOdjUrZTJt?=
 =?utf-8?B?V3lrL2VreDhHMEw2czB4RWVhQjc0bzBwcGg5OG84M2pXQ0FBMGtrVFNIc2lI?=
 =?utf-8?B?T2VKNk9BVHp4bnVhRTBwd1VIbjZMeFhZMEVmZFBtQTNvU3M3MEh3SXk5ckI2?=
 =?utf-8?B?aVkxaitBUGdCaDF6cE9vSXRnOXI3YWRBV2pGTU14TVV2Q1o1bFIwRVh4enlq?=
 =?utf-8?B?a0ZqQUJmeVkrMHpaZjBqTWVsRnpIa00rZExNaTlQdFdrKzJEZURqMGg5QWh3?=
 =?utf-8?B?QTJHbWdqRDJtVXpiME5CdSt0L1B5NlJiOTNCOXUwK0hJd1QreHFuMm9qMzlQ?=
 =?utf-8?B?S1NiNmVkeXZiL1lrZVFmSjNvV0dhRnFxb1FOYUFSSkdTQzdIRGdRVW53UGRi?=
 =?utf-8?B?YlUrWG41dUIxeFNpS0gzU3B1dExKekJLOG93a3kzY0VTZ01jL0dxZE1HS1FB?=
 =?utf-8?B?d1RnQ3FzTS9RTlBxV3crb1V0WCtRcGxoZ29rL09WOWdrdlhUcno1OXp6M1pY?=
 =?utf-8?B?eEU1Y1lscHltTFlYL21YUUs5OWw3bStxRTdFRDZ4bFdwU0tINkpOWUYvS3Qx?=
 =?utf-8?B?Y3ZkQjB1cVhzeDZPVHZFcnZxRHV0NzJ1b2kvWGR0Y3hlUjhYRmNZdFhtNHpu?=
 =?utf-8?B?NTJIbk11aHd1VW92NFNKM2E0VnFZZ1V6NmREeWl2N095T2tFL2hPSXYza25o?=
 =?utf-8?B?WXVSZnlENGliNE9PRnZhQlNOcHVmMEsvWHVLQ1NmYkR3YXYvQ3NQTjNSN0hs?=
 =?utf-8?B?Zmxla0VqTWlUMHYvSG9icnE3RFJhL001dlpaMUs5ZzRJenRJSnRSbzhiOHdl?=
 =?utf-8?B?V1JFTlFTUjRTT3dGbHNNcG1aNjhvNG12bWM0VENtVmw3Mk9XZVdNYUNTalFx?=
 =?utf-8?B?Vnc0MjZDMzJsOFFnaVQzUkhTbE1vcmsvWVNiN2NOa0xrM1lUVzhRNm93WXM1?=
 =?utf-8?B?TkZHT2ROenZ3TU1FVGFKSnEzODhhZGg4byt1QU9WTUhmalFheXN0azhNejVj?=
 =?utf-8?B?a2NKbkpvVGtDTVdRcmN2djY4VC85RDZ5anhnR2lubUxrQ0ZOSHlJbysxT2JZ?=
 =?utf-8?B?aVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNwVWQzZEhteFlNc3A5M3FxVDg5K2tJVERibmRwLzNTRUpWcytDUGdNdVg0?=
 =?utf-8?B?TmFOUkdiS3A0WmkyZGljQVNaaDhJcXFnY2VkZTdzTGN6Qkx1dSsxTUdNNHZr?=
 =?utf-8?B?TXVEMmorWTdYeTNselpLT0JDMXlncEpQR3RBWUFLQVVVWkdFZEQ2WWptcWsz?=
 =?utf-8?B?S0drSkFyUTNMMkJmYnVtRTVnTkpkMksrOTZDcTRsTjNuREZCT056c0FEdU4z?=
 =?utf-8?B?M2ozV0tyMW43Z252SDdQV04rUWMvSFJFengrRGRMeVdjdlhLZmdsSzRqTlJD?=
 =?utf-8?B?RFptS291SDRDK2pNamZ3dlNyRUdrTlJvbnB2N3R5UXRLUXRpZkxsM1ZudlpD?=
 =?utf-8?B?UDh6RlVyeG1nM2k5SmthdXBBbTJlQkptcElSQjdnNVhYeU54WHFYL2M1eGpB?=
 =?utf-8?B?cit0NEUzQWRabDdNaFVaZE1ocnlIVDArM24rSHZML3F5WndOSVVsQmd1Mmo4?=
 =?utf-8?B?V21PVHp5WDFxK2JKS3YzWXJ4NG1XVWFzWWZYQ2tGUzB5T2hveXZOWmcrYVlI?=
 =?utf-8?B?OHEvVzg0b01zenRYY0U4MjVsNTRGVTlTczlBNnBrNjc1SjNiclhVbkZOeFB0?=
 =?utf-8?B?Ulc0L0x2SUxCQkFYRE5TMHBPMUtSTm9QQ0dEdHRqN2JTY3VMVGVHUUIyelhX?=
 =?utf-8?B?UGc1eFBGWE5lNTJQclpWK1c1bVBBbkt0SHdNamN6YVVSdm13VFcwR2M0YWJn?=
 =?utf-8?B?L01TYWVKNHRuTzdieW9TVllTRDg1NTBMZmZGQmpLbE41czFGYjRkQmxjbzVw?=
 =?utf-8?B?VHdXUW45WHc3OSt2bDZQaEJONXUySnRwQ3Vabmp4aGtiTGNQSHBJb090SUVB?=
 =?utf-8?B?RzNJTWtMRURwOW1QUTIvNlZIcThXb2Y4cFlxSkNkWWFwYW9FaEJEenlDaDlQ?=
 =?utf-8?B?K0lxTmwrbHVRUklBQ01FajZzNkp5aXBpcG00WlRiWm5meGhaak9FeFFOUzZm?=
 =?utf-8?B?cU9ZU2wwNGw1SUIwWTVIV3REQnNtM3hheXlvM0JZRzdCSUxrbGJmSXBSZEZ5?=
 =?utf-8?B?bmtwakdEY2pOMHBHTzlCMlM0MWRBU2F2MUs2cElpc01ybHplQXJsWjhMcjc0?=
 =?utf-8?B?UU1EdnpYWTlDbDBSUzJXK25lT0dxK3U1c284NFVDdk1nVEZBRlZGS29aR01z?=
 =?utf-8?B?SVQ2TlczcWVOZUhOeE42NENrQWhyL0VHNndOMVJuNnZSTWZDOUsxdG5qTzdX?=
 =?utf-8?B?eFZtSFhLdDh3MEtBMUVwcnY2cjNtcm1rTEhKWUtlaDhTTGZ6dTZlZEkxU3lD?=
 =?utf-8?B?WUo3UEhWblRiUktLc1I5Y2JpR3hoaDhHUUVQREgwK1BIM050aElobnlSck4x?=
 =?utf-8?B?MS9XY0NqRE9acjFrdkFXeUNLTHVibmJhTVZVN0Q5RXdOb01kK2ZMS0NCUnNH?=
 =?utf-8?B?RDhoQmlJamVTaE5jaGxKdjRheU02Q25DMjdqWE5kWURoV3BnRE1GWXVUVTdi?=
 =?utf-8?B?NC9nU0FmcTM4RXpjQXhEODcwSVN3SmRHR1Jnd1Q1V2VnbldJdjBFZk1lM2kw?=
 =?utf-8?B?c3BVWTFRRk85YlNWQTdFa3VyNncvMU9KeTJBYk1LWnFYTm1iQ3FxS3V1cm5N?=
 =?utf-8?B?VWlCcTlYbmV6UUVBTllqVVg4Y3hQaFA4V1lYa1cvczRaTWJMVFBsbjh2aXVm?=
 =?utf-8?B?Ym5yUnlqQ3htVksvZlJsMjFwelF1citSOVpPN1RRUzRBektHdkNLMU5zY0w3?=
 =?utf-8?B?RHBJcEV6MXB6Y1lkSG9meTRwdHBVVzJ4dU10WnRxNTEwazJRREJUaTc4cGU2?=
 =?utf-8?B?SGFvcDNYTHMzVXdzMndBTWNzZTZMdlBobE4vTnJyMUFBQkZvYlpSbFZ4L0dh?=
 =?utf-8?B?blk2KzdOR3N4S3RsamkvNXhvOVBBR0oybWU4U0JXanBLdHV4OU5OcE9WU0tN?=
 =?utf-8?B?K3RXTlUzSEZlb0F0aHl6OW1XYW5vSWRwRTBRVmw3TlRYeXRJSGJpV2hNazF0?=
 =?utf-8?B?TzJFMGxiNG9ha05vamdlUnlsbXV4ZktCZ3gyaG1rNHRHaDJLMUdLR2VhY0Fk?=
 =?utf-8?B?TkZHQmJDZlZPWWtvclA1UEFldGpScjJHbmU5Smx3SzJ0OVcyQ3l5OW5aUkFr?=
 =?utf-8?B?V2EyUFd0Zng2eVl5d0QwREZHUW5LWDl1MkJTRnFtWmNhWDBBMDFzZnVsQjBL?=
 =?utf-8?B?ZXpaNnduOTRSMFNjTDZpeTRPMWJuT1RTVEg2dUo4ZEhGdmZYM0Rua05IRzBa?=
 =?utf-8?B?eHBRTEo3SXNSaGNDclBJTGs5UUNEYm9SaFllWGd6YjQ2NnBwN0t6N3dNcEJI?=
 =?utf-8?B?cTN2b0JZR1UrRnVwM25Eam9mUDc0Zzc0eHpucDdnaTJrWHI1WmxITkprM3Vt?=
 =?utf-8?B?UzJxdXBNdy8yRG9kMnpLWjBGT1lDNmZtRDlQaitLdHdKOUlpa2Z4Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc9990c-a95d-4c61-9db0-08de590426a3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:45:49.6775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiFx53sXkwKmiL7t0cAXpe2C9b/RhuZS6dnMMjRALy4Fnhi2KI9fiP2jVDL6E1cVQqLDjgRDiDim4qqy1Uvy0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7007

On Wed Dec 3, 2025 at 10:26 PM GMT, Andreas Hindborg wrote:
> Fix formatting in xarray module to comply with kernel coding
> guidelines:
>=20
> - Update use clauses to use vertical layout with each import on its
>   own line.
> - Add trailing empty comments to preserve formatting and prevent
>   rustfmt from collapsing imports.
> - Break long assert_eq! statement in documentation across multiple
>   lines for better readability.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)

