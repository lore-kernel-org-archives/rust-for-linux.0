Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022102.outbound.protection.outlook.com [52.101.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1720335BD5;
	Wed, 14 Jan 2026 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768415212; cv=fail; b=VC5kNecLu4nNZ2HU8V6it6dkuLE4H9WMyKJOgxaryg+Z86Vvg9f6eVqXngNdmzsIXv5rHE75dQNSFrDKhb2xSFStRNEdROOyGZvQchyWWjIOzes7DskU7S0ydV7XIsUB0BDHdrU3GaFh1gZkBoeh6uTSLs2ZxghOqbmrLfQxqmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768415212; c=relaxed/simple;
	bh=+pvtaNIVRDT4/OnT9rvVFnrHoZoleeFtl7XokSYrdPU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=i1A5EUNwRYf2wee3y1HbdWO9DkqYqV0bwe57/lhhsNbL9jEFPbzESta8KmEtSPk78ySrzfQ7/YupDGX3iVXVHrjqWZGh/qZgj64WJkS949zs+uW9KIVrogw29pzh1qh7vb7DE0G4+RcUc0iZFghDL2g2DLjWN5B4VWf6UMhVn28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CNHW+61I; arc=fail smtp.client-ip=52.101.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CNHW+61I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBcSJ3c5/oWEuvOqAsjGKmhxpBMFF3WusuBDX7qqDtMzQpiPpVTjyZeStWr+ekb+4wrwljs5bEhZEx7oIrB90PTlFAGo0I4DYWRfuKARCDNUkSl7CXfNzLlzLOA52R8uvFdxRPN70R3YyQAodG0QvRuoFKyHlac3Feece4V2E2INCxs3WgmWHZiNfBTOxLTaADaqoLixM/vHahzXStKT5+mtHGVbjR5o/OGXqMaEvBGTqx7p6ymgpkAWXeX9CzWUZW8CRMssWB+q2RR3MfxkG2k1u+TDyUV+Wc00CeBGkdbQUQ2/Ew7tfD+Idkf0fOxMvmMQcpyZ/FcQxH65YKkAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxXy0zEprjKI8eOGXdDl0ZZ0q3YtI+3SjZhWFq7Pu28=;
 b=dQIcIIV+skSDrkFK5pY/YFUrr0mmjEcpGOX6g7sZtcy1z1iRvP9NdDS7Dx+pou/Kf4yzDaCIVOfVVsaSMirI/r+y+gKIyrIzeGK0/YRZGDeuTcrRqXd3y400oJ8QXWItM0GbXoOuXNKE7rxU1R6Y78r2DMNDV8fA8Ww93NaTKPr33XNin5Rxs2DU63bwU+zEfeohZjDygyH5JifqQqzM+llv1DgnQRmELnlF4xrFMMnBiDDnr0RutO+A3l1MCVIAVK6vmIlQNxtVTqC3yHeHYK6Ctt+7SB1bCelXB2arDMoz9oz3mmSQYQ53LaP3xNI6Zhq5D+/FazyO/v9FKwlPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxXy0zEprjKI8eOGXdDl0ZZ0q3YtI+3SjZhWFq7Pu28=;
 b=CNHW+61IH9enRmxhT8tH6w7Md6hae16X23NiMwn0kQy4hYuWzuCe/jhxTaU49CyFRrmZxufboaBw5DPOC10f2B4PuLmu+B+EEzsUnHGG2T+4XDwiCQzF2/S4/aVdZVAoIFuWFhSbbSrUKspCRkFrnpAhMWpnrpygt4T21Npaflc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2966.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.9; Wed, 14 Jan
 2026 18:26:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:26:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:26:43 +0000
Message-Id: <DFOIVDERL2IO.1UMVC46XAKVPC@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 04/15] rust: pin-init: internal: add utility API for
 syn error handling
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-5-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-5-lossin@kernel.org>
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2966:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dbf6c0d-e820-4028-84ec-08de539a7893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVg4YS8vTEw2dlZtMTFLcGtNeVZnVXpQYzJHM3h3MXR5VU5iWndabkxvSWhZ?=
 =?utf-8?B?cHZFTklrZTMrNEROdGMrVmVSSnVhSVdHQVdRNFk3S3cxK2VON2g0NFN5TFgr?=
 =?utf-8?B?THpaR28wSHpLYXpPNzZLMkltVnJ2VFZpZ1JTSzdDbFdlZ0xSdFNCTkgwdHZ3?=
 =?utf-8?B?bEFXeUNLM3VNQlFZMnNYbzRkR29RMFcxT3R4UkF6K2h1TXFsL1ZSYmhpT2NV?=
 =?utf-8?B?eDBxdHpRNHVDMU1sOGJLZlN6eFVUVGs4bDByNExJNUs2VXVXaDJubExIZ2Js?=
 =?utf-8?B?S003TXpvek8weFVaTHc4d0hUNzd5dlk2dlJGakxCT2hJbDE4OTBoQWtXdWRB?=
 =?utf-8?B?SWhnSWMxUkllS3BCS3FINnhFUm5LajYxS0YrZ28wbFk1S1lqNXlIeVFUM0h2?=
 =?utf-8?B?ZzlGZ1RnSFN0c2hYU0xjVG5NM1REQmxNQzBhL0xNa3lhWFBVVWFUbS9PSjlQ?=
 =?utf-8?B?M2pUMjR4enZiM0V3aEd6Z1ZWUTM1VW1rRjdEUW9nSTU3MFlQU1RJdWlNS2lR?=
 =?utf-8?B?TXdMYjNBQXZOMzduY0RPK2ZibkVNMHQ0VWZvRWVOMVVGNG5zTCtPcDV5c1A4?=
 =?utf-8?B?R3FzOGlsMlYwNFlkaDJ2WG5YWXVqVmlDUXJIZ05SZGdkRTFxV0p3ZTNSL2dB?=
 =?utf-8?B?QnBPc0pFa3I4dFJCK2NFTFB5ZHNtZUwwS2s2S3BPc3dmcXpDQVZ0N0UzWnh0?=
 =?utf-8?B?L1FaanNKd0t5ME5kVDZWODV3MlFKcTJGV29kSklCdTBDVDB0TDJUV1BWZlA4?=
 =?utf-8?B?emY0YS9MMGZ6OGlhNlZ4b1RSWVZhem9FT2UvaXRuN2ROTjdmRWlYYjBNT1A4?=
 =?utf-8?B?blJUZ1NSUDlSKzJ2NWpmQnR5SWFzUGVQUGtnMmhEc1dzV0JKcHl6ckFXWXRr?=
 =?utf-8?B?Z0YrclJMeENUdjBNbmM3WXhoeU50K1A3eTVhM25ieGdHNlpFSFFzbVBJOUVF?=
 =?utf-8?B?M0c4TDFCenNMVWRGcEd3aDh6alBNbnJKYjNxYkx1QTVURTRDNnUrdjJUdWlv?=
 =?utf-8?B?WlVYbDRjZXJUS3hJYnlLajdDWjlYYW5QYkZGS1N1NVQrNEUxS2lQTDlLQWZG?=
 =?utf-8?B?Q2kwRCtnOThJQU92MW5Cci9DN2U4Wm8wNFUwdlZkbUQyN2pDOW9EaEYrV3Fx?=
 =?utf-8?B?OEFMRzQvSytuTjFsUEdKZEhvSCs5T2JXMitkbUx1UHFxRzM2ZjZGdkE0QjJW?=
 =?utf-8?B?eFRnUVpReHNqc1BrQ08rcEV4TVlaNVNHbXYyUUc5M0hoNWJIUktLYlZRMWI5?=
 =?utf-8?B?WS9pb2d5N2drWHpZMlZQSDV1bWRucElieHlaNXhpS3YwNVRtd2ZteDFMZFVx?=
 =?utf-8?B?ZThObzI5TjFmemRlZVVFVXNXRUpyTGR5b3BPbXpqY3NrWFBJNXFqUEpLSldq?=
 =?utf-8?B?eVdmVlJORWdSR0w0TnovT0lPTVN3RnU3OGdqN1VyWXVoaGNKM1pZUkhvMWpM?=
 =?utf-8?B?RXJ2T25rQ1hRTEhESGlvTFhpZk9reXdsaFhEdDdNQW1RQmJJU0lib0RGbURI?=
 =?utf-8?B?L0h6OXBUa3ZSeVdyZHdndXRrc1hjdG42MWVkK01xd2Jrdm9udCsxZ3VDYUtB?=
 =?utf-8?B?ZzhMVUdnQUlJQjFXQmY0V2dSTDdCMnU5OWhaY3Z0R082S1dncVZOOE5yWEtn?=
 =?utf-8?B?cno2bjlLVjRKNldINXdZRFU3TVRjR1JLK2REdGNIOGE1MHg3OXZPNmVWT081?=
 =?utf-8?B?S1VMWVJ4bnArWGVTdnlWaVdTU1ZyZXhLWnF4N1ZUdG9aa0pWTzdWRFpOL09m?=
 =?utf-8?B?YWNVcXFCZEpKbXlHK01Tckp4azk0QkZUZ3R1clhZb2FSU3BmNXNXdXI1Z0d3?=
 =?utf-8?B?NWZJbTFNUW5lVHBuQ09MZ2Q2bGpDd1Z5bFo0bkMyWjU1a2VsR2JQeUVmWHlu?=
 =?utf-8?B?U2JNTHEzbyt0MGZFTC96YVcrQ2lpSUg2dVRhUkFYT1dMMjdIUnJwMDJ4anhP?=
 =?utf-8?B?eVE5SCs1YlZGaGlhbDIvT1JwdWRpM2ZJM1JDVWw3RTdiTG4zeEUxcGViM21m?=
 =?utf-8?B?TklId1IzN3ZYSlRPUGZTY3FVcDAzWlltM1F1K2tOamR6eXBRRG5yczhDODF6?=
 =?utf-8?B?TzI3QzU1dlo1ZEYzbCtMMnVQSUlmSGVTampEN3BNYzFIUmNOMWJmMDBiNVlr?=
 =?utf-8?B?SWtJb1ErM281aEN2ZGhvMjlPUGRRR1RuWncySENqam9BL3o3WXpMVXJ5THFr?=
 =?utf-8?B?dEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXNUbjdyNTRRRVc2SVRjaTBrUlhJTlJFUnBoVnkzRTgrbmUxd2oxS3FyQnlO?=
 =?utf-8?B?RWhNNm5NQXJXSlBmczZoQk14ZGlTbnV6VFFmTkFLRnhRSEdLRnVVWTJNdVVT?=
 =?utf-8?B?aWNlQno3VkVZam8xcFdoN1ZsWjZhK2pJUnJ2eWZqUmprTGFvQmhjR2JVWjFr?=
 =?utf-8?B?UjZkTVZ6VDlPTzFuSkYwR2pNdXVseTF0KzRkTml2SS9EN1ZKS1dWQ2VlbWdw?=
 =?utf-8?B?OGZKYllXbU5xRzE3VTA3YmtvNUdaOVVxWUdCTjZKc3g5RVNUbjNnTFliZTVQ?=
 =?utf-8?B?WVJGcWFJUDQ2RzZQQnJ2WGE5N0oydWEreWo4ZEpCdlpwNjVlbU4vRUYvd1pN?=
 =?utf-8?B?a2ExZThwRzUyUHNVeEdZNlF1d3FNcnRZakx6OVpkaHVoM1hDRGR3clc4TGRB?=
 =?utf-8?B?L2tSbE4yY2loUjcwSG5sWjFMVDI3RVNKa3VuOGNDejE0ZHJtOThIUU9WMjNq?=
 =?utf-8?B?c2M5cThFVExsWVZZWGhrOTU1TDVSaURMVjIybnQyblYvTG5VVGJ1ZHBNdUx1?=
 =?utf-8?B?WE9QR3RRVnNUMkZVWVM4bFNMWldpaUhSUjJmSU94V0xMWVJ1WWRRU2pEdFMy?=
 =?utf-8?B?ZStRYllBNlRsK2FVVUZsaUxNRjVsVm1lK0xEVE5SSFdROGZRalJKaVJESTVC?=
 =?utf-8?B?RDM2K2o0amJiOXFLSU05amRPRDgyT3dZTjRuanliNlZGaW43UzFiNmNlRUFL?=
 =?utf-8?B?bUlTeElVTGFyWTl1c1hpajY5VjNXbTFhRXJMQW1LekdsdW1BWlRBb2dUV2Fw?=
 =?utf-8?B?UndUbTZOd0xoRmpvaVlld3FLRHZybWhyZ01sU00weGtrQXJXOHVnNmRta0xV?=
 =?utf-8?B?T1h1VHlITkVVUXUzVEtIdC9tWGFWdUNFZDVuTUdPNmZuaDF0dGljQnN6TGhF?=
 =?utf-8?B?bGlVUmoxaTRIVnJKczFHS2c4QlkwbDlvK3VyQVc0eG96QkdYODhqZjRLdzlt?=
 =?utf-8?B?Z0haVXl4MkNlNWRhZmZBRjlydXZqWk1MeVphVmlCZ1VMSXBhbXVqMENGcU1z?=
 =?utf-8?B?c1NPQjNEU3RyTGgvU0I0UStxa2tGa0tIbGs5UVJkNG0rNFZ2SmQvTlVlVGFr?=
 =?utf-8?B?YW5GRnBObDQ0R0I4aW5jVDBkZ3l0REh1bUdtaGdVQzA3QjJ0a2ZCcjV1bWdy?=
 =?utf-8?B?SWIydHJScTVudmI0SmE0VnlRS1FZMlc5UkhJeXJuVDNzS3NGRkhEQnRlSmZV?=
 =?utf-8?B?bGQxRXZTdVF6MHJ6S2REdXVBQW9jbmszdWlrc0VTcmFSMUQvR2h3elhxZWYv?=
 =?utf-8?B?QUxIOFl5ODg3N3l2V1d2elRiZ2VBcG94R2Zzcnd2WkNLN1dacUdIYVhmQUgz?=
 =?utf-8?B?V0d0MHcrTXQ2TUdCTnJNNTlSajdidTlpem1GWUJpblB2N1VqaEZKQWQ4U1lZ?=
 =?utf-8?B?MGJ1WWF3ejRYUWlXekdyT2xoZUgvekpybGNPcTZoamtjL3VlWDUwUTZNS2tH?=
 =?utf-8?B?ZTdzZ2czQXZaclJFaTBnY1EzUXduYVNVM1N3UXEzeDlNbGVLSzR6NWN5dFh1?=
 =?utf-8?B?SUg5c0xnb0RIZHVENGhuczNyc3Y2d2VGWURPODRMV0t2T2d4bTNiVUJhNkcz?=
 =?utf-8?B?WTMwS3F4ZjBJdkF1QnRrTUJkVjdjblE5V2tqZktLdnJBOEcwT01xZHQxWHc4?=
 =?utf-8?B?U29Td0ZET2NMZlplKzYvKzBEeFNWVGtDUTV3Qlg3QVMzbUJEQldqQUg2VVBv?=
 =?utf-8?B?WjYyZ2pZdTFYempnN2xzYk9JbEFiNFk0UWZwa2x6WnFpaXhzUzIwd1luZXhT?=
 =?utf-8?B?MldrOUtYN0YzZ1hLLzNLSHZGb3EwNDBhMmZ3RUZ0RXBERU02aXRIY3pnYkdT?=
 =?utf-8?B?UVl3T3RPbi9NR0JIZjNnOUhlbm0vTDhkR0c0QWxjYU9jSzNTakpWeVUwcklS?=
 =?utf-8?B?UEgxdC9aSnBsb0pUa0l1L0NwNFFhSGpMaXlMcEJIdnNqR3ZoMUxQY3pHZGlL?=
 =?utf-8?B?MURTT21EbnJJd3JUQWxFYUdSMzZUQUMyWG42R2hxQkcwK3VSRnFPZmlieCtB?=
 =?utf-8?B?MVRYcm8xZDdIRFJiKzI3RHo2RHMxMHVmWitURGVrSlhYNjI5QzFzZjVkUDRX?=
 =?utf-8?B?azgwTFdJcnhmT1V1ckhSekJLN2hoalloNVNzVzhjbTl6M0t6VVgzMHVwWWds?=
 =?utf-8?B?clIveUxGVmljbjBJVTZZN0U3b0tWQnV0Q2lWSTN4UFNqQjFYemE5QStjZVRj?=
 =?utf-8?B?azY0NkVpclBrVCtzZXFUeEY4bTF4L1VKOXBxQnJpMWUwYUtMbUxHLzEyZER0?=
 =?utf-8?B?akI4MGZnMWQ2WEc3MFdrVlVHVzlTdXI0bkU3d3l2c044d2hpc2dyVTVJUXQr?=
 =?utf-8?B?SHkrOUhQNkRtU1NqNDhiaU9QYmlsZ1BzNitpekM1eTltbnQwVldDUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbf6c0d-e820-4028-84ec-08de539a7893
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:26:44.7390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Fg4AX+yL3xyugPJqvTFTuYQQbHNBN+OsIUcZxx7rARww5JDUhviwMoaTZKjfkD/i98FEnU8mjPpksc4eTWj5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2966

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> The API is similar to diagnostics handling in rustc and uses a
> `ErrorGuaranteed` value to signify that an error has been emitted. It
> supports both fatal errors (which abort the macro expansion immediately
> by returning `Err(ErrorGuaranteed)`) and non-fatal ones at at generation
> time. These errors are appended to the token stream after generation has
> finished normally. This allows giving good errors while still expanding
> most of the code as expected to avoid the user encountering additional
> errors (for example missing definitions).
>=20
> Suggested-by: Gary Guo <gary@garyguo.net>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3: switch to Gary's suggestion
> Changes in v2: added this patch
> ---
>  rust/pin-init/internal/src/diagnostics.rs | 32 +++++++++++++++++++++++
>  rust/pin-init/internal/src/lib.rs         |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 rust/pin-init/internal/src/diagnostics.rs

