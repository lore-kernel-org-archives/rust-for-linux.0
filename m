Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FAD27603F;
	Thu, 19 Feb 2026 04:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771475219; cv=fail; b=jzuQcu+zYirS3TmlyZ1X3EjUtzczs/KUVlyu6ZWHg0NQvxgujq6DbxgY7XhCiBRoY1ii7UUM2eNqalhBsT9bqCRq8o37riac0VO/cJoC6c5/GDPnk86FTNZfHCRR6rl3Gyc30fc1EQ4VSg4csE6VY26g4KZaqN+fICcyk6+LAFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771475219; c=relaxed/simple;
	bh=4uf8a4ZxQLj9q5IooWpv2X9dGG1TgLkNZWvVIQ8xltE=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=DDCRFwKx5BmG4OKaU7EB8mEskBC4cIXRh0D+vnY0LioL1Fbg9ir+vfw91c2NStcLL+3cX92/gTW+e5RCRw6khCr5lYDWEZi4mKnvYCE1lpE1eQDye8dirf6rLEDDPBc1+4wDKTKO4Z1DyPccNKotSPNmPwraLQkV5EfxSOtVgdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fEszf6t7; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fEszf6t7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0BftYT9PLrnmC3xMn4g9IupH0BWFE+0ELq2Frd9XD3p/g08VU7u0AZ2oCkbWEasJ5s2my/5iG0yN78zT4v2ibRB9VEQbxJQ5k8wr1MgRTnLRucetGXYAwNtBHVK6VaEuaDf3V+vdnsTUtuQZnH0gt84cutwsYyFrheHHDadlfMDb/A0fejncZkPSrUMs/EM5S5j9aMS5ZuWJBGCrtUOAcQaw9+/UbvCGNAs6sJ6kDNoLg+2r/3oxd0bymBG6s6sp2kdvmyoMS/ez9aI8ryMQyjjJEpkwgxIU7UQAzqjjmogdnrJxM0R0foxALUiIL2HPwJoPL/jjNTZnzKsYbtyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h2+pwjgAQ7fUWxPxkbxcft7BOYRMTTyJf9myfZAzsE=;
 b=W1ihW/He1yKzppfoJCygGVyuwGCJ2gZNQcKHX5HnT/DztFepld9nfG7rLyJjVcerr+Z3EeXXGiEfj7oC7R33WToSzB/9ncH+MJxtEMrO3np0HlhvI+IkhblV9U8i9G4WN49q+8tcF7z9P3w8GwvKo8me+KYp+0MlaruOgKqI9qku/6ytO5+gDDFZsElAO2xR+EKpr9ePZBqreV7vyOjmLuMYVke1Uqw27dUBgWlqu6x2F/CHxn77eVTSxhKoW+BAJ5cISzfuAqi4zsaai6urLqLK5LFzSpBIE5kj9PJo1y9mQCDeORGu6pAQk9HlT78l522wJ+lUx+fBpVJpaFJT3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h2+pwjgAQ7fUWxPxkbxcft7BOYRMTTyJf9myfZAzsE=;
 b=fEszf6t7ji6UFv9M1J79Y57GlH/4uldkZb4NjzGI4b4UW9+OM9mo2FsJOEZW0a3DFxGI7nk7bePNF5l/6V5d2NEjQU0g+4WT6Uf6OWBDUnwMap9KoDZss+E9sfSjlZe08hujJBP9yshWcdfBIzVn+uicrhaP0ktruZgN6DpzCHn/G/Q9r16nNN7qG06nUKVKfU2d5rrkAoAq2RmB01yiwUXM8jIDkP71VeV57Or01HC1dhjyCUi/i/gJHM/8CiC76xJ4YUMdKZtWZR2pmbrGh3UYMT4nABQSHJGMhQytb/sJLCcYuJEVTiJuBjVaMghoJolr+hi+4L0t+0Blz/YLmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8243.namprd12.prod.outlook.com (2603:10b6:930:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 04:26:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 04:26:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 13:26:48 +0900
Message-Id: <DGINJVYFSYU0.115RA9K7O8KGN@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0047.jpnprd01.prod.outlook.com
 (2603:1096:405:372::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 64287a89-6bc3-4268-97f8-08de6f6f1b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGNVNnJ3aytBR00rM3NBYnV2OUNZZ1h4MENhTW94NFZXVFhwM2pSQ2pIdDNY?=
 =?utf-8?B?WkJxd29xU0xta1BLcDlETGVyZGpyZ1Rjd0FOSTd5bnlVTFZZTWplL1MyeU9a?=
 =?utf-8?B?WjhkKy9tR2NFYVBxWjdKL2hQUE9zRUg1OGVLaWVPZTV4Q056RmF5ZG04SzNB?=
 =?utf-8?B?NEUvVzNCSlVYREFIbnNWRWRjMmpWa09STVFiazR0QmlMQ3NFSStTVEhMY29O?=
 =?utf-8?B?L2x1VDZORHdLNTltazVtUG9LUUxqQUZsdXpXc3NHVkVab3ZBMFh1WWZDWDhO?=
 =?utf-8?B?N0NNTzlWMHJEaEJqNWJsejZqa0lVbHpOTU44WUFzQ28ySk1tb1d2a3N6cVZz?=
 =?utf-8?B?aDMzRE5rajltTllaaWk0WW0rbGxKbVhVRnFIWlFGRHFPbkR4eDdQR1VuUzls?=
 =?utf-8?B?STFqajdGMGVDQnAxQkphd0dKQ2RScDR4ZnhsemV2NzVCcWZoZm5yNFdKUkhq?=
 =?utf-8?B?N1VWTkpCWlhiejBKc3V0VG9Ub0c2MkduSlVBbCtMR091d1pHMFlrZzdGWEdm?=
 =?utf-8?B?Nm9aSmJSb1g1V2lpUHRLdUQ3YlNwTWZ0eUhXOXh1dStOdHVCMCtQMm9GQWJp?=
 =?utf-8?B?dVZNL2l1OEpRaFRKSThSSTFjd3RLellXTHduQ29Za0wvZjRkTWNIMEJ1eW15?=
 =?utf-8?B?TzdDekV1czluWFZ6YWRzaCtCcmV2blAyVFk3Q2JDcjJFd0NHemx4Y0k2NU1Q?=
 =?utf-8?B?U0I3RmNOVEZnZ2lCc2xrRGEycVZJK1h6OUNRbVJBNFN0YTloWW1rTm9MNWNa?=
 =?utf-8?B?N1JzRVVNK2Q5dVF3eVpVODd3YTJkS2pFSVVrVmpYcm03V0xYNlIrSEdFTCt6?=
 =?utf-8?B?SFlWWkppZWlERENSWFRTNmgyVmF0MFUwT0tIaytWYllTc1hna1Q5VEdyNUJI?=
 =?utf-8?B?alRJTTNNQVEyVDdzTW43SnJYaFZQQWViWEp0aGw0Q0xsNzZWRTdndHlOa0Jj?=
 =?utf-8?B?dTlNU1p2enJwS2JyREpDd3BZRFhRVVI1VGpEQWVlU3pKend2UzNReCs3QUU2?=
 =?utf-8?B?QW9wTXV3UmhhU3BJWGhNU0M1KzlrRDIvM1VCVlM3WlNpaVhXcmJoVFB1K094?=
 =?utf-8?B?Z2N3Tms2YzJRNEhUSmRYTkZqdlMrbkcyRjc1UmQxRElTOVhlcFkwK2JvK2lT?=
 =?utf-8?B?T3hBL2NpaGcyelo4eUFIZktRaW9IcFN6OFhybDI3dUplYVV1aHFqSm82dDVr?=
 =?utf-8?B?bU5naWVtM25HQ0FFWjlKY0s1L29RUEF2U1ByQks1TElNQXhKNXB4ZUZJdk1K?=
 =?utf-8?B?Yy9CTThXVHI4SWROMjhiZk15M1RGenVCZHhWV1FXOTdLbUtGQTBRMnBWWlJr?=
 =?utf-8?B?RWxDcnphSmFGZHVlR004Q1VrMXA1MW1DOUFXZmYwdEpWMm44TU5PUjZJaDNZ?=
 =?utf-8?B?UVdIRVlVOVJobm93enFPRXRJZ3FNclJVTUNxSzF4V1hFSlhBZHVQajluaWtx?=
 =?utf-8?B?MG1UWVBwUUhvb01sVXFCSTRYZDRlRUlqUXFmS3hIWGk3QkNma003ZzMycS9l?=
 =?utf-8?B?MTA4WXJtYmI3cFA3aWduTmVOMkdvS3F2U1NhN0FiWTVWUWRqWkpjMURVWVFv?=
 =?utf-8?B?SDM3MXBydWxnSUphRWlUZWhlRWZFKzA5eVFWWWFGRmVUOWZ1UVlEVHZ0d1NP?=
 =?utf-8?B?Sm82d3FRQlM2SnRvdisybmh0KzRUS3FYNnYwQUpybk43OU0zTFk3YmI1eU41?=
 =?utf-8?B?WUFkV1hxTnUvL0p4UjE3Z2VlcVIzUGpPbkN1S3Q3b2k3ZUgyRmRDcUxlRVJH?=
 =?utf-8?B?WGdjbjFuNm80dUZ6L1dUS25zb1RVSGVINWRKYlptQUJCZGNGTnpNQ1FJLzFi?=
 =?utf-8?B?WnhFblpYdmtIdHVTdWg3b04vM09KR2VieGVJNzF4bkFJdGxxb0xsUDNTWUFo?=
 =?utf-8?B?TVFFTGRNaFNkUzJjdE9FbFJuVGlkb21qSjZsRUo0eWhQRWRZTkM1WFhmSmZp?=
 =?utf-8?B?T3N2UzlWaEViakhpT1A0bk9wR0FjbWxscXAyZEFwQ2hwOG4vUFRiaWVuc0Rz?=
 =?utf-8?B?djRVNjlrdmtnMk43M3pydlI3dXhuTkJrSXhFQUxLUU1UQUVvTXlPayt1L2dU?=
 =?utf-8?B?akxUM1RTVTNXd21GTVJmL05rUmJhM01YZmJ2M1R2QnRzMjVTZmpTd1krWGNt?=
 =?utf-8?Q?3yA0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDVKZTlHRnllMjU0SkNTMm5rQW5DTEZuNlc5bWtvNmtTQkdwTHRCQVJvdzNh?=
 =?utf-8?B?a3ZRdnYzd3N4b1NRVXdLd2U4bjJjQ2JlWWlmV0NnWFBPZExCamVmR2hpVHJy?=
 =?utf-8?B?NDhnS2wxRmdDVWVDSVhDck5KYVlsRWVVMkxLRXJpcjdrY3FZQk5BYlBva0da?=
 =?utf-8?B?SlJQblZsMTdDQ3FBZ0FsdUtGUVdaZE9lSk5xakNjQmt2Y1lKbFROZEJhdENX?=
 =?utf-8?B?NFdscU9henRRM1lvYU1vN1hzWW5QTDNUTGZrajdpcDczaFZ5TkJNQ3lqTDBx?=
 =?utf-8?B?RWVKN3FwR0Q1eCsyRU1NMUpkR2ZiNjdZZ2Fsek9rWndrMEhvQjdKK0R5bm1M?=
 =?utf-8?B?NWZBRmRhZWYzTytnaWhtYkg3bXJ6NzlhOHFwOWJPN0JzUWV4cm1FTWdZZWV2?=
 =?utf-8?B?eWJUN0o4enJ6dlFHamdJelJKaER3SkRNVFF4RTNWd2t2UCtYRVB0ZHE2OEd0?=
 =?utf-8?B?THhoelV0SGE1WmRqTnd2UGt3SllTUTM0NjZFSiswZnA1VjVSWm9hK3Z1MEFI?=
 =?utf-8?B?VUZld0t1cXpROUc0R0U2N2hucmpDdytqMytaekYzL3JFenhSRDUvRFA0SlZv?=
 =?utf-8?B?M3NTV2x6ZmR3M2I4K3hIaVVNTUZNVCtaNWFCT0R3NzhWaGxpM0JNcjZjTldm?=
 =?utf-8?B?UFJqczdYTzA1TmdXWFJNZUhsdlUvS09jaFNIbUZndnIzMXBZc1NBMWg5d1JQ?=
 =?utf-8?B?QmdkU2hLL3AvdTNzQk4wa3A3Y0VwQXhkRzh1NWgxMVQ4UlJObFI5ZXgrbkdE?=
 =?utf-8?B?VzN6SXBtNXJKdDFvSFkvTklVMnhMV1NpeURpZy9CVU1mcjJLbVJNMjZ4UlBq?=
 =?utf-8?B?b05yYnZMQ1dRUjhTa2NTdXZNNDNGbWc1TkVZaTY1WDFYMWZvSDFOZGQ0c1V4?=
 =?utf-8?B?YXoxUE53S09wT2U1ODA2Ymp5OVJhVUpwVU9PWjZGUUhFNnJ4bTdRdlF5TXZl?=
 =?utf-8?B?Z1htVW9oNjhkZ2J0TG15bFd4RFMrSWhVM3MyVHcycGRXVHVRUmk1K0VCNThy?=
 =?utf-8?B?bWovN0wxZFRpS1AxLzRFZ1A5V0xuVUxBOXRGMXdDdGh5VnhJTThYV0RhdWF5?=
 =?utf-8?B?Q3ZSYkJZSVhoZGZRUk54dDNVZkdmaEdhaTNtbEhEbUhRblhjcy9GME5tSFdm?=
 =?utf-8?B?OGE2UUlJbWdsT0ZrVHhTQVlFS3NnNFN4R0NUMmhLN3JDTjJVVkxQZk4xaEYr?=
 =?utf-8?B?d0FxdFBJdlRRaGcra3IwZE9CdjM4ZDNLZ2wxTlBYOEtRdERRRkIwTkFNcmN6?=
 =?utf-8?B?T1g4NDJ1UlRnODl1NjVyc21xcEt4MUF6eWlET1ZSd2JCYlExNHpVSkNsWUJY?=
 =?utf-8?B?amVGRk5TRFpTUFNodC9BQWNqL0Q2WVpBbFpZZE5yL3hST1R3ZEs0enBEdDI3?=
 =?utf-8?B?cVhMM2N6VFhRYlRyeGpoc0gvbXpjcThzckRuWnFKKzhCREROR2VVZlh4SHJ5?=
 =?utf-8?B?OU5jUDc1amZhSmhtZ1pBM0Q2S0N5b1BmZWdYendZRW5qQ043a1BFU3JEamJP?=
 =?utf-8?B?TGNsZVNRU3Y1eXJqQUlLNlRBRlVnM1duQ2FJbWwrbzVOK1NQQUlzeGtweDhR?=
 =?utf-8?B?dWUrMkJxWjVsM1NwQVBMMWdLTVZVYTArK0pMaWx0Qk9wYTlTU0d4ckZwTURE?=
 =?utf-8?B?K1VHRVZqVFNjSGIxS0NZSXVNTytyMjJrL0huUmZiQjdlaC8vUHJhWlA3UHJp?=
 =?utf-8?B?a3BYcnhhYXpCaGo4Z016Ykc1QzViRDdQSTAxNGJDbG1qc3dndnNRUnBDVnN2?=
 =?utf-8?B?UjQ0aytna2tRZHBleEw4ZG5HNFo1OVZSdWNyaCtHY1FtMmFrbFltMTRoaGxz?=
 =?utf-8?B?anJ2amNsUngwSkUyOC9vMEd1UUY4MkZIWWtRQ0hSMFBZc3kzODR4UVdwVGht?=
 =?utf-8?B?ak1zeTFJMENockFDU2ZxTGs2VWhUbXZGNFVBbm5ZVmJITzJRblFZbTgxaTZL?=
 =?utf-8?B?S29rdm1mL3lVVXBSVVcwSkhOclpvMUVFaTFlY3dIUCtSVGVxdnVkVkFNbDBJ?=
 =?utf-8?B?Z2hLWGtWc3VUZG5jK1o1NnJiSjkwczNwOHF5blV6WWN4YlMzbHFGT0pHdUFr?=
 =?utf-8?B?MmhkTHZYMjlLVWhkbEc0MEJhWlhmWGtIZ0dmZlhDdURuZHN5aEJieFZySzZp?=
 =?utf-8?B?Q2NrR2oxMW9TcTVGajMrcEpJRzlGV240TmJpeHBvemJ4YkJIZTNxdHc2OHM2?=
 =?utf-8?B?RkJxbHlzSkU2dmN6Z0FKSlpodUdKM2tRVHQrUm83VUNPNW90S1U0UCs0Y1lm?=
 =?utf-8?B?dC9ZVDhJQTlodW4yUEVQYnFXVkl5eUVXQy9WRmlXZVZxdFlKNndRQVEyZGhR?=
 =?utf-8?B?SXViZWZVaWpEWGVGYkFtR01VYWFDNW5CV3NaS1d6bVRvQTdJUE1vODdWVFI2?=
 =?utf-8?Q?MhidUJ029DqshX/BDvbBc+zcenpW7rlLg+8qJqoN8YGz0?=
X-MS-Exchange-AntiSpam-MessageData-1: ssmvrRGPGiSOfQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64287a89-6bc3-4268-97f8-08de6f6f1b6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 04:26:52.8580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckH68MQN/gc+EUQl2VL5irib+osrepDEH+ptE/1EWhALAReNbALhoX0NWOXqF9XgPLvpKsCiUZZEZlDOl9NWqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8243

On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
<snip>
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit //

`rustfmt` fixed this to

    PinInit, //

<snip>
> +impl<'a> FusedIterator for CListHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head intended for FFI use-case=
s where
> +/// C subsystem manages a linked list that Rust code needs to read. Gene=
rally
> +/// required only for special cases.
> +///
> +/// A sentinel head [`ClistHead`] represents the entire linked list and =
can be used

Typo: `CListHead` (rustdoc complained about this).

