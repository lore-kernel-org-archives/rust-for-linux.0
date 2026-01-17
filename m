Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41227A103;
	Sat, 17 Jan 2026 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768619821; cv=fail; b=pDb1qhcMn1xwABzDTa25eiGpvdZTUgTagHmK7zP810M+0gK8EGVKAx1qMGEMXM8w1zDvd9CmtaVhSmq0MM6XseL4eaqS71gz7yg1leg5byhEK97SSYLa9Y6++EcPUf2IEhleHpr60xbEzACgTKyEFmPeqFkvvFo6xngYPUr1yB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768619821; c=relaxed/simple;
	bh=vu58lx4wHa+l9fslRpFhEP2Gt61YbnEQ9BLA/YNihec=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YC+l5tygL945QTXzNaxo10YrtIzXVWOXBw8aUdBeW/v4uyY4vIA8nPARH8VpgPctan/2YynOqUWxOqoisv7uchAajkZixtS1hi/lyj3NsUmh9pHSKUajtnR7lLTB6W2rEkKfxfqeBlkKXlkPoZqTvXAqS76LyID16vanuHoKyNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lIIW4RWS; arc=fail smtp.client-ip=52.101.43.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lIIW4RWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j89UpCjT1Qd7u1XzOaHIr6O2odzQ5XVPDjus8GgaSPeBGFf3RBwyZDW1rmGQh07VCyRbDrswmC0Z0yBv8DG+oO6HU/Z9548V7Gp18pdB/RB0lI+sFFpZNvjOKgLs+7NwGBsaIdKwzCKS2unCsrSaT/wcgp/ayhnfmqpxwYxA1+yQBMUf2ppMO91et7DyQti7/RKCajcPRy4ooJN6BOsgb7V6dT0MoKzmQKxnNuSKUFygjklZx4k5tAjxWzb0xPqC5wcaAVUpWIbJTzY9zWrLGkWXzFBYpMYq95Kf4J731rmRCiVyfxPyfOCpSnxnRJfJnTZpx5cxz40HLuuR6XzA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vu58lx4wHa+l9fslRpFhEP2Gt61YbnEQ9BLA/YNihec=;
 b=UHrf+3iBeo7TNzRPRQkdzjbWl0p+XwCP35eFvC/V+wm/K/Jxb0c/1Fnx2FDQqdvz0V98uto3bbu9B6pcouxcpb0HOD3iCwyyE/6us9+dUS8X8qFeVqZ09lKtz3j4xKG3G5CIM9c2Q/XmmdAYTsd3fX7XeGIsreq8WmgK/1QlenImz9G9olh1dQ8ttx/HV9L8/9p2X5BosMIzWNs/Veq29rVxDck3xTmwBHs3Ese1Br6hiAXmsXRn6hgHwEvwXcUqWjgNj7XoK78y05hx7ZdOa/6yURdoPAm2Di+1jUi6iwMizngn5InP74HKWv0d5sZtciFP6jkDCfVU94XUe5kmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vu58lx4wHa+l9fslRpFhEP2Gt61YbnEQ9BLA/YNihec=;
 b=lIIW4RWS6Cr0GtFRxehmxgsFiL4Vg6iDcknt+T9a0bAC/gmueloc1zbQMjoZudvN+OC5cQ/EPG7y1T0n0c3RORXrg637oq5ZwGD43qrm+FpXVDxAgPCN6zOYxMvuVUpyV/Liq1Bud0u8ys2SB0GYUqsNonuQ+lccrKTC56DFVdolSt8Kr9fBvqaDeQI1xMR6kq9WDkk+G7TcTE9vU2kRnH0atO+nxYjHcBor6G7TX328/BemoAGo6Uy/Hma1N/bBSKqUOpmpV6+4uZ2cTsxaBU77Npom79xyuxd5OQi0J1O4Rseg0C1r4eBpE4H1z99kaQ5LEtHVrzRcxsunXjaDjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Sat, 17 Jan
 2026 03:16:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.006; Sat, 17 Jan 2026
 03:16:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:16:46 +0900
Message-Id: <DFQJEAPGK791.17H92ET2Z9B8Z@nvidia.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: ptr: replace unneeded use of `build_assert`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>
References: <20251216-ptr_assert-v1-1-d8b2d5c5741d@nvidia.com>
 <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com>
In-Reply-To: <CAH5fLgjP6O0KTsm+dioy0VUm791zrktLTkAtQsG2uN3JSQFUVw@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d0f0f9-2758-473a-ac76-08de5576dbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eU1CWllxUmRBR3M4YUtiNEJEVis5MGxMTDlSRzJZYU10R1I4NWVRQit6cHJi?=
 =?utf-8?B?aVVTYlhEdDBsNjJ0Q3FLdVM3dGxrRm5PdGtMb2wzNUNWMmpLZHpHeHJ5R1BR?=
 =?utf-8?B?WU4ybmJyUk5xeUdDU2xGWGtQTzRZSHBYeFhxM3NVWmtCQ2pXMERWQ0NrQkl4?=
 =?utf-8?B?T0U2S3lxQ0dGUSs0OHkvRUtraHNPeE4wek9nVVB5S2tvUWFXQ2pZOEdrWldP?=
 =?utf-8?B?NVMvVGZmdzhVdEJ3Tk5iaWZHTk1TeVNSWnRid2MxU3JZNXVxVmRkLzVBalli?=
 =?utf-8?B?T2R4Vm9vSzFlMzlaK1lFYS9CZnB5bVc2Y2RrRHorWEljZkJFWS8ybE50Smly?=
 =?utf-8?B?VVJJVENKZ291VmhWRDhuWFZrVnB1VVFONGxGeHZaeHF2b0M4ZzVUcURWWkFs?=
 =?utf-8?B?UTcweWhwQkdzakFlNGxLUHhCb1ROd0R3akFjbjZyZC85dGNLNmxuVTdNVlhr?=
 =?utf-8?B?ZWY1WmRUZnJjckdCN2E3ZzRibVFKNCswSUZzQjl0YVQwdWc2VFVhWmVGRXBx?=
 =?utf-8?B?Zm1Oa3E2aWMzOEN3U05RVjJCTnIzbnhBZThyWWpKcE8xUExaL2VPMGJZa0hS?=
 =?utf-8?B?bzhYbHdhUHA4bmthUjhXRkxpTThadXFWTHlqZWdZQmpXTkNsS2lqRUVOSE81?=
 =?utf-8?B?TXJ5elBsWWlBeXQ4eTNLdXhQaXlBeXlGNHk2NXozMnU5VlJlYklkU0dVZ0JV?=
 =?utf-8?B?TkQyWWx3bnNTRDl1R2J4TGl6UVNxUno5T2VRMnBDZ25mTzRvdHRhdzZsUlNw?=
 =?utf-8?B?SUNkOUNjblRaUE9JZ2hSOUk0dzRZL2FlTk9tS2Y3SmJHMjZZVHFJU3lvODhn?=
 =?utf-8?B?M0haRXhDenBJNzIxU05sQk9Ud0V6Umd6TXpqc3FGcHV3TlhIajh1SUpWdGJJ?=
 =?utf-8?B?UTdXem82Q292SmFhTU1yU0hxYjFNU3ZiaTJHNmt2VXRaQlZxSlIyQk93em5L?=
 =?utf-8?B?NmRtd3FVaVNWTTIyb0Y4N2loWUVmT2pyTFdTQ2grb3hMVjVmRmhXN0VHbm8y?=
 =?utf-8?B?NVVzdTMzbGtOUEZMTFhtZ2VPRWo2aEZ6KzlKaUwrbjBNNkd6Nk9vTit6a3BG?=
 =?utf-8?B?eGRJYU1jL3Y2VmFUY3Y4REZNQXl3dHUxbGdYQ01tMStqc3hkeitrSEdNT2Zl?=
 =?utf-8?B?Q05oM09KeVMwTlZDT2dBSXFzQ0NtTlhGY2hTRi9MeEJGbEJlZTVwaDZRWWk0?=
 =?utf-8?B?SFJ4R2tjYWExUHFsZ1Rvdi9rT09OWHhVVWdZYjJiNFkvenc2UTB2UGdmaXhh?=
 =?utf-8?B?Y1NJVVRiRUlXUTRxRU9qdmtoc2RNVmlRd3hFRVNpSGpaaEd3cWVoTWpOajRh?=
 =?utf-8?B?dHRVUXhTOFhVWHhkVEpLZ3NaVmtFWEtYVHkyWHlMczlxVHlXbVpnbE5LSlN5?=
 =?utf-8?B?NGZ5VEpDaFJOME9xVzg5MEtmU0w5QTBBakZPWjhUWkI2UXN3REhSakIzaDRC?=
 =?utf-8?B?YW9mZVFTQ2h3MUQwcjUwTU1aaXNhRUlFWjFPRHVienJncEtXalhPSlBXeDdh?=
 =?utf-8?B?YjU2ZjRhUDhmRzBuUmxvSk5qdkZvdlNxSkJlVGRqNE42RGdYMUYxOG1JalRH?=
 =?utf-8?B?L1NSMjV5QUZqKzFCYjIxWXRUTFJGN1dPTkNrK3VQMFNNMzhmNkJ3NksxMEFL?=
 =?utf-8?B?MEJad0FWODBZQ3J0OXR0eGJPRTVFYjgzQktVemVuYTRGdWd3cERVVzJxYkZN?=
 =?utf-8?B?aDN1VjVCRE5hVFdsSnhQbnhBRitFSk9EMTR6MjlvNE45R2xad1M3UjJIYlpj?=
 =?utf-8?B?QUpEODZibktFVGIxblFYQnBEUlU2aEllcmtnNlg5dHhaQ29ZVXV1TWZ2dVF2?=
 =?utf-8?B?RG5CN2JVVjFGa0NrT2FBWDlNdkJscE1TYTlkRVZhSU9ROG14OWR1QVBjdjlI?=
 =?utf-8?B?VUhBeVlNNFlaM3M0MExGSmU0eDN4UXNNZVR1ZDZ2aGM3QU44KzhBNzR5ZXpR?=
 =?utf-8?B?ZTVBWjVHM0ZEWVl5MmVGVkR2SVhSOG91ai9VeHlNb1RyNEZCakdzL3QyMWVU?=
 =?utf-8?B?eGZNdWhidWNZZnBROXhBM3FhWTVtY05sZWxQeExMb2VOV3JMdElCc3ZabnZE?=
 =?utf-8?B?c05qbjl6eEwwaVp2YU1jN0FPQ2FGWURtcFFDbEwwbE9WQjBuSmhneWNvRkJt?=
 =?utf-8?Q?jPVA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXpMNE84THVPNXIveWRGZzFUU1Y4S013ajBNSCt5N2JRRnpZMFNZdU1FdGdJ?=
 =?utf-8?B?MmFZZWNoTUZHR0lpVllQdWQwczBkRDRSN3JPQ2FqRmZsZTBFTHlKS0xiQW9o?=
 =?utf-8?B?QXNPWjd3T3hjbW0rdE1zOGhxQzVPeWJqOWV3VlViZUhvZ2FRVFdIZUQ0L01U?=
 =?utf-8?B?L00rUVZlb01neDMvR3NCcCs4aHFWaWtPMDBmZGh5bFlOQm9aZyt6MWRnZkVp?=
 =?utf-8?B?MjVmQlhQMzBKSDVtWFhjLzVMS1dESkJQZmRoYy9ZKzMvbHcwYmR3UmRERERQ?=
 =?utf-8?B?T2poYXo3OVZ5aUxub3N5NG5taFd5SEp5QzlZMjJJeEpOQzNqTXRlQzBxQzZO?=
 =?utf-8?B?dFJuWlNFTFhiS3lLS21vUjVSeGgvWE1ZZzM4V2xKNUkwd0JkQ1lueUFOdk1q?=
 =?utf-8?B?azJDalVsKzJKTVd0VGMwYWJVZWdwZ29qbXRLQ0U2WFc0cUZCVVVmSlgveGR6?=
 =?utf-8?B?UEgzV3k5U2I4cnRxU3NPNDhrUmIwTkg2akJ6WEYyeGVadkt6MjNFVzlwTDhq?=
 =?utf-8?B?UVpEODUwbGFXcVY3Ky83T1lBVkhYSTdDS2JVK2NKenhZZ2FrNE9wcGFXZnVD?=
 =?utf-8?B?KzVQOGMrRmtBNFA5RERQSVRvWHlZM1J4OEp3SGhsLzY0NXpjZ3dZL1htL0Nl?=
 =?utf-8?B?WVRwV2prY3d4T0JWN1JDdzVhNldMZVRFOElhN21heWNxQ1lpRjJmTXhjbGVj?=
 =?utf-8?B?WkhtNStwWlM3Tm9qTXZZR29FSi80VFQ0U242eEl2d2RPSVZTS2hwOXNoaktJ?=
 =?utf-8?B?UHVCYjAyOHAyL3hkQjdqSDNwUXBIK0cwSlpoTGRNaW9XNE9CV3BCamZwcFcy?=
 =?utf-8?B?TjFXTTA1WEhlNC9MSkxGdVo4bU5DUURMQ3RPTW1QRmNNS1dUZFdMVFcvbzRM?=
 =?utf-8?B?cnZnNFhTUWMreGp1Y2RlMkMvU2t2TTRVM0RBL1M3NkFucmNpbm1qZllLK1Fw?=
 =?utf-8?B?Vkx3Z1locEdaaGpBeWtzYUtXeHJheHR1UHZXZE94dm1GZVA5YWpGaDNqSW1z?=
 =?utf-8?B?Q2JkZEozckdwRmVjbnlaZ2JPNXNVamdDSXRlWU5weFlSM1h5R3F6ZFkvc09I?=
 =?utf-8?B?NmE4RDZJL29BWWRNbndhLytGcHFJZGRMdmxlTm5nbFFrNzlDOGNkQ05ucEMr?=
 =?utf-8?B?OUYyUmk3K3dpaU5ndi91eXZocGhZNkc4L2JJdDFKRXMraGpSVHNLZXZpeVJi?=
 =?utf-8?B?QWRkRkVCZGQxTHlRcWwvb1NPZ2RmUTBpSkNxK2FtcWN0ZWNjcEFvclRQREla?=
 =?utf-8?B?VjUyQXk0NlJkR0QrcHhJY2RxUnZxdmVyN2Z5LzgzcnpGN0ROVHpUN3pSSlhz?=
 =?utf-8?B?SHVaeHprZm9sS1FVRGEvekFmR2dDSCtFSE51TTFWSjBSNzZydWJBSThGOHNV?=
 =?utf-8?B?ZFR5YmZrTGhvaTRyQU12a3NvMitJMWU0blV1NG54eFpKNnJ6NEt6ZWVlM1pO?=
 =?utf-8?B?THAvbWlVWGgvcDRNODV2R3VjTzR6SVZ0K2RuMWMxM0pVUHk3UkdoSkVyT1hI?=
 =?utf-8?B?ZWtOb0xGa0hHa2hySGR0aUxCdW5Xa1RSdWxwMXp3MVlFU0ViZTF4c2h4M0w1?=
 =?utf-8?B?K2lld21sUDl4Y3p5R1F6dXk2SC9URmc4WktqS0E1bU1FL3ZzUk5qbmpQaFRF?=
 =?utf-8?B?bHIxVklLdytkVktpTEo4b29uOVZZZzJCdG1pbzUxRWo1aG5nRTZuQ2pUby95?=
 =?utf-8?B?NmVURy96ZzZqMXZBM3JUV1hxWG9XZWU0QzE1SURoWEQ0M0JEZE9SQTlSNU9o?=
 =?utf-8?B?N0NwVklBM2ltU250VVRhRDJ1b0xETzBVTGxURGE0aXN4RlBtTEhNZ2tDbG1n?=
 =?utf-8?B?NzZUM2wyaTFvMmlJOXBjakJZdk1RZTllMllIcjdFOHFEa0pHOGd2WUozaCs3?=
 =?utf-8?B?YkhyakNpWU5VK3FOOHVxd2NmNmFGNU44MUZreFo3dDZTdjdlbUw5RGxMSGli?=
 =?utf-8?B?YU52OVRrVm5mUTEwNDFXQTBOQUlmaHliUlpHSTE0OXJTdEZzWEljMHFkV29R?=
 =?utf-8?B?YU0zaDRhRDNZSTRVV1hwMG4rRktkZks3RUhzczlEYjhSdmpLNDdsU0lMS0hC?=
 =?utf-8?B?bC9XRmZ2NVNUTkVSN0t3NWtLK1VLVzNLazd2Skd5L2YxY0I0WUJHQ2xkY2NP?=
 =?utf-8?B?ZUlmNGlTdDVpNFFiT1lVZU1BcTF2dzYzWlN0WUNYVEUwcGhXeVBpMjlzVDB1?=
 =?utf-8?B?NTQra0VlRjF0ZXBYbkYxYy8zREQ4b2JlRmYzcFNEcGNuQ1FRWHQzbEZlbFZK?=
 =?utf-8?B?YVdadHRrQVd4Qjk3WjEzQlQwa3J1SFZJSzAxMzlZc3JsTlZZOW1oOFRQRXRq?=
 =?utf-8?B?S244R2ZHd25jZ3c0RkpaSTc3bHlOaWpqY2Riak1ZUkZ1NkVRTDRjSkMraEs0?=
 =?utf-8?Q?YrXd3EfDo8b+ymJghhztQEcev64wH72nTpDQ6opuwtRdF?=
X-MS-Exchange-AntiSpam-MessageData-1: Tuh11dRzANa5eQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d0f0f9-2758-473a-ac76-08de5576dbef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2026 03:16:53.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k323iY6gG5KNxuMA3TTb46P63iqIDbJ1PGX68F5hmtGOMxzvqUQ5OmQWJUUNPsYFNZDZe3MktPpIvoNl40mPZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

On Wed Dec 17, 2025 at 10:22 PM JST, Alice Ryhl wrote:
> On Tue, Dec 16, 2025 at 9:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> Since `ALIGN` is a const parameter, this assertion can be done in const
>> context using the `assert!` macro.
>>
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Miguel, are you comfortable taking this through the Rust tree for this
cycle?
