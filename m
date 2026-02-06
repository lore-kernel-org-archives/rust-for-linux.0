Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021108.outbound.protection.outlook.com [52.101.100.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669A1339B1;
	Fri,  6 Feb 2026 01:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770340588; cv=fail; b=u9b0u4sDWf6NiuhZytQzIU1DgkUC2nm4HhLAqr/6h8xeCUu9mr8zCL/kY84cxWLgnhGgXIfiIatE9Hm4f7hZt72Wd7+Zjo3vM742ZcX/PsceNHmmRoHMgDs+9QPw4CON+tEqgQdUBy4mH2i6dM2ndbRm8xo75wSHZemQPzijKTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770340588; c=relaxed/simple;
	bh=VNdRiB8R756+B8mQOyjRCjKlZ5Nhi3vsrotFNA64GDY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=neYd9IBTNqQj6wzKDKB0Uenag8WKBJbvDCI+Y9/PdByHP/XQ+5JewjtbVF1C1QtYCoaSv/cwzcV9YpDEqFTgofa1Ca7d/4Icf60y6ubiA8TQMpv+ixp5GG/7RdRrV0gma/PYPYZE+rAmJ8QJCtwzCxJLgCxlmVtPMsmnaotNDIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=vrYmGVib; arc=fail smtp.client-ip=52.101.100.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="vrYmGVib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGaKFJ/2WkFKz3GJvex6Qa+WTzGf+DzO+dxZEJusbz78QUF12FOEvsNoE8Fmwxkq5u1U/Zdew7WI+rf3UI9d867ZdgNhn/Uz/qGdharwoA++3nFQnJ7tG7v9V3sBVdHBUzZtHb8Je7KNXSj/w1auYNXLvTN+E5DLisVgMXp94BtZHSp1bayecBhSGjU/WNsueulXkWz3Isxt1onGo3blHT48Mp3+pCuLZ6tWnYRFarscdEPSafvW0G4hmDxaFA51WZZ+4+MlAp+uVmsj6zpShvIE0nTiNtU8gVYl1iBEKucKrXRovzBXlxyiD76IPSJKVNYpQl5qdlesuxLOl6doLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMnbAHmJjz6791GDNsDlsCF6HxnA9fQ1l7uY0Jo8R5c=;
 b=lI5HEyY9Ui2m3FOmQDpXkMPds6fq/K0NEnSICQg9/b0o/ELRkHIu8k1wOJ/dizdlI0G9xAu3T5swX2x2fyF5CvYcoB3+dz8OZ4dpwjPpHhcOUrmiUOqDq5akL6Ba+bKsAJG24zP6qnStg+MiM6NCSZiK7wsRu5FacAAZ1G5aVeMZJQeV3c/0omkDUscH0KnP8KG12zvC5IHTEJa0Bz2lmqLSek374TKIKfStNJDq3F0st7DaPGj49lUwdFRCATozwuj3AkJroVvx6N6JomQxweZnmABVZTm09P8qDm8chUDkbeLu4imZNfYRYs4g8xH36lG1lYta/wp4gV3rBnd1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMnbAHmJjz6791GDNsDlsCF6HxnA9fQ1l7uY0Jo8R5c=;
 b=vrYmGVibRBULu4HtN5kex7ykJdHDSTpW6OMAeBNwkGxb8x39yJLllL5GSHllmqhSiCpxJrZj57NjF9VnBy6eOI1Vwuea0HQMAx8VDIwDcjdps5QGVuWq/xOC9BNW3+50EzxdlCk5mt4AQ3lh6cV2dkF04AodE1i8pS4OWJ7Qndc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3013.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 01:16:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 01:16:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 01:16:23 +0000
Message-Id: <DG7HD0DPWUB1.2UAHI0CVE0MJZ@garyguo.net>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: fix aux device registration for
 multi-GPU systems
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260205221758.219192-1-jhubbard@nvidia.com>
In-Reply-To: <20260205221758.219192-1-jhubbard@nvidia.com>
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3013:EE_
X-MS-Office365-Filtering-Correlation-Id: bec61608-4077-47d1-e31e-08de651d57d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzNSRHdITlJwbjM1TGFCd3gwa09vWUNLZGRMa3R4RGozVThVOStXOWFONisw?=
 =?utf-8?B?UjZUY0lhcjE1QUlDY0FzaTZHbWRlNzFJNnk1d3NHdVZmYmlXUXVwNVNQalZT?=
 =?utf-8?B?bEdqR3VwZVRiNVFGV3hqM1NLU3JrblQ5TW4yNjkvaGZ5c0NZS3dGQzBxaDRk?=
 =?utf-8?B?dW1SQlZBUGtST3pwaGp5MmR2SDdGc1FUdWU5T2lGQzBhRjI0OG5MRzFKWXdT?=
 =?utf-8?B?amVoVWFIWEw3RlVMUGN6VE9UZXhTK3BrUmEzaHFuS1h0MEp4VFJZUnRZczRs?=
 =?utf-8?B?angrZGZ6ZU00SlZOSW1ldWd1Z2JHYWlQQjdNaWt0RjB4NTFuZUVYa01IcTZO?=
 =?utf-8?B?ZUJCYkpRY1RJaUs1bDM5cm5ZY1FBbGZwcWdGcXBqZ0R1RXVDS0RTc3poQWg1?=
 =?utf-8?B?ZXVuR2VnbVJZZDkwTHN4UU5lMVllR2tUTk41d0pTVlJsYkVTMmtpbU5sUEpy?=
 =?utf-8?B?azQyWVFWbGUvYm1kaFBKVkNncHVoSFdQcFdWU2Vyc2Y5UVZoNnNhZzFuNG9X?=
 =?utf-8?B?Tkt1OU55SlB1b1N6NkNPRC95eFdrYWd5SkwyS2t6SEcwYlY0V253SDZiQ2tO?=
 =?utf-8?B?c1VsSGtKSjg4V2V3UE9DeDBheU1pNnFPd1ZoWEwwMFJxZ0F3bkRWMm9pWllx?=
 =?utf-8?B?Z2FnMmtyMVp2SDZDclZFODJNbktJSUFhUk5MTW4zc2hhSGc4U2FQZ3R0OFNR?=
 =?utf-8?B?TGV3aEY0Z2xqSnJjK3Foblk3eFFsMXpOZTJWWUFHcTRMclBGdVlXOUpDeGtR?=
 =?utf-8?B?ZGFJQjlMM3oxNGRPRlBSelBjYnFuN1ZDYWZiOUlDOWZEOFQ1aFA3RVNaNnVV?=
 =?utf-8?B?SUJmeXJEekhVc2dLSnRLRVg0dHUvQis1U3Z1Nmg0bWZTS242ak4xVGhBZGxR?=
 =?utf-8?B?QW9vRU9KbEwzMGVNTURPNGxtNjMyb0x6NTJYeFduQ3lZbUI3azQvWFByRjha?=
 =?utf-8?B?aXk5WC9uNXZYdXFXOXM4WmRpclpEak5Pdlp2ZUhaU25rMXJvRllHT2hpZWxO?=
 =?utf-8?B?MmpFbGU2V3gwWGREWVRUSVRoNjNxdkNodkFCbHRobVdjTGVtQzlHT1V3SmhD?=
 =?utf-8?B?ODdqSkxhdE10UEF5dHV0SnA3OVJJbFFzckNIeHd4L0wxdTB6RkpaSXBLOFd4?=
 =?utf-8?B?OExFWGhEb3RnbmVOSkJiNThFUkdjRm9vdzNCNUFPcUlCaXp3ZmNwVEtSQ3p1?=
 =?utf-8?B?Q0QyWGwzeHdMcTZQRnorRFZrdTlaQ1huZ2V0Ri9OOXVPejJpcWVaaGhtVDdq?=
 =?utf-8?B?bStTR3pyZ3MvRUFXd2NhcVhuSDMzbFdYSktnMm9ka1UvbEwwR25KeVI3Y3d1?=
 =?utf-8?B?K3FVbU1RaHZIYnF4ZjF0VFRrdzRndzB1THZ1NUV1NkkrdHdIY01XN3d6enpv?=
 =?utf-8?B?bGRXdG5XQW9tOG5vVFloMG53cGdEenBOeE5LTDJZem5pWVhsMktMcjlCd1JY?=
 =?utf-8?B?VzE0Y1RTemRUd0hOZFkwUzRNRDNObFZPREl5bTNkZk1qQUl1SVFtSklJeU5l?=
 =?utf-8?B?SmI3VHFGL1hiL21WYnhVdEhGVElhTVo4YUdrMEFITzJkdFpVdHBzbGhMbVZk?=
 =?utf-8?B?aUt2bXlXZFR2eG9RVzJuVnRaTzdIYXZZMFVBZmExblk3Y21oZDNMTXB2Ui9i?=
 =?utf-8?B?dmVnVGVwVWhMd1ZtN2hqS0U1cHROS21Wd2xZWDBUQlJ6OFJ3ZVVocXFoVWpJ?=
 =?utf-8?B?TmJzaG1CMVZ4VUZqR3lNUGc1aHRqMzFqLzB6Y2h5a04rYzRQbkVMV0JtZlls?=
 =?utf-8?B?eXcyckwxQnByM3BudHljeDl5dVFEWVg1S0ZScXZ6UmprVHREYWsrMSsvc0xa?=
 =?utf-8?B?NUpQMUd5ZGcvT3c5d1J4R2pmMUJ5bW92TEpkRFQxeGxFZ1pwTTdnalJ1V1RW?=
 =?utf-8?B?ai9hd3lJb3c3VE1VbXgybzlqMytxS1hLbWswYWg1aWs3cXpFcFQ5aTV6M0Yx?=
 =?utf-8?B?aDFzQlZGWXdEY0xIYWttWTVVd0ZWelFwSHdwMEhjY3NPZkhvQW1WWGo5Y0Iy?=
 =?utf-8?B?YS9zUno4b3BtVm5RMHVxMUFFMk9EdGpKUlYwRHE2R3psSXRaamlQT3MwNWUy?=
 =?utf-8?B?amFrNWd5NzZCdUxWMGVlNEpLa2RGTWRtQ1V1bXNZRS9idkpscmRGdThBaFpp?=
 =?utf-8?Q?a6gs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzdzQmZWZjF5UVZZLzQzR21vWGhBV2ZDSENrdHJnMDM2azBjOTB3YjNoaDhn?=
 =?utf-8?B?Zzg4SGxJa2dROStWRjJRdWRmVzJGa0U5UzlyYU5VeFRyNzNOdUhieDNBcTRJ?=
 =?utf-8?B?Rjc2U1Q3ZUxna21YTEpkOTM0K0NJQTMvWThqRUZQVk1wektGaEtKdllHNWp5?=
 =?utf-8?B?VExPR3VGQzBHQ0swcE1VYWV4dXlJV2lXYzR3NUFCZ09SWG9hejh4UXZuSFh3?=
 =?utf-8?B?WjU3R1gxZnlZalh3ZjhoTGR4ODc4WjVGQjF0MStyWC81NEV4TmFPbjRNZS94?=
 =?utf-8?B?Z0dCWDNQNmJSZExhOVkzZWc4blg0NC9KRjJaREs5anRGb0JFTzJQYTNZZksr?=
 =?utf-8?B?RHkwVlRHMXMvMUwrNnVRM2JpV2txKzVlNDRiSUhlR3lhc1U5b0I0eFZ5Vk02?=
 =?utf-8?B?REdpSWxjM3p5bUNHSkdKWjkrWFZkSkFicWJpeVZkWEd2bXovOHlXNmdyTGlZ?=
 =?utf-8?B?WjM4d3NveEx1N00vMVBvU2JCbk5ITnpGM2pSMk0wWnIvSTlTQ01BeXMwS3Ru?=
 =?utf-8?B?WUZBdU9OZHc1TDlHdUxnNHYrQ3YxY2wrSzVaL1ByY013UDNlQUt6eWhUOXpk?=
 =?utf-8?B?MzBSWmhaNXR1a3lVeXJuWmF0ZjFoYkZJenhiSElyUTZJRW5NMFFRZldDcFlF?=
 =?utf-8?B?S0lYSFJBd3FzVFVzWDdWb0taRnhqenQ1M0orU0FtT0RVTFR2UXZTRmlwV3N1?=
 =?utf-8?B?ODZZWHNKclJkSUxzaEx0TDJGOXg2cFFSWFM3Qk9LUXJYaEsreW5MQlBPbkdh?=
 =?utf-8?B?TkRmTE40V1lHTGphR3orb09aQ1pSYzU1WFlzNnYvREJNYXhQVVZ6SmxPK2dP?=
 =?utf-8?B?dk10Q1hJaHp1d3U2UUc3OEEzL2tta0ZiaU96cE9BT0l4VmNxWHJDL3NxNTVl?=
 =?utf-8?B?UzMvc0ZDY1VzYXZxZmdvZDY5bFhvcW1xdjg5eWZJOGhkcnJEa0F1ZUcvUms4?=
 =?utf-8?B?RW9GbFBwbm5oNS9Ja01VejBhUWlCdFY2SEpBT2dodjFqcGppNWtJeG1zNksv?=
 =?utf-8?B?cXI5ek9jRzRFS2k0aURPMGpJUmVUZE5peG9rQmVHbTlUaXBrZXY2YnZTZUda?=
 =?utf-8?B?cnVFU0RaU25mZUQ5MWVLZVJkYUI0Z1liU2hwd1ZHNnZUemFzS0YyOUxTVDZZ?=
 =?utf-8?B?aU9kV05JSDVZMWhCcG5QZERwWHpJQk9FeUY1Qk9mWTRIVW9ISnczc2F3Q2Nu?=
 =?utf-8?B?YlFBaVozT1VFeGtwRVZ2Kzhzd0NWZ0x0N2N4ZDJwZVdrOTRYcktmRExZdFdn?=
 =?utf-8?B?WnR5a3NSdVd6RHFnc1hpOXhWUUkrbTRXVjhhV3ZGR1dORGFnS3AxY2FCeXVX?=
 =?utf-8?B?eVVLMmVLN2xuRVpNNFd5SlBGdm5rVmdwTUJxNUl2UUFWd3hLc3lncnNKekRh?=
 =?utf-8?B?cTZOUUlzNnJKK1Ivb1lXSFRoSWZTUEh0bjQ1RmJxYmgzOFordlpHR3JYWjBJ?=
 =?utf-8?B?ZWw4dXRLU0hZTXBlVEUyVGhPM2tLSXVrV1ZxSFlOWG4xVHZWYjNhUk5HcFNR?=
 =?utf-8?B?MC82MnIxdHI2MFh3aXh2eXR3bGM4STZWVUh2T0I2T1hkTGoyVmpiUHJiZEhV?=
 =?utf-8?B?NzM0aHJrQWUxNVM4dFZNK0pBQjZqYmZuV0VxT1FURjRiU01NV2tjTmxmeTZ1?=
 =?utf-8?B?TkVPQnd5N1Nrd1pHQlY5Tkd6d1NBYmdEMjBzRlphd3JRWEs3ZnIxZnh5cVhF?=
 =?utf-8?B?RWRTWm9ra1B2SkNGS2lRUmdGYVZ0WlFXanl3SnVXR1RpMm5mbVFXUk82YXhH?=
 =?utf-8?B?TDZaM1VCNUd6eTVETko5YytacDJiUy9SOHRjelpKcGRPOCt0OUw4d3BWeXNX?=
 =?utf-8?B?QmZacHd1b1dkSmVMRUxFcjFQTXJuTzhSbnFmcGJSTnR0dmxOSmtUaFRkbW5Q?=
 =?utf-8?B?bWVSVVNOQmg3WXBSaHVxVzg0SjcyZWJzdjFwS3ljRXVMY291NkVrMW90VEpI?=
 =?utf-8?B?SVFYSUZkNWhlZDluK3lVd0l0eGlKdWZIWFB6SzVURDh5UE82aFo1UllpWHdJ?=
 =?utf-8?B?UUZkeTRjWDN4WUloU3IzN2dwdzgvcWk0U1NsTERGcmhPLzBuZnArRFNHYnFJ?=
 =?utf-8?B?c1RJemxJVHNNS2xrOEZpR0pIN0NnbGYwV202QWh1Ly9NbXNtR0JOOVRNN3pp?=
 =?utf-8?B?Q1E5bGo2bHltZ0VHVkhRMmVZc3hVMkJWbkFmTE1iYkI5b0U4S2tQbDdCQktx?=
 =?utf-8?B?SGtWZlJWOEd5U2wvYWR2SW14aUZHcVMzQk1zM0R5VC9LVm5aVVFTa2dubmpw?=
 =?utf-8?B?NWgyZFZKZ1JRZEVpTCtWWTF6RFdVRHN5TXByeTZjdjhiSk9LNnJPdm5KN1FV?=
 =?utf-8?Q?0qSL2sJ+An1fchPo4u?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bec61608-4077-47d1-e31e-08de651d57d6
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:16:23.6143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84RtToFKz+if/UNhBzxwzlEx5mgx+32rGKJaUYK1m10W+78ZEqKGasj3vO/615STf4JfsC06RgZtvIuET+gaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3013

On Thu Feb 5, 2026 at 10:17 PM GMT, John Hubbard wrote:
> The auxiliary device registration was using a hardcoded ID of 0, which
> caused probe() to fail on multi-GPU systems with:
>=20
>    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/NovaCo=
re.nova-drm.0'
>=20
> Fix this by using an LKMM atomic counter to generate unique IDs for each
> GPU's aux device registration. The TODO item to eventually use XArray
> for recycling aux device IDs is retained (and modified slightly: IDA
> might be better) but for now, this works very nicely.
>=20
> This has the side effect of making debugfs[1] work on multi-GPU systems.
>=20
> [1] https://lore.kernel.org/20260203224757.871729-1-ttabi@nvidia.com
>=20
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/driver.rs | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> Changes in v2:
>=20
> * Use LKMM atomics (kernel::sync::atomic::Atomic<u32>) instead of Rust
>   standard library atomics (core::sync::atomic::AtomicU32).
>=20
> * Fix vertical import formatting (add rustfmt guard comment).
>=20
> * Remove stray "we" from TODO comment.
>=20

