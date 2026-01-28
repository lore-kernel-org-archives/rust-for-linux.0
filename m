Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021121.outbound.protection.outlook.com [52.101.100.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EC2E2299;
	Wed, 28 Jan 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614741; cv=fail; b=ZlsliF/T7hn7kvuA59+46SKCAYMiS0aZK1AcFJq0YdxHikoi29kb19Qx9qDRgU08AXXzsdt767MUWAbJ9SWSIUsJxCzmF083OLkKCFFe+8v2shNS140c+/hv54HD4DUjTClMF5wDyGVX9ibExsSCaLrLFIaGxAKNl74uHbSgbg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614741; c=relaxed/simple;
	bh=uG7DSAUEKRKaPNh38Do8NVdmE3mfMZ3pqJjQLMl8ks8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=r6kDQcXheBtliI/OTPXWyq/5Vxpxn5JUgVjEs/209J/2+nwxmr5Y8LcUqQEXMjL9PYWOjXAx+NLuJNCY2UnpgwUqrw4jrZ9bwuZgOROw+gWz9pXGRSvym5m+wESGBvqfDW0RTu/NAgRGE5bhNlWzCOq4k5TC/95j9h3OIjtmtWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZVR2DjLQ; arc=fail smtp.client-ip=52.101.100.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZVR2DjLQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aAMvEeorahOZinsNcJVr72O65ppIsk1rYldNqzfprzh+b5va2+7OLgDLvLpCndEKgSasvnAyO9mZDYXCUPeG9o2+jV/E1hMRG1iOfvtx8HrbGbrm9bq2GvXPa7G98FnPBBht6d6Xr89xn/ZlqvPK6nDKHBdPqlar/dhBSuUWPeLDm7fBkkCvHf1e7HYQrHTVmc1TNmnqWHurZasnFYLtzp4nSdkzUWPs/opCFXQC9GDODiiHcXJqfgffHUy2JlhTeyKKEYY8F3/2SJQzqcHHsM6QyH1OEB5pLdMSjJPIaCNUPQ/P3wEjksGaMA/E3gNgC5bK98JrTvjyPaNvLkd5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDv/vPkOFy1n86gRIKCB9eNcSsgEz7hXZ9Wk3uK8rGs=;
 b=h5+HZECoJKfLmk+28pIXK0qb+cZf/qwsxsH/mV0VtCvDkCjYzWAuLEq7twFWlqR5U/2eYEJYgM391ilVgAalYtY2CUitx8HUFrj7RI8OgzeEB7WbdCuR1JN/bGWQL2MeGW/9yG2C7xD0tlZAzaWuNzVQyJwjorFelVNtOfTRGFZheYVSU8s688fDa2yhkzmdnBp+OBAcrNmPF9PsuIHuoI3IdKRWH38HoDWwzJiSEs0/TkNT+6NYp+n/eg4PKZT/T6lK14XmYIIngfsJHukBjzPah9lk3n9v2FyRMbvN6RnFjsXOQF5M2fCVh1Tri30qcQiIjTTEbW83HQR3ZDHKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDv/vPkOFy1n86gRIKCB9eNcSsgEz7hXZ9Wk3uK8rGs=;
 b=ZVR2DjLQIl1CbzQHo42evS5kCjCuyqd9tnOh609O1tg3TBS+DYpKvVs9QeDifwZNSHlceiodw941kRsI5OH018+m/6r7gHQi5tzytNaKAZOGoLAX9f/RKDgqA9Qepb5MjnTt5FewEp8BPEiYSXAhtBPFBPXdFR8bwlsEUx7SR54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB8488.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:474::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 15:38:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:38:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 15:38:56 +0000
Message-Id: <DG0C2IULPNPE.BOGWDL1X80TL@garyguo.net>
Cc: "Yury Norov" <yury.norov@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin
 Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Dirk
 Behme" <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/7] rust: num: add `shr` and `shl` methods to
 `Bounded`
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
 <20260128-register-v4-2-aee3a33d9649@nvidia.com>
In-Reply-To: <20260128-register-v4-2-aee3a33d9649@nvidia.com>
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: a597868e-1990-4f1b-43a4-08de5e83594c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WW1TVWtGa3ovSEc3bDZjWkxJODdZRUo2RnpqcHFWbEkyUi9oYlF3NDB3U255?=
 =?utf-8?B?QVlBb05sRzltRXBRUVlqaUQrUWRrZFMreFl4bHJMdHhIU1lUNWJ6ZHkxbkZZ?=
 =?utf-8?B?SjZuVHRtSm1jUVFVOUhKR083VGc2QkcxUDZBUTNJdGJIRGl6b0t6S041eU5S?=
 =?utf-8?B?WS9MRWF5bG5XMXpFNXB0VTZ5RXdpTUpkdWZqam5MOC96U052Q1RtTnpBd3Q4?=
 =?utf-8?B?TnVVU2RTYkxiK3VMcnl6dG92SjhBY3EyRkp6ZC9oQUdkYzJPYjdEV1lBdDB4?=
 =?utf-8?B?QUx2bFlwWkxqUC94dUZoenNwdFFMRlh2Q2pqcmx5SEJXOWZDZUsydi9XVjlM?=
 =?utf-8?B?N3AzbGNXTGRTTDh0bjFpMkVrSVNtVHpDMTMvNFFwZkdiUzN2aU9IZEp1akRo?=
 =?utf-8?B?NmEwamVVMklTZVZKaldPVzQyU3pBdWhhTW50ZGJtUERqUkpRN05vbWFyYmJ1?=
 =?utf-8?B?d0hTVDY5YmROM1M1SHBnY1FPTXdTMHVQa2llWlRlbndzYSs3L2ZjUFZKOTNs?=
 =?utf-8?B?VXRkTWx2NHhVbFhGdkpNVE9HNjVaS29nU0VCV2tmYWVhclVjTHpsNEUwQWJv?=
 =?utf-8?B?T3Z0Q1hsdHlycEpZRFRBdnZOaVlRR3E1ZWVaYTN1aGJ1SWlyb2taMnVVVG1D?=
 =?utf-8?B?Z0lPQ2NxY0NVRHoxY2Flc3J4RFFSOVFMek5aUndxanBJM3F1TlErY1E4dmJL?=
 =?utf-8?B?RnBVU201Mzl3cDdnbTdQWUhjRE0xUVFTeFVZTnlCaVdoUUJYU0JsZDZIOVQ4?=
 =?utf-8?B?ekRDYllHZGVmTTU0dFArWkVRakV5bHF6MGZTaHFBcDlQUmJNUkM4THViR2Jo?=
 =?utf-8?B?dlc0MUk5UkFHS0FWZ0dDcjBEanhhSFR6a3pBVFIxdUdnLzNHeE9HWnBrRkVn?=
 =?utf-8?B?Y2lBUG1TUFF3Q2czcUs2SlBCazB2UVdDN1RUT3R3Mkg5ajI2aFRSWURUV01u?=
 =?utf-8?B?cG41aVR0M0dpSnAvaFVCOWd1OVRRZjNNQWFYZWdBNmlmOVlqYndNUkx3ZUtL?=
 =?utf-8?B?bHA2aVBNWCt2MnlnMnJHLzA1T1djQVFlelc4WnNWWmd4RzQxalV0MWRkRmp3?=
 =?utf-8?B?c2RPUFpGa2ZOVk9iZ1orQUhqZDlhNWFNVmlzT3JBUDQzRzEzVFR4NnVQT3pl?=
 =?utf-8?B?RTJwV29RSTVTenpOWDIwdzUwdVlOU2NHUllzQWMzQzhpbko5aC9vZG1qMmJL?=
 =?utf-8?B?d2ZiVGM3a0Z6ZmlZcjFqdDB3a3NHRDhYd3dqUksyREJ1bUt6WDY2Ulk4Q1lk?=
 =?utf-8?B?d3pSbDBERWFZUG5yYm45akFjRjEwWEdhWHFkbXRwenZVTjhpRWlleW1zSkpk?=
 =?utf-8?B?S2c5emFmT3l3Tm5Ucmc5OGtZM04wOG9SNjFFQ094QVN2T1FoQmZ4a01XSUdr?=
 =?utf-8?B?c3VRRGFpV0trc2RVdUdaQWJ2eFhMcThGUlpUY1RoV0xZTnpFdnhGZTl0MzFP?=
 =?utf-8?B?ZCtTb3V5Zm1IQ2p0blJxYmdhaGZNNkI5UmdyZ2NRTTlmR0lzUHpEdFFPcmZo?=
 =?utf-8?B?VEhrRmJVcmhmNjhXQ2pkcHJIRmkyb2RYM2xFU0dEVTVKaHp2Z3F2cWNlRmcz?=
 =?utf-8?B?akN6RnhZZzRHQ2hTN2MvWGZncXkyK1d4V0VoTit3VXU3QjhtZVRLZFVMc2Jy?=
 =?utf-8?B?MTlRamMybkNWZDNrODdaMnhvU201RUFHbHEzc1o1U2hHRTdtY1dmSjN5MEZ1?=
 =?utf-8?B?bnpXbDVPYUhYSnlhUzJtQzNwbHBDQnBrcVkySGZOMFNQRGt4bS9lRzBQd2ZT?=
 =?utf-8?B?VVUvdXFrZ3VRcDNTVGQ4RjZ3Z2pGeXo1bnZhV1FyUktYclA2bUthVmEyaHBV?=
 =?utf-8?B?M0xXNlVtSTE3eU1EaVpKUkdaOFdIdmpQZTZzQmp2Y25kQWFtL3MyVFdIdzJS?=
 =?utf-8?B?b01WWUZSSEVGM1ZKb0lBNU9zQ0R0MG40OThGS0pJTFVxdGdvVkdMWGVKYzRK?=
 =?utf-8?B?dCs5WXZRRnFVcFB6b09JTW5BWFE2aDBPUXVVajdBMFRhRDc1NjNON0svS0hw?=
 =?utf-8?B?VDhjc2hxanpEUDZ1Szh3bTRKZThWY2NhN0IvSHNKUmR2QUkwV0o4QUFFcEZP?=
 =?utf-8?B?ZDZXdG9YQkhla3dhRFVVYkE1am5yU3RTdHgwT0c1Y01WSDVieXdLYzEvN1Ir?=
 =?utf-8?B?emlmVVFxSllzY3I0UmpRMFhwaFpGNTlLV1lHWnc0cm04Sy9PbjBzMlFrQi9H?=
 =?utf-8?B?R1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkZRZTdrSEhwMmRMdGtwTWhyb204dGwwQ1BzRndLSmdvTGhEak5kTFRVL1Nt?=
 =?utf-8?B?QWxSTytyakVSZEszcFlCWkcvdDZHSGRYbHlnYXVweUFQYWozdEdHY3ZyVy83?=
 =?utf-8?B?QXUyYVQxNEFKd2tVMUFhYXZiMnJrak42NThJMzU3Q0dTKzY5V1hNOExNNkxV?=
 =?utf-8?B?T0RZMzhuZjR1Mlptd1BMbjZRSVZtVjg2Y1hsWHpSbjBCb0c2bVI5b3Z3a1pm?=
 =?utf-8?B?MUNWWm15RnJCL2Y2Rm8rVU8xQUhsOGlBei9ZSXhOUUh1c1FIZHpWSkVVWmVo?=
 =?utf-8?B?V1FjTkppVXBkN054RkFEZHYxb3R0T002eXVwcGMvS205UmhVR1cyV0xmWEE0?=
 =?utf-8?B?UW95VlgvcTlJaGZwSjlZd2FLUWlKUzJUMG5sSTVxUm1xNWpuUWZpQU1nTTEv?=
 =?utf-8?B?N0Y1WVpTc25TSWhiRWxlT2Y2YnpBbVk4UmdtUjR2ME8vWERhV2Mxam8zVmFs?=
 =?utf-8?B?S25rSDBkMUdGaU5iMWlMbnR2TUc5dU9zZWU0RVltK0gzWmF3b0x5OGlJMnl0?=
 =?utf-8?B?RFlvZ083Tk1aWlhPNzVwK3Fsb2FrRkFsM1lmMHdwVVdlUzFWOVg0OWZSaU5Y?=
 =?utf-8?B?L0tjWlRLemNKOGVVZWdqSDRnQXlnMStvODBlem44eHdLN2w5Smg5dnBtOTlR?=
 =?utf-8?B?dklsTXFIaEpWdjlpdVJObU1uSGZzdnV1WitzZ0E5Z0c2VENrMEs2Y2JQaEFC?=
 =?utf-8?B?UjVpeHBIOUVvTm1ZSjExbXRRQzlub0dUdzNRRXJDR2xTbDBMQnVpOXlMTjFy?=
 =?utf-8?B?ZDJ2ZlcwWkpTSitvZkdrWVF1MU1xY0F6eGR6TThyN01lUmdrdWRFbXArZXBH?=
 =?utf-8?B?b2tsbWFtZkdFdDRSMDJTeHk1WjhWdWhiQkRPVGhjK0dZeG9Db1VJRVkrYmh3?=
 =?utf-8?B?SUpwcWp6MnFuRHNTWWFUbldXLytHUTZqUHoxYjdJMzM0bm1MTXcxMUt3aVdt?=
 =?utf-8?B?ZStaVGxmVE1jRmpkOXl5UThMK0JIT3JrbTVNQzRLWmgwRGwwYmQ5SVNPdDR6?=
 =?utf-8?B?Qm5jRG0vY2R4T25sS1BSSk1ORUdDcmh2dzJTUlhLeUpGb3hiZ3BtdVc1Snli?=
 =?utf-8?B?U243YUhrNnNuK3RNWW4ybjNFOXdrYzVXaFpXTEZ1N0ZzeU42NXBUSmJsRWJN?=
 =?utf-8?B?NkdwMzZKTjh2WExRNDE1NjFxL3dXUUo4QkF5SDhyTzNxMC9GcjZhcGJ5UUp6?=
 =?utf-8?B?RDRoN2Y5RlVyS2FJMlpuRUExYXJNMHRqRHF2Q2I4VnR3dy9VY1ZDRnN0OWVn?=
 =?utf-8?B?dFdlSnZac0lucnFBU05zWWxoNUJ2UGFxMDB6T24xbE1vVTlkeGdWZnROTUlH?=
 =?utf-8?B?TVFXRS9VeDNmSWs5eU9vS2wzdFVtZExTa3gxdjc3clZiY0FwOGw4aExkalVN?=
 =?utf-8?B?am84dmJ3dVIyWlZGQ3FMMjI5aEtVeVZOVFQ3WkdhVW84dHUxRlowNVNHQ1ZM?=
 =?utf-8?B?Q05FTzB3V3U4cWdzWkpsQmZXWEtSamhaOGFUamMyTkljQUpQRGpsNjFpQTRP?=
 =?utf-8?B?a1JUV292RHpESTJNTFd2cGFJT0poWU9PYUpCblZpL29RWDA0R2FQUjQwdTlH?=
 =?utf-8?B?amdhWVpyTUZydFZ0YzNvNmVNQjlxeTZYWUc5R0dLbVgzN05wNXVPZ3RweTlK?=
 =?utf-8?B?TDhBZnFVUGtPWm5ObDZFL1N2ZFZYUFhuU2tROUR5dks5QUk0Y3AyZ21pbU9K?=
 =?utf-8?B?Slk2WkpNRVpQOVFXTFBGVzRRMWhzVUpCbGhwSi95OExPRWlPT1ZvUGUzSS9O?=
 =?utf-8?B?L3lmTkY5dzRYdHcyVGtyR2JwM1ZyQ1JDdFc0dFhSTElJYXVzdFJMa09uS1ZN?=
 =?utf-8?B?S2V6Ym1wb09mSGlja1VKNFo2WUM3bVQ5UlBYRVlqaUdYWE5SeWRvYkZFdHJn?=
 =?utf-8?B?Qi9KRUNVZkdpZk1VWnl6MHVLRkVKWjl1RVh2aklVQmRkNG5NK2QxYkhDSStq?=
 =?utf-8?B?VzhFdlhQcTdoa2JoaDkwaTBhNG5EQkFpWmpqYVRXekU4Y0FVOG4yajN0UFM0?=
 =?utf-8?B?WjVvRGhxaTF5S2MySVNadGdYaktTSWpOZm5PdVRRNTdsVFJSUHFQVENmcnYx?=
 =?utf-8?B?N1JiWmptdXc1cnZzTzdtaEVzMm1Rd1NaeWVpWFJOT09Bam1aNzI1cjVST1lL?=
 =?utf-8?B?d1o2bDNyUzZuRjlkUHJ4VWRTaVpTWDE1cnlCSjNSMVByZzhFMVRiL21RWjU2?=
 =?utf-8?B?N1N0SE1zOUcvSWRHV3VVckVjU1FwQmtCRnRIMDVjN3VKTWRYYWNad3pJZUdt?=
 =?utf-8?B?LzkyWXZadXJ2U2lJQUhHejF1N05kam5ia3NNTUk3bDY4UmI4K2I4VXBDS0w1?=
 =?utf-8?B?TFl3NUNVaWxHaFdHTkF2T2FCL1VzcFRxSGw2ZEthSlF2WmhkQ1ZNQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a597868e-1990-4f1b-43a4-08de5e83594c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:38:56.6085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISjqMtO1jHZ+5RVkI0B+jClYNMWghcvHZQ8jVPmuZ90Q1e5WktY6ad/PyGGXeduE0sUBJBgVPrTPqNG1aJbckA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8488

On Wed Jan 28, 2026 at 2:37 AM GMT, Alexandre Courbot wrote:
> Shifting a `Bounded` left or right changes the number of bits required
> to represent the value. Add methods that perform the shift and return a
> `Bounded` with the appropriately adjusted bit width.
>=20
> These methods are particularly useful for bitfield extraction.
>=20
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/num/bounded.rs | 42 ++++++++++++++++++++++++++++++++++++++++=
++
>  1 file changed, 42 insertions(+)

