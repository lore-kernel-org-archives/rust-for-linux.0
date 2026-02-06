Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325E334389;
	Fri,  6 Feb 2026 18:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770403415; cv=fail; b=XFSpTq5UX4ewLpNEeohyOH6Moh6324F3qitOtZRBQXpAlwFOT1n+ngk+NQWrTxDjPuZ6Nailvh+iOD6OwFMEhmlhOSVGKRPs0pxmX/z1jqXnJLwJmZyoL2k+HQQXMTPbFa6PHEypCDV7LV9vlVLsxs9cvkbxDNoPrzdPBx3PlxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770403415; c=relaxed/simple;
	bh=isnimG0crGx2fh8Thyqd2lpOsjt7T3YgosoTs1nG5fM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GBJkv0ka2Bzl5mUnpFGGbxzzGdNAGKbB6CRpCVcuf+HRK2TSFoMOhleCV9S6220H1CEWI30gAIPXFo5m9tAzJCuqso6cQyZxCeVO0Xy24HI3/JIonLreTcnLr2hHbdK2pP5nme9EpBVyowsr2H2OQ2PPg/ygrKWWYFvp7Cumy0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b3rsnQn8; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b3rsnQn8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbiB07w8Ae+DJEpQ7xYL9mkA1kSuhDWGvj+8H4kJwdrPZPMwJE+nqtzP2Ph6FIVKTdB3RtPEPzERNh8FUFQ/o7mpawP/F/6VksKxTQhUqYezex46odxPfFOyJaP5OP5NuLiwFzH79qiRCh4jxD8HZdApPoOdzlIN7bl4RsWyS4en9KZrWOtu9aWiNhjC/Lckdh9emeYD62pI1OEZoAFrR2df2qu+GOZyco3f+Ek/6DUFaulTGrAvCxvA1jDtmMu7KWq5PFWsjOuLmfMuWWnYaOuLVY/Ap/Nevd5LMxN0U0POFaJH0Q8lbeNGgctjE0lqdlB5g3j/k0FNTkkG7XM8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isnimG0crGx2fh8Thyqd2lpOsjt7T3YgosoTs1nG5fM=;
 b=EvMBPCpqOa5M498g9AXOU9KD4jQxzHstDgl3hpzMV0X4jrnp+Iqg1c4uYet8nhZyUgz76O0gKOMJcTimhus69ZGuZxiwx3ftnrcQqX03vBztWmo4rvyfU0z+pOVBrLCADUoHT9z3TJrIGVtMnYJBqluVi/YzKDMczBjkyiP0vpDUMLjKJzhWtMVGJQ27TAErpxlAdaq9ZXvXHIZKBysCdBeAGp9ZI9viWI+haKVuofW072CUdy+UrCG4+zWU+ZZvOfEIXTxJH5YVwba3mnaZhs++baFaHd8JjqGbNOr4xwLDWl+y21ObCBBbEvLtXBWblzQg23OLQnjaBIkMmhEIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isnimG0crGx2fh8Thyqd2lpOsjt7T3YgosoTs1nG5fM=;
 b=b3rsnQn8hp/Tx4ZmUk/HABWVuxohlie0XbYkoyVGpMvCvvKtn8an3Zo7R9FfqXGBYSwZ9i+1PKew17xzQMt3RScV/hF0M2XSMDw61qU5fXKU+TnNcjaNmA+nVjHQ0ff0Q/YjWVNUkiLr9QxS/qryejsqjmrCjBiasReF6PGjL4XhimxrC5I3sQhdbANKwe1KL5hFCz90gYvD8VE7lqGGeJABVD3gH/rs54rzmsnS/8fWS+7kNVPwwjz8L6ZHelojetLHgbMXH0Sfq78fkDCRPkSLB4d3a/mzjLlswxgS5B2Pxp2hITixhnewRUIYnwV+XuZSxmrFS7upqDy3GOCtKg==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 18:43:29 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:43:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
	<dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "aliceryhl@google.com" <aliceryhl@google.com>, "lossin@kernel.org"
	<lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "alex.gaynor@gmail.com"
	<alex.gaynor@gmail.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
	"tmgross@umich.edu" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
	<nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
	<bjorn3_gh@protonmail.com>, Eliot Courtney <ecourtney@nvidia.com>,
	"airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
Thread-Topic: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot
 steps
Thread-Index: AQHclyA5967UlVZCU0e15w5KEOxAJrV2ArYA
Date: Fri, 6 Feb 2026 18:43:29 +0000
Message-ID: <46121c46bb52e7f8578367232b772f234f20be86.camel@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
	 <20260206042123.303281-31-jhubbard@nvidia.com>
In-Reply-To: <20260206042123.303281-31-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|MW4PR12MB6897:EE_
x-ms-office365-filtering-correlation-id: b9b3acdf-ac89-4bd2-5016-08de65af9ecb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MGtSeFZqN3VqVm9VRlNReC9YeFliQTBNQ2JkdmxKRFFCdjZzZDNrcFhlb1F4?=
 =?utf-8?B?MEJjNkROdS8rSVJ4U1hmOHIya0NDVGI2U1hhYUorRWhkUUlvU0NpRlhTdkgz?=
 =?utf-8?B?RStDd2VRNU9PVXVxaURpcVpXSTdyZFN1bHJWd0lwcDQ4QThHVjNxS2FZUGNM?=
 =?utf-8?B?a2pFU3Bncm94RkFSWGJpTU0wM09LZGZkdVhpcTdtUlBNVWtjOTY4c3lER1Rn?=
 =?utf-8?B?M3JwQVI2bS9VWWgvWFRSTDJOY1RGTmRRS05uRWRFUnROcFBxVFJPUWlDTEto?=
 =?utf-8?B?Vm9mcTBCc2dSbWpadWlrTHUxWjM5RHpjTklOT1dYbHBRZ0UvS2VOSDhoOGJw?=
 =?utf-8?B?VkszSzFuVkNNVERlSVlTVWZyRUx0M2llczM3VWFsQTVOTmJZVENoU2xqSUJy?=
 =?utf-8?B?cEkrVXJqczVCSHJXbDR5WUp1M1l6aytlVHpRNDlmTEdnanZPd1NJclM0S2Nu?=
 =?utf-8?B?c0l4QTBvRHZmNEpSbTh1SlpZQmlyL3Q0L2JWWFZKMEJCVmtnZ0hsTUJLYTNH?=
 =?utf-8?B?K3RJV3dUV1hDNW9PSi80ZXIrWGVRTHB5NkRneE5FNTh5Z2FqbDd0anpSL09K?=
 =?utf-8?B?djQzSjJnZHFFd24vOGx4YWhDZnQ5Z3BsMjVJNHJnN1R2Z01jSVAyVmcvNlhK?=
 =?utf-8?B?RmVJMkNmVnNIYWsrWkNHVm5xQzMrMTJBRXFMUktQSjY0VGRyak5Ddm9ETjhX?=
 =?utf-8?B?RmNaK2c3ZzV3WmVneGx4WVdjWW1LRllrMHVKWnJPVmhtR1BxMFZaaFFFWlNo?=
 =?utf-8?B?TWFxR0xYMlZGUU4wTDZrb3hTRU9tR2pQZWovdHBaSFIvMjdOUmRaWUZ1Ynhn?=
 =?utf-8?B?VUdreU0xMzJ4SXdxWlFndi9tTFFPVUZ4NUFWZ2dvYnVVOWdqSTJEN1RYNFZo?=
 =?utf-8?B?Y3ZTUDB0bHZxTGwwSkttbnptZ1RPdng3QzJLK1hWN2pDNktnVFhKa2QxeFdq?=
 =?utf-8?B?bmpyTVZHM3d3cXBob1VkMG5NZUMxeXV2RWhZL2RLU3VUMkpYQTFqUitrYU9u?=
 =?utf-8?B?WWhPZ3p1dWxscmFXaDM0WkQ1b1ZwUzRUZkFkUjdiSW5LUlpadHpYR1YvZEdK?=
 =?utf-8?B?VERTbzZIR2dkQjNYTkVBVUc5SXVRYzNTQisybWFWdXI1bFlJc2VpeEZOYjlz?=
 =?utf-8?B?ZG5CVGJZcTVvNVFqQkdiTjREMGlFZEExb1pFL3pwLzRyUmo3WmVlUDJodjA1?=
 =?utf-8?B?QTFxTUJaLzRoc3lZTEtDRHNuNEFOV3h5OWdNa1huOEhpN0JXOFFTdEtia29P?=
 =?utf-8?B?VnBnSHJtMDJjVFUxMS9ORDBGaTdvcE1GZm4vUGlQWVlicU04dm5NMXZ3cUph?=
 =?utf-8?B?TTByVGdUMkNxeXBxVnFtdjZjTFh0bE9JSDY3K2x1bVRRVm1XRWpPaUY4Q2xV?=
 =?utf-8?B?cWU0VHJ6TWp1MC9mMkdIcTZ4ZG52aGlPOGNuZ25xV29BNWdCTHpFaEp5VDV6?=
 =?utf-8?B?YWNzM0l4dVpTRWdqeFVFbVBjelFGNklSQmVtSnFmK2ViMmU2VUhOT2NsZzRY?=
 =?utf-8?B?OHdSU3BxQnNnOFhpK2lqbjFYa0J0VnA4dlpiM2VuWTBCQnlOWGdtNGlLc2FY?=
 =?utf-8?B?R1ZKeUp2ZGZWWUkwV211TnNLN3YxQzZwRTF2Mjg3TEw2bXJZSUd5Q1RjRXdB?=
 =?utf-8?B?OC9vbytWTHVmNWJaVWt5NFBSRUlYc0REZjRMc2JZREZrdTR2Qm93MGdtVmp5?=
 =?utf-8?B?RWc2aTlzYTRMN3RtSVZTS2RVejZva01CR1VJamxSZk1FenFjZTdXOTY3bm9s?=
 =?utf-8?B?anBhTVVWMUVhbjB4eERYUnlaeE1oWVlLY1JQLzF6cXo4R05pUUUyVWg2UUVR?=
 =?utf-8?B?cms4WncrUXpFWWZZcXF5djNiL0dFS1dya29sQmlhcDVxRzhrZFlpWXA2Ymtv?=
 =?utf-8?B?VUIwRS9wMndxNzQ0emswVjJGNGhxcmk1Y2ltN1NWTEZTZEZ0VzlMWDNUVUFX?=
 =?utf-8?B?eldhTU40ZDlzTm1rRHIyYnlBM3J3STVjaVhtdDJZWGtFVXdndkF0V1ovZ25M?=
 =?utf-8?B?TXlKNkxYY25pY2ZHQVFWemRVNUtYN0UwRWl2b3lmb09xS3dka21Lc1IrL0hP?=
 =?utf-8?B?MVdTOWExWUVWbW84aitFRnh5cm85UzlBOVYxeW1TYlF0QVpYRi9zejZnNWVZ?=
 =?utf-8?B?K1FPMGhJU25NcDZ0S1ZEUGFtRXhVc3pjUFJ5UmRvUzZaUjllLzRoN2pRdWlH?=
 =?utf-8?Q?cfD1QRJyXf59m2YgkkQrZiQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9815.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1hzSFlOVVJLWG1yekYwSktCWXNDTkNLZnRGRVE3Um96MnM2cSswWFpWb0RO?=
 =?utf-8?B?VVZHSEJSS3BUSXZzUTB3QkNMV1Y2blZHSjh6eFJqdHNFZm9Rc3lCb0c2MlVB?=
 =?utf-8?B?eFBTVlFOYi9JcWtwck90NGFOZVY1TDAyNnVqZWtNcU56bXZSUGxxQWpBaVQx?=
 =?utf-8?B?R3NnU0twdCt5YldKU3ljbUY3M3A5RWhFaUN0NHpwa3Flc3NTek1yR004VVow?=
 =?utf-8?B?OTJCdzgxMEFFQlJHREZVQ1dWQjB6cDFkYUx4OGdCb3d3U0RPRUI4VUdNOUp2?=
 =?utf-8?B?UnVsUEpuMWVmMnFHYlhEeUE5WUZpaEhod2ZtU1BxNkorZEpJSWNrNENXSkta?=
 =?utf-8?B?VzZBdUlBQ0VCSEdXUktPWXZxV0pRaFRQbnE5ZUlsUWlGZFpBSk1NclNNNGJK?=
 =?utf-8?B?dWMwL2Q5UUIyR1VMamtSelY3bUI2b0VPUWFrQVpKVXhaZU1LOFVHbEJYcWlS?=
 =?utf-8?B?ZWVrcU4zZS8yc2JpMTRjWldBY0lpMlNkOGp1Nlp3d2N4M2oyZUduVE9MdVFn?=
 =?utf-8?B?QStLUG9PZDlsZ0cwR1JYRWV0ZlVzRUd4Q0lsK0xwUWJObSs0dXJCSTNoUmRR?=
 =?utf-8?B?eGZycVRHaFRjVGg0VmxkSXpKMFVDQXI4cFYzVWpiNnkrN003M0orQkg2ako0?=
 =?utf-8?B?ZFMwS0xBaDVIS1FVK0gvdStCNEoxUExFWUozZkhhOEFFKzI0NVVjUWZXVnJY?=
 =?utf-8?B?WDQzNHZqcnlDNXBlVEg1emQ3d0J0TWJOYVhLOWdzQWtjR1psVnVCMnI0ampN?=
 =?utf-8?B?eFBkd21ucWVlemJoQzdSQlZPZDl1NDY4b3FkUW1sdzRBcnNtbUo4akpZMitI?=
 =?utf-8?B?QTVMWDNTRzU2L1R4Nm9uRDJQbkJnN3NZWC8wdklkVWlRMFFOeG9wNHlsNUhh?=
 =?utf-8?B?eDVQZXdydzVQcENoSy91R1AzbGFrQUVseTVZZUZpQnkzcFVpRVErWlF4U25s?=
 =?utf-8?B?ZXZXU1FaUE1KUnVweUt1NHVHVjhuRVlvczgvVEtUckVFZkdaWE9TLzFWNlJJ?=
 =?utf-8?B?VnlTU25ESXZNWGxwTUJIY0FIdFpRTmtHd3dSUUt1ZHQ3bG9BLzdkV3VWeitS?=
 =?utf-8?B?dlpKcXNiUU0zaFNMTUo0cVRDTE5MVTVTNGJsdU9LeHJ6Rm1ScjJXOHA1bnZ5?=
 =?utf-8?B?RE5EN0ViVnlMTnZ4aWtWQU5sSGF2RUY4VzlPNExTZVJtcWZTa3pYRE56MlpD?=
 =?utf-8?B?Vm0xaWJVTHJSM0YzbmhFdmYwS1NOQTFHcWxSL0RsczVZWU1lY05OR3dCOEFa?=
 =?utf-8?B?NVp3NDJ5YUJZQTRsYVRRR29vTW5NbEdtQnppR0NtSnp5OGxtOVZGUHZtVlNi?=
 =?utf-8?B?OGRlQWtWYmZZQ2dKcGxDSmZsVzFjeFlPbnpuZEd1MUtPZElRcmFTRmYxTysy?=
 =?utf-8?B?SzUyaXdhNzNNTzkvTXROMUFDd1A3YXhSWmxyNktpSFhqL01acFlwbGw4bHh0?=
 =?utf-8?B?MzVHREtCNDE1ZFF5TG8wQllza3AzcEc5THRDZ0t3Wlk4aitWVXhMWUNNd1Zp?=
 =?utf-8?B?Z0dicUZaZ0pKMWZNMGtPcFBFb0trWG55UzNCMkM3R3RLc0xuNGtqRkUvRVlu?=
 =?utf-8?B?TUNjU1NKZmpqK3BEa0loVDRLaC90eWxWTzZSeHAzRlhwQTdPbTZaaHVXYVBM?=
 =?utf-8?B?N29MZXRRcUhwcUNuVkpyL0U5dkFKQnpKVmRxbEZ5M013MW1oaGVtdDBXdGx0?=
 =?utf-8?B?V3N4Z1p6ZUhQdjFkYWJuN1RkUkd2SSswb1VGZHJLdlhIYWhsMC83elF6Nk9S?=
 =?utf-8?B?SU14T01Belc2SXBqdEFpYW1ld00vTjZmaVpEVzZCZ0IwWHZuZVJ1anJPTVgw?=
 =?utf-8?B?cmd1dEJoUWVPMlFaQTBjZ3VPVGhnQXc5Tjdjb1FUSVBIUUkzaE9mSGhQY0xE?=
 =?utf-8?B?RXQzZjliNmdMQmhsRWdldG96ZVJHeVZWRnB3SGNxODJ2YjdVWVZaWWl4c0xk?=
 =?utf-8?B?WExqdnNPQTdsRDNIaHpQNm5KeFhocDgzcDBNVUJaVjZkNUV3OHRUQ3d5ZEtn?=
 =?utf-8?B?eXM0aVEyTzVVZ01Ra3QzcDQ1cWQwWk45dDluTU1hMC9GU1VaYlYyUW9OQ2pO?=
 =?utf-8?B?VFFkbkZSMVJ4YXc0RVdOYTltUENIM0ZsT0s3MHZWSU8vTHN2OUFDbHJ3WmU1?=
 =?utf-8?B?WWFSUHNYZHY2b3JVaW1HYjRmM1J1aVErb3h0anBQRXBxa1BybDRJdkRLSFE1?=
 =?utf-8?B?QXVyQnlHMTdEMU1wNUdvZDdFamxiK2hBdUw2NGJuL2FtWFMyM3FGUGFrR2xD?=
 =?utf-8?B?TTZmWWFCdU8zOGlwY0cwcDhFZDFNUFZZMHZ1Y1hsYkppMSt6MURPZTBrajRI?=
 =?utf-8?B?MkczMVpuWmdoNEV2L3FTUEhQMWIwcUt0UnhEM3VJcWdlV1ZyUjBvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25CCA415F6AA6743BA32AA5325D65FD5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b3acdf-ac89-4bd2-5016-08de65af9ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 18:43:29.0877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5wknrT8Qb1ptnb+rJgQgM6blPudvrzpzGnrQLmFXNuJv3BBFB9KF6B6aWhjU0MhLzMT+DGAyeBcMW6PnqTgH2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897

T24gVGh1LCAyMDI2LTAyLTA1IGF0IDIwOjIxIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoMKgwqDCoMKgIC8vIFJlc2V0IGFuZCBib290IEdTUCBiZWZvcmUgU0VDMgo+ICvCoMKg
wqDCoMKgwqDCoCBnc3BfZmFsY29uLnJlc2V0KGJhcik/Owo+ICvCoMKgwqDCoMKgwqDCoCBsZXQg
bGlib3NfaGFuZGxlID0gbGlib3MuZG1hX2hhbmRsZSgpOwo+ICvCoMKgwqDCoMKgwqDCoCBsZXQg
KG1ib3gwLCBtYm94MSkgPSBnc3BfZmFsY29uLmJvb3QoCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYmFyLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNvbWUobGlib3NfaGFuZGxlIGFzIHUz
MiksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU29tZSgobGlib3NfaGFuZGxlID4+IDMyKSBh
cyB1MzIpLAo+ICvCoMKgwqDCoMKgwqDCoCApPzsKPiArwqDCoMKgwqDCoMKgwqAgZGV2X2RiZyEo
ZGV2LCAiR1NQIE1CT1gwOiB7OiN4fSwgTUJPWDE6IHs6I3h9XG4iLCBtYm94MCwgbWJveDEpOwo+
ICvCoMKgwqDCoMKgwqDCoCBkZXZfZGJnISgKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXYs
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIlVzaW5nIFNFQzIgdG8gbG9hZCBhbmQgcnVuIHRo
ZSBib290ZXJfbG9hZCBmaXJtd2FyZS4uLlxuIgo+ICvCoMKgwqDCoMKgwqDCoCApOwo+ICsKCkxv
b2tzIGxpa2UgeW91IGFjY2lkZW50YWxseSBkZWxldGVkIHRoZSAiaWYgbWJveDAgIT0gMCIgdGVz
dC4KCg==
