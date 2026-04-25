Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAD21A447;
	Sat, 25 Apr 2026 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777130246; cv=fail; b=trxXRLaP237lOFpdCKy8RsgH9lGaEjHg0THdHPOyR/EH3DgBDS95UPqRPpZRloab/xox2l5ag09uZBYoXLG7AukU8/rDbD1h0QgauKbe1vXHlwsMziUZJ5hGzOFSfqz1kv16GllxG6X6PT84Njv7hxix7bu93TrFUHQbpgpSQS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777130246; c=relaxed/simple;
	bh=NE1jNDNBSv+CaCzdzUpWdTPaTajkBgf66qzCxBmT2og=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=epLT4qHZZKPjsA4tEyg1vIDvPe6YLYQNq2HuzBd86Z+Y3O5YyMRmhJjI3c68C2KQi5HmJ3OpQZeOslTarR14/5lINR6nWgpiscPIqX5IbZ8uKDiNf15s1+Zi3CU4tSiIO3vP7hWbqq13wMQ3c0r5O4dUS1DdXzQJLgSsPllnhFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RUQK9Qp5; arc=fail smtp.client-ip=52.101.48.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RUQK9Qp5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9HeFPXTt1LgyvflgOjTY063ujYi1JrPcq0YQYbqbcg0Rss0tU1r/bK9/iKRSnohHYkW3Vzw5+Spj2BcJFYBmbLOLPYMj2YeJf6X4ceju+6zwwzx9MehoFqs9+dagxkS4sgvibMwpKy+1iM4GJkOJ5EQaJR4d/vlpDDid14SLyKUSSRI3ZPjAmH5EHaxbnW2pysOY9pKtlgMhFxBL6hV7plA8txdM7NrsvP2/cc88NqYBEFHErPrmqlUxPi5FoZ1wl/isdaDZr5LB0HTUGRyewUPZmtSWJyX6ph+tx1gTmNRafATpx3czZuikHI9Dh+MWHL+7jv3Hg20wo9Xa9jCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE1jNDNBSv+CaCzdzUpWdTPaTajkBgf66qzCxBmT2og=;
 b=DQM+JQ/lzcNE0Mtr8keRQkulYeL4mC6FNufGSifKM3VNZ9BcPTEA8mYavna+2+fslFMgxhbttBdY33lFopO1SG5sxC4VLPebBhbFOw1dknukDEb0awXSR29UCrxzdM4jgfhLeOl3IXs9awNL4LdKCGNlqmJLmzR9fGezGRcNHdGl+VYCar53mXPwnTdcE4nSHOg9wGFZVBZWzQHoIuO+CQiUeTDR5DRR13EJ3nTGomr022rgF3N6PibB3pk92RUEQeXzL9hqI3fVcKudUe+EJroO/VtAZQYOw+jRhyAns3omlmo53b1IZbkWJNRw0TT1DFKo3kCljTazqYoSyIubng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE1jNDNBSv+CaCzdzUpWdTPaTajkBgf66qzCxBmT2og=;
 b=RUQK9Qp5fysTPqgrNPZIqhlwy99ckqBNlbv17GOfsZrJQ4e9hEsSiw6KjV8qONM+vaW6NwEnca/cpz/pUY09gZVPGtILa7ixwPcMrx4K3yx4y7AVg4yedUNDiNCom0I7JMIx0GiwLURQA1r4b1UDVQaDcgU0LmUGeHcfnfAsqYrejF/7MXeNx7VrEl0Zl7qG/xPpDvjdBJLemp7TKlnhv/iotKQTcoOTNF5jO9NEhd+JB9C2u8WllRTS+kaYqlAXYrV62CTmBphLaxT/IuyK4yQYMatruw+xL+s7fqmNAqOSWhigDfQraK9BABXYbFW6jff6c7zsw7y9olguSx0NNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9206.namprd12.prod.outlook.com (2603:10b6:408:186::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Sat, 25 Apr
 2026 15:17:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.012; Sat, 25 Apr 2026
 15:17:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Apr 2026 00:17:15 +0900
Message-Id: <DI2C3BE8SVWD.GSW436KJ8QA4@nvidia.com>
To: "Hsiu Che Yu" <yu.whisper.personal@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] rust: alloc: fix `Vec::extend_with` SAFETY
 comment
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260425060823.76175-1-yu.whisper.personal@gmail.com>
 <cover.1777111268.git.yu.whisper.personal@gmail.com>
 <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
In-Reply-To: <18fc8eee2f057a6bfbcadae156d1d0b7c40d0077.1777111268.git.yu.whisper.personal@gmail.com>
X-ClientProxiedBy: TYCP286CA0337.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0610e169-5794-4786-f6c8-08dea2ddbd68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t+6XTBNO6FKZmUuhV1W6wRfu0FznD8OuTyJls02o3e43rMSi7I0I/l40qOjP0O4LtJNBdwvdJUXGjd3sH+pV6oxiloYTezOm6hSlwgnCswMD+xna/M0MLR7kBABouTMHy7/3iV2YO9sH3QtwGaM+tr9ZvvitH7FrwkEKKyMGbtBmjM/W0Ree5aX6k06Npu7uxP7PKR6BKMr2iHFL+/PWMa/x8NQu+EtAgLHVraZvkUPV5qicWkhffc7VzbE303XWp7+GQtZG19Tl+xSucNWa54T9oH9Sfz6O4S5tvR4HivdE7lpm8cxWieZ6mmrn6h4URjWgxAz+hwzDv0l+H5HPwiVZ74EYOOUeUgPXd54kbo7+k0KWt6jExftMYqLsAChcztC/3PEIYZEUC9X9Q/HeBTlLxHLean/xYtTGSqyeXoJKJ2w/gfOHt1huBkT5yxFOR3W2izB8a966vCpB2fECCFRb+yXVHaRGKp/ZuWklstrHsmBbUh3bbh1t/d3xfahF5qc7Dss37r1wtlPd1WX3i2oH2SPqBu6M4jByVJZ8bxDiot1vrLCwfcl6Z9NK90aR1pQtGzpgKN3qnh++WXas1rKYFShhKXIxBr7QlV02k4RginOUXnQeB3cbybJMzID50IaGcEa4dpvthhCvBziMgvy9E4JbhzYJNqAyY92yGmp7jwTK+lBOp7Q2QVDWJ87Q593NR9W+72PzXRxYCflA1Xp/8MzI3f+bHVy7C7n8dM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUNwTUFDc3kra2dwQ0JFYmwvRS9SQzB3ek53Y0srVWVIeDRVVk5SN2pzWjhy?=
 =?utf-8?B?eTB1dUt5Rnh0NmRuUlc5SU9TZ3ZRVTlzSTFzNDY1TmRUbTlVZXdURDBaZCto?=
 =?utf-8?B?TStWRmRjalZZMUUrRnI4K2luN3VYcTRNY29GWFNncnpCc3lVRTFBVmoweDhK?=
 =?utf-8?B?ZXNpUC9kVXFSWW1JNXl5WG5iMkFmVVF3VzlsaHJ4K2FlcEVMbWZvVkJGb0U2?=
 =?utf-8?B?U2hWbnJPNlVXN00zWk9ZMVV0bGZ2bEIzUi93S3N1ako0bkJERWNnemQwOUd0?=
 =?utf-8?B?dXV5bnRvenIwMFpGZmZ4ZmhqQ2hGeFQxNFB6NURjR0diZmJpd0NmNmFscEM5?=
 =?utf-8?B?MjFhMTJGRHFwc1IxSnlPUWdGV3dUeFVKNXNtYWRkU2hPckJ2NGNKMGkxZDZZ?=
 =?utf-8?B?a1doQlBvdVFiWFNMRy9QVERQeVdvRENhSlhCdWlvV3dDSmxuSmlhRStsWDFo?=
 =?utf-8?B?T0ZYNEpETExWY0d4Mi9kN3VrRWFKUUdnaW9nZnY4V2tETzF1N3pSUmYyNStN?=
 =?utf-8?B?dGRQMS9zQmxEWTFwaFd4UVlwOGZmWFN0MTN4TjY0YkVLTVBIS1hxdzJ4RGdv?=
 =?utf-8?B?TWJPTk92WG5zclVPa053RUVnWDFHQUFCL2tGUVlLU0ZXMXRDN3l4K0Nad3gz?=
 =?utf-8?B?SUxMYnFLOHBiZ0MzdGhscnlJeG00SmJ2akZQcE1NY2VGV2JUT2tHV0owOUwv?=
 =?utf-8?B?aUNSYUNkM0M3ZEc1VjNYL2RCc1ZaYndmWkxBU0tCRVI2ci82YjAxR3Jld2hw?=
 =?utf-8?B?akZ2NitoQjF3N1VzdGcwNEFMSnVBVlVXamtsKzd0REhQaTkxemlLZmFzNFRZ?=
 =?utf-8?B?VHoyRWJaamZwaTVmdTJTb0xqdDAxNm9MU3orbjQyL3V0ekRwc0g2M05OUXc2?=
 =?utf-8?B?K0RpeDg0dGR1MnBadmt2dkJEWnBvU2ROdWIxMDFZdkplaUIwdWltUnh6UHlR?=
 =?utf-8?B?OElQbTIxc3MxRmpSRDZDOC9XZ2NKc0lrY2FER3AvQ1dVWmNrM01qazhxUUtL?=
 =?utf-8?B?ZWNhcmZWQU1ib3VTdTRwVzdaUE9iOU9JU2d3c1ptcUh0dHJsd210eUdmaTN0?=
 =?utf-8?B?WUtBOWN5T1M4RCtMSWh3cU9iRko0WjlnbG9xTkpVayt6QUdpb05nZEowRkV4?=
 =?utf-8?B?c2wxRFpUTkFYd2RTTGFzRC9kTHRDQlMxamN1dVlUd21yazZsZDZ5RnowUkg5?=
 =?utf-8?B?TkppcDJ4QUNMN3JycU93TjlYODdHUjlkTnd2ZmFNWEdqRGtTbFdUQ3dGRWNs?=
 =?utf-8?B?S0FxbWNGZU5rWnpsaW96TjZJT2RNZjVzWWk2VFpkVzVDUWc1OHRaVXRWUkZ5?=
 =?utf-8?B?WExrQmVLYkFjKzN0TGFMbjNMNDhBMGpvSDZJMHFEclJreDkrOTVuVVVGaDdw?=
 =?utf-8?B?dmpEM3RDRjh6aUkzN2JzY2J3YThCY0p6NkV6UXlDVjRqajl2UE83QTlJNTBB?=
 =?utf-8?B?SVFVejN6dFJwTmpsSDRlU2xpRllzcG5wVWhHbDNmMzRZRzdXakhDalc1UUN0?=
 =?utf-8?B?MUxCYlFxR1VoVmowZ1FkMTkzVmtZNXQ3WURHbG9iSXA2bEh6d0VWZEJpdWxv?=
 =?utf-8?B?clJLSkNqQnp5UUpHbjdIbDU1MUR1Z0hrbFFWR0J0Uk1pRUNmVlZnRWxqSGJi?=
 =?utf-8?B?UUN0a0FDZXIyMTBONGZoZVFsWFRwbHF5UDRDSU9FQ1RzRFc0UU80Rk1GQ2ho?=
 =?utf-8?B?OHQwdzE5d0twV01KajhRbC9DNmVFUEhBK3VBVkthYlBHVUxSbDhId0xqaUFE?=
 =?utf-8?B?VnRPcVk4ZHJMV0t2YllOcloveTU3aVZReUFYZHBudEhmWnZuR0d6WHpNNUdV?=
 =?utf-8?B?SzVtQkVmS1lYRjZsVW1xZkg5QXZ0UFVVcE5CR3dkczZyYUt1OWNQTjV6eTZ3?=
 =?utf-8?B?eUs1ejd0RDJTK045TmQxME5hNFFST0NQTVU2bHNNZExFNVhpdDJiVWJ6bHJ1?=
 =?utf-8?B?NFJ6d05aRCtJK2ZqMk40bTF3bXZDZnJOVjcvY0dLaGRTNFRzRHJwVllnWGJ0?=
 =?utf-8?B?RkVrd0cwUnJpT095T0kyOXdTa3k2bkEwdWRPK1BzN2JJM1NDZ0tWWFVPdjlU?=
 =?utf-8?B?VUhsU0lJbWhOWGRFRFEyMGxVQnFQQ1ZEZ2NOeHNlbFMwSGZNS003aiszNStW?=
 =?utf-8?B?U005N0g5T0l0VHRlOWd3bDU0TWJQeXEveWxiV2VhalY0Tm4zR0dCNGVxRUxM?=
 =?utf-8?B?cUM3TlJtTisvRktmTDNkemhtVVEzdDJNc0I0aG8wRHF6UlJNSmpIRjFYUG5I?=
 =?utf-8?B?SFI5b094Unk5NjFRQTM1QWFSVFlGaVhjdi81c1NaVUtzNjFQalVvMG5POVRI?=
 =?utf-8?B?QU1hRmlndW9FalJtQ1lRS1FkcW53RmhKODNuWnlqa1MwR091MlVlU3dXODFJ?=
 =?utf-8?Q?66wU81rtTMI56H7EYoMu2fY3elLDaG5ke/IZdeyWuuqY3?=
X-MS-Exchange-AntiSpam-MessageData-1: bMJZdM4sc72/WQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0610e169-5794-4786-f6c8-08dea2ddbd68
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2026 15:17:18.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWilSLRs2mjv9ACP5m3R2123O+mA67x+P/5bSpAKkMMKYnptucCMr1rv75PiAquXGnPO6Ot7a/kwClN1gTrO7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9206

On Sat Apr 25, 2026 at 7:16 PM JST, Hsiu Che Yu wrote:
> Fix an incorrect operator in the SAFETY comment, changing `<` to `<=3D`,
> since `Vec::reserve` guarantees capacity for exactly n additional element=
s,
> so the equal case should be included.
>
> Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
