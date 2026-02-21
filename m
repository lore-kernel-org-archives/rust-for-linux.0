Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B32BD01B;
	Sat, 21 Feb 2026 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771635728; cv=fail; b=gx89HX0bCiGRoGbDjbkkNxmTVVKrTTkBffk9izrU3hpcOSnoep6Q1p9AwRazPJ0DLCgh9qD+RCM1tCw4HbMesLrexybtbjYz4TkNf3kXn/jEFtABlKNGKvthAvKuPMaPvij12z3q3Dh7SNh8ApH8kB4ZstGWLbs0/FMLB0b26xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771635728; c=relaxed/simple;
	bh=A0iNfQLzDQIaCp+gubd3eIdLyCxhHIBpLDfMVAx9ePU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A9nmbxP3VH/HOTxxLU8wAsDrKE0L8w/o+lyxsM6rG9DEJsDBNKTafmrGjS4ApPXaPwSlmfUp/dH9t/VooqxeQkfigNdapTV1/ly9nZbf/Q8Fy1Cl6Afj48usdeyk1uLCixaTUiizXyNjJQ27dFd2vVkhHMPcy4Co163wBkKceH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=axGKA9zE; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="axGKA9zE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8q4HoWCtU5/oPTN72KlbEPnrN2RSiVQ7aB4QQvDdJ25yWldANcq3mvbCpJU0oryxP9Lwjiz5aB6bdoSdsETsmWsDi5VO/ykx1jqBetAQstOKhITwio7d2gFf3de8rnbMliw4WTFI374YYj5vI4ytjHgug9PlnVuPrCU5mwhIDsL4MjyBoNluuphVZB8ok87auYhzbn0dVOdXSBbo7rZfsr/rbE6ClvmZN1MR54XjYx9/HlM2TOp+S3lCRBQQ4ncev80TADKZAlErZtBifU+12mVJg0h31ivEJuuDBxgDWgFoOjjES2EwViUhNZXQYW1WEgg4/v/7O1wjjaaUXbE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bF5ivm2q4KHvlqtixsi8q8O88uNa6dovW1YiSZPKJIE=;
 b=uJZLkxHWXvBlfrr9HmHo9oVZV7oVx84sibq+5vv+ow6nI6SFD5Evt3dFE+qJIXQbaeE1v2YFBnt/iTYeLlaEPBNdUSitq7r5nkY/F+4cRB1fUjNcgWOGk6k+2+LCkGuIiaRxE/v8QZxbZeTFB7Qfx1pWv43yrRGIkmn1KFNn0NYZRVou5EycAxSx7Ph3+E3YaZQphUJRKqDiaZIzG6MjsmpSJmqQbqE36KOv9+vHER+2NdcxbqtMtXQlQMc34zzH6r4AMWRIqkTnimwrW5zwDNQaRmo0exNEqUBAeCTRLV9lBBdTxeqVO/+7nRiU++yWrQH/Z1gY3Q8Y15M92uwiqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bF5ivm2q4KHvlqtixsi8q8O88uNa6dovW1YiSZPKJIE=;
 b=axGKA9zEgNfx2mxXyOw4iRbEvUPpEZs6QlssnU6XUzUokywW9MVuzKUD9hTovVgNdJjGXZjdK9Z3FhWt68+yYMba9kOF2Sgw0Z7kBK/+elsXdnlmnynxLk6wTlZ5ipNF3KiMXNgLMXutaXsjn9S3orkNPxdyKLxBrQdW/4BO4y1KbuOe1RsJcmndp2XYNBF368PO0PGPnIqt2KXZxbiwz2Z7dW+c4rXZmNvbau6urfV5NA5q+SxhCjfXoZlZ6U/Iea3scrPOSOQVkOgyUnXTIj+71c1qrZg1Jait8LFZ+sq4SzhoZVCTp9+bep4/oxUbDGIO4q97cf76DWrHa/Zvmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8278.namprd12.prod.outlook.com (2603:10b6:208:3dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 01:02:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 01:02:02 +0000
Message-ID: <8058c286-b234-4da9-b550-8245641d92c3@nvidia.com>
Date: Fri, 20 Feb 2026 17:01:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/33] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-28-jhubbard@nvidia.com>
 <DGHIDF706REU.3PF025P56DMS2@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGHIDF706REU.3PF025P56DMS2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: cf117bc0-5d30-4d41-1863-08de70e4d2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1NmMnNLd3NlZW9RUFlQMzRIQWNtcHA5OTFJQzlHZzFzSHBNNi9LNkdPdzNq?=
 =?utf-8?B?U2dVdEw3SXBmRUdpYlFrb280QXhwZk9GQWZadFpEWmdXMUorcjArTG54emNh?=
 =?utf-8?B?TW8xWGNqdG41S3J6aDIzN2hEMVpnTlkvTUZ0ZWR5bkR6NkJucDlzNGE5TXZC?=
 =?utf-8?B?YWsybmVEMW94azh4ak5INlRycDhBS1Z5bi9GOVZJMmJrMFNJNkpQVGZVcnZp?=
 =?utf-8?B?L0lSRkhmTCtqYy9WTzUyQ1M3a1pSZnhKMkFPcEVYVDdFUkNJYUpPaTN1YWZL?=
 =?utf-8?B?aGtBOWcwRDFsVkV6b2txSUVrYlVDWm9pNk1uKys1QVNBcUJDUzVIMEV6YUxD?=
 =?utf-8?B?Ty9XVVc4T2JDM04zejgzcFNNR1dGaDRrVzc1c2ZaakRiZEJJbkFSK3VDL3Rh?=
 =?utf-8?B?M1ozbUlqZ1VkTU9vSnRyTXllMVI0a1VRNUVZVEtiU2liYjVUbkE3TWFvdFVx?=
 =?utf-8?B?bWtYUGlRZ0pWK3ZnaHZTczVvNDVuVmp2Q09LUzNUVTVzTHN5Nk9zUjZDcHFZ?=
 =?utf-8?B?amxGLzRUS3BtcS9hMDdqWnNKZ1JSaGdmN09COGV0TDZOSkZNajFUVGVhTFZa?=
 =?utf-8?B?anp6R1BYR1A5MmpiYjBQNm5vS2RpZ3NmaTUxd3N5OCtSeWtTMVdwbmpGYTZi?=
 =?utf-8?B?V3JNODZRL1JRcU54N3hqaStiY1FQcVZ3eWlLWFFEUWhFSG05bVMzalR4Nm1T?=
 =?utf-8?B?SEF3dHAzakV6Y1QwRStxUzErUVdJYVZYYVdVRWVZWHFmVCtRQ21ZdWJVR2R1?=
 =?utf-8?B?MDZKMEdOWEovM0ZnWk9YL1JCSGNwNjQ2MmlQeWdYeTNzMVZ1SmtiVGZSUUs4?=
 =?utf-8?B?SlcvQ3M3aUVNNm5rZjMxdFJZRWNlQmg4NkNHdVQ1WGNBL0NRaUJlQ3ZWalc5?=
 =?utf-8?B?YW55RlIxRkZDVk9IRDg2VjZXRkhIeDVYRFE3MnorY0NYVVpQRHE5bjJzajZw?=
 =?utf-8?B?TW5XbjlRaStxVm1ucVY5aGxTenAyZ1B2S1ZwSllwU2ZVTi95SHlyalgvazZQ?=
 =?utf-8?B?NTR5SlhBUHdITE8wSW5PTC8vaTVmRDkzampLRklXdGdNcnlTQlNlR21CMUl1?=
 =?utf-8?B?VktRVlF6ZUJQWlRQREpOS1pTMG43Q0wwbE1wZWFEWFBqM1dKOStxYjZGVzls?=
 =?utf-8?B?OWV6N1p3Smc3Nm9KNnJWOHpvVENwS29HNkJFNHNNYStMdVp4V2RCcGxFZys5?=
 =?utf-8?B?cUY4TzNDNHNFZGM1VDlJQnV0YktOM3RoOHFVMmNMeWJ2bjVqNzRNVVhvTlhz?=
 =?utf-8?B?a0NPVXZFZW9MdDF0VGFxUGVod1pxSnU5dzVmaCs2anM3VjFDcjBlOUs0dWY2?=
 =?utf-8?B?aDN2RDRwb1VZQW1tZ1lYNllRaGZpL1pySkV1TlNaTDBCaVhSUUJwcEJGOFIw?=
 =?utf-8?B?ZE5vYWpaOTRLTWJua05JZlQ3ZmU1cVVDakJ3OWM4enBsazNtNmQzNG5hcFpi?=
 =?utf-8?B?a2JpQm40Zzc1ODhVRktrSG1aSk1WaTZlWDBPNDV6ck40VWUvRHZHV1FpaE4y?=
 =?utf-8?B?end1UmlSbFBhNmZ1VVoyWjlYdHozMmhzMnFJVkYvK2oyWlBGY1NNcnhSTEpr?=
 =?utf-8?B?SGNwbmZlZC9iUUNLMzl5VDkzdVh1NTd5L2kxblNGaXNNcUFQT3NBRjRCKzZr?=
 =?utf-8?B?WE1NakxEUHJIRVIrVVFQT21MV21NUXF4Z1lEVFRIdXhxWVVtL0hLZzl5aGhp?=
 =?utf-8?B?NWdySjBVQnhXMU5Ob1lZTzRuaFVrWDNIK3Z5MXZVcUo3bzBocm5tdi9KQkI1?=
 =?utf-8?B?VWtBdStmTzdGa0JwN3QzSkczK1FCcUZ4S3ZROHY4d1RmcEdKdzBGRTRIemtI?=
 =?utf-8?B?elVnbFRtbGp6dHJUUlRXTjR0MU05R2N0aFJka2pWWTM0RlN6S2o0b0w1TTJS?=
 =?utf-8?B?eE51WXkrT1hRc1pjVlJjdmhXS3hha0Y3c0IrcTdRcUsvd2tlS3lUZlU0REFw?=
 =?utf-8?B?TURnWUJ2QjlOWXlVQ1pNRWJlN0I4eGdaREVNUGVmczRzVmJNVVVZYVM4aDgx?=
 =?utf-8?B?Wk1Kcm5TaExEem9vK0p2SnNBc0IzWFF4aWJRcnhwNEVtRUMwa0pJK1dzaTlt?=
 =?utf-8?B?azM0bkJ0WTV6R3JtRWc4Qk5qUU9lalN2ZHNrUXh3STB5c0xsV1NvYkhIYkdz?=
 =?utf-8?Q?6Be8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnJ6c2FIWHNkekticGkzMkZxTmpBV0ZQVHFaQ1poS1dVQjZKQXBiSWYyRHhN?=
 =?utf-8?B?Mm5rNitCWmlHaEJueVljaUdlQXUzWWUzUllJZkEyZFhFam4zeHp0Mm8wNm9N?=
 =?utf-8?B?YjFleE1Ha1YxajZhejFlc3UwY09MVUJMelFscERoVk1hUmZLcGpZVEROZ0pK?=
 =?utf-8?B?cnFhU0UrR3NWRXhVdVZFbnZVUlBJdGtvc0dZbjJkcmVreWsvcmEzM2p2QndR?=
 =?utf-8?B?ZVozNHd5ckZ4ZDZBL1NFKytOaXArVWQrMGt4MVZTaFJUR2Vid2JJcEtkSm1B?=
 =?utf-8?B?eDk2QTBoY1BRMG5CSE1Zb1FwWHBNY09MWHFqcnVySlJZNFFDM1FmMDJNWk5V?=
 =?utf-8?B?aytxbmp3WUFJNUNYTnNsZTRQNFRnTmpXRHEvYkRRRnR2Y0xwOFFrV1dyQkIy?=
 =?utf-8?B?VCt4TFZFVFBpRmhvSllJcDV3NW5pWFljbzduUWZkTVFNY01GWHJhWnpRNVBN?=
 =?utf-8?B?Vkxtc3c2cEFWcXZyeU93YURxSjJIRlRmYmUwYUJ6dUlsa1dvUzh6L3YvRE9x?=
 =?utf-8?B?TlY5a29zeXlzOTVqeUZxNTB6Z0ttTGJTYTEwWFU3ZGFWT2E5cm10OXZ5RjNo?=
 =?utf-8?B?ZEpLSzdOMVFrbWFlZzB4d1RBT1o5RjlSeGFReUhLRmY3eGhOdXVzUnhPVlRX?=
 =?utf-8?B?Z2lkYXNDbURSMWQ2WEZjeko4aGxzRkZ6L0dMUzcyemhTQ0FjZ1ZYeXVNaU1o?=
 =?utf-8?B?ZDhFQnlIZklEZHM3Z0oxUUdhSVpROG9NZXpCdEU3TzhKWmhGRVppTHdDY0Vh?=
 =?utf-8?B?ZzhqZTBtWHVuN0dWcGs4ZW5CMzdlMkVVSFlPRERCSDIvd1FGdjdSWk5STnVk?=
 =?utf-8?B?UWJMT2FoN2JFU2llenNWL09Cdmt2UlpxNEVNVU8wVHQrZHBaVkNkcFpjSWNR?=
 =?utf-8?B?eWMzc0NoaGpZS29HeFhrU2Q0c0k4OUF3WlNEZUpubjZJTlh4NnYrWGtYVVVr?=
 =?utf-8?B?TTdPVDk3cmR3WUlIdVhGT25uVFNNVHdRbzkybkxpbW9RUk5iZndDcllSWVcw?=
 =?utf-8?B?Yzl5MG1ZM3FxYk9SRmlpR0lZalVBVWhFQ09IT0Fpem9pYXBFK3d6ZXJjZUIy?=
 =?utf-8?B?RFlZY3NJbFY4ZmVONFd3aXFhSlZIaEVKemxTOC9IUDV0K3BnRXd6TmprZWI4?=
 =?utf-8?B?N3c1MHpmVjdrVWpNdkZLUjd6d0wzZ1ptaVdRUFpjalVEMHZPWmJWNWpoc1li?=
 =?utf-8?B?dG1XdzFvTGlLT014MEVCbEV2MDhYbkMyaUYra3FOUjFBd3Z2Rkg0NXhZT01X?=
 =?utf-8?B?SEFuQWU3UmdSZjVrYS9JcEF3TFMrZWpsTjVoWDRDa1pEcFNIR2dSdWFiNmti?=
 =?utf-8?B?Z0U2c1o0VkNhdm13cDVFcHVvZDVXT2h4c3JHRWFDdDRSaFBBTHBKT0VhWFJX?=
 =?utf-8?B?RHVNRDgzVDNCYVFWdU1TRE4xeTZMbGN1VUVaRVVESUV0RWdkcDlraXpNZVlp?=
 =?utf-8?B?YldZZUlONWNzdXlNbUhLeXNsUW9YWjFCbkk0VEswL3Z3T2t2UTNwMnlZczR3?=
 =?utf-8?B?VWd3bzZLaHpFK0FtRjJ6NStxa2dWSHNZZ0ZqMjViY3VuYk9idUthVXRhRTFY?=
 =?utf-8?B?OWhNMHpWWWdVbVhwUjhQbzJBbEZzc2VzVUhMNlVvb1c0WS9ZVTkrYmtndGUy?=
 =?utf-8?B?UlUwVzhSbTc5Tk5waGhoSTZrMGgrZEJKaHAzenZocDZ4TFNQR1ZQZlptcDc4?=
 =?utf-8?B?dzNybldjSzR5V0tMU0NtWXVsNmptYUhDbVNDK2wwRU1MRFpmUGcxN21vZlI0?=
 =?utf-8?B?MkhMWTI0YkFYbmhzY1VyM1VvTGtDRDc5UmhXNkhSN3pPTXliQ0c1amw5K0JV?=
 =?utf-8?B?QnQ4Q1ptM1hYVEkzclBITnNXTXdINytUenJQblAvajhpTHFhU3ZFc3dvRlhX?=
 =?utf-8?B?bThZdUtWQjE1MU5pem5NT1BVZ3pMTEh3ZlVBU2VIKzVBVFB5UEpzZlRsZGMr?=
 =?utf-8?B?VlN5Nnp4Q0JtWWVUTGh2U1ZHbnpBRGFSTHhIeUZnd2svUk4rKzFqZTYvZ3B2?=
 =?utf-8?B?K3NTZnpNYU5kY3F4aGdiNXgvdHIyT0QwSkJXUFRHTUVtN0xtTVgvS2FxVWlD?=
 =?utf-8?B?SFdjTmVwTU8yY2IvTjFmMCtlYjlVYmlBZWpQK1VkL0V6NU9oTDhtQUlKaTh2?=
 =?utf-8?B?VjB6SXRYL1VucllVWlg5bHpERTJoL3BrVFFXT1FBS1FBOWZwWGJVRFp6WUE4?=
 =?utf-8?B?dHFlWUpKbnJaeVhSR0Q4WXpyK1Fibk1Yd2hlK3BJNEhETllXb2RXcnRmeVl1?=
 =?utf-8?B?OTRoUGlHQjU1MWNyc2cybFlmNmtET0k5cTM4RmFKQ3VkbGtoVDN0Sm9VdEVG?=
 =?utf-8?B?NnJIRWNmRHpHTUdkd1NpWVJjRnZrQUhnWVQ5RFd6Z292dEFZbkszUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf117bc0-5d30-4d41-1863-08de70e4d2de
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 01:02:02.7913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+USerfDF244hpzrYWrPkd5Zq0evEf1HmTi7iyr6f2fLJit7YHDwMv6XonusRWCtSNH5xUQaTtOhj0xkYi+bzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8278

On 2/17/26 12:10 PM, Danilo Krummrich wrote:
> On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
>> @@ -74,7 +94,7 @@ fn management_overhead(fb_size: u64) -> u64 {
>>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>>              .saturating_mul(fb_size_gb)
>>              .align_up(GSP_HEAP_ALIGNMENT)
>> -            .unwrap_or(u64::MAX)
>> +            .expect("management_overhead alignment overflow")
> 
> Ultimately, the relevant value for this calculation (fb_size) comes from the
> hardware through a register read if I'm not mistaken, we shouldn't panic on
> that, but rather handle is as an error if the read value is not plausible.

Yes. Fixed in v5.

thanks,
-- 
John Hubbard

