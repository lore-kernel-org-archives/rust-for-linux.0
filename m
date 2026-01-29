Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA42868B2;
	Thu, 29 Jan 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769694067; cv=fail; b=AO9aOAmN0hi5aW0or313NHWsDmF8sbOYrcKkvUwtpd9lujuS9pY+0gnYqmmimOHRexUTp9eyhus1kvCI2L4aXIJwJJYn2hZkXGlNpHPKJ/QWysmPo07sxEqCUbYzRtlX8GAJ2V1NUS7cYnHsYyLEJeEyNPlnz0rU5daQgWVO2S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769694067; c=relaxed/simple;
	bh=eWkxLdS11+pg2TtZUGvpMEcdL2O6CCzLjeuSRzw6QSc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CTmn4M51hKayPm+xCtSIEjV9muffr/FvLyBvg+plDYwhkvRR38p0+eDK1fuxGtkw892OOyrDZEUpQN6/DelTBGPhbclGoOoC696YqCgoKAGjfIyVslH4ZV5+RolOnZYkPh1ftooRCENaB+6fMq0CqI8A4YH7TzLRYDff0OexFUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KKqcRCwE; arc=fail smtp.client-ip=40.107.208.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KKqcRCwE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ0VKnjQ/jNaHtk9nnUkkr5j0+CuagMdzMX24Xyq/qmMOFZIMmUYLYXboSiTt8PKiPRcIS1GxFbPxaTA9YTnABR55nn+uC0QRXLfOAZTEwCC8ee+OnHocsjZt1S3hntXul4dIb+OpMvF6zljKaWWw3BcwxjWW6zKz988vqUdBq0jIgRlYaPXNmODq4ugfgl0mX8Z1mGi4V4q8bN/7widX+5yr9533qkMSh1iGwWx5xQuiRZ7FgsdR7BI6m6KV7z76MaEv7N666hWM+qjeOKM5HrR412FMs7d8IqDW3C5oC+20KZ1AbBI4UxD3EOEGcDdsyhqEjpgrCdI3NrbZkoeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNie8XaITfm1dchq/3HL7qAIsEzzlcL7c6TLleyA4dY=;
 b=eyHUcmfCpvcFvhYpDzlctJcC17cMRhO2Iw5bsIRfXxZAa+6KHI0HxNg0Bqk7/k69R07QzCfgw0woiXOXIlu+8ve7fUX3LH/7vklbixuhnjwzGiT4VwJmP6I5TPBemyBcps7Dee+qCPQo+whYJ9axph9JgkdGvlux890ZhECcU/KbJwVpKUrZq0FixExi4qj1Nxf9zFe1qS8LjuH1k8mlw0EU+GwZYL7wSSgVPqXg/zjUTN1y9c7vzDXua7mDTauFABz1zKdwRsolw2nzDzoId9l5OBzMBiQNUxIS9xo0UaKvjDXhCVF1nr+AT0MPne7kkv26GeDIFItQ1m2YDZWlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNie8XaITfm1dchq/3HL7qAIsEzzlcL7c6TLleyA4dY=;
 b=KKqcRCwE/qUOjQjrlsi8YAqUt2pPu+K7zKVJCN2danig3ZmxeokLGJTZay2yFrYqjiMSREs9nSERrMRAUXTmo8tmjmElIzw/oW3hR+N379/h+8YCd5Zj8Ooa7m6PkO1sqcRqHtubfhwkRz9wl+VZuY94mYsUUo6GpQ74rsGJGoSk/mJ5JKpi7Yo/dVp/AxIyvWBAuM+l/I8ZBcEQvXG0nNdT08xFYEm/ZW8yRUR1qxNNj8/0QHqQ5Jg0DcwtnSjn13leFhNaJYcuOLK8oZEqJSzBHHC7toVUTMjwD9Jdtra8xaOnx0xT/2UMOvuMQcNw4oZco9hOQgVyofYRerNZgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8909.namprd12.prod.outlook.com (2603:10b6:610:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 13:41:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 13:41:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 22:40:58 +0900
Message-Id: <DG146R3XWKZK.2ECB220V56ORS@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Dirk Behme"
 <dirk.behme@de.bosch.com>, "Steven Price" <steven.price@arm.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <ynorov@nvidia.com>
References: <aXgpKOHAmvZuMVSt@yury>
 <1C5C477A-2CE8-4B25-B968-416B89EA617A@nvidia.com> <aXhD4sI6MHdAvgNT@yury>
 <DFZB4ID2H1D6.2ES3VEZQEGEQO@nvidia.com> <aXmeR2ocKm-xPM-w@yury>
 <DG0A8B4DUBDB.2NT25Q8SZOHT7@nvidia.com> <aXpP2l9Gr0XOfSEn@yury>
In-Reply-To: <aXpP2l9Gr0XOfSEn@yury>
X-ClientProxiedBy: TY1PR01CA0191.jpnprd01.prod.outlook.com (2603:1096:403::21)
 To CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 730f0c62-85ad-4b8f-73e5-08de5f3c0a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0MyaEhXY3Yva0g4VURRMmJ6QmVUaE92TDhCZDNMcDZNajBIYitRdzJUeFNy?=
 =?utf-8?B?TnJueVR4UklxYUJUQ2kwUzZNdDVseWNSLzdneXhsVVZNcjg5bEFRSFViME04?=
 =?utf-8?B?WW5MUWdzNThRL1BmSEk0VjdIbEZadFVHYnY3WHNiTlFYLzBHTG5RVmNNTVM3?=
 =?utf-8?B?bHV3YWFjT2d3OFVadEc5L0FSbXhzSHMwRkk0dDFoR2lXYmVPRFUreVVHazkv?=
 =?utf-8?B?T3VrdFhsdmxuQ2tDZzZ2ZStLRkJZSUVKSTdPUzR2NHBSVTd2R2EvRlRhdEVz?=
 =?utf-8?B?My9iNzFOV1JiTGdWUmJGa3V1d1BmRXBqamNqZlhkUThyMFJRejdQV2V4N2dL?=
 =?utf-8?B?VWF4NEs5VUM3a09jVDZNdzY2NnFlb1VvaUdvTVNmK0M3bnVhcVlYcWNKUUVo?=
 =?utf-8?B?bG1NNGdHUWZLS3RrajhRTWJUOXk1ZlBnTTd6MWR0Y0JKUXVlaDdDeVFDbzM5?=
 =?utf-8?B?RWJMTDBDUEFlYmsyMEwrWU1UaDhWbU8xT2czZW0rYW1UZWhYaXhWQmg3UHdK?=
 =?utf-8?B?Y0pzNkVLKytvMU52Q0tmS3QzQy92NThFMnlaY0RlVFMwMjQzWnJSWitBTGs1?=
 =?utf-8?B?NGpMSXlLQ0I2WVl0czgyejlPVmxXNTFBUGd4eG1iOWxDNm1YWU9MR1BqbnpR?=
 =?utf-8?B?Z0Q3OEw4RnpIMDh0anpxbm5oUUU4WU1CMTIzenVwYUUyNGVkUE1sbTlqcDdD?=
 =?utf-8?B?aGZlMFFoV1Nma0I3LzJSaHpZY1Uzb0wxR3Nkem1YRVBIUldvSlVyN1ZITFcv?=
 =?utf-8?B?alZrUFlsQXZJdU4xM3BSMm0zTmVlc3hTRHJDeW5SRzRQWVVyd0I0d1ZIRnNz?=
 =?utf-8?B?Ukk1elNUMG5CMnoxSDFDTUVQMkhkbzRtVVdiK1JCamwxZGlCY0ZWZmFzQ3Zx?=
 =?utf-8?B?WHhMRG5wN2NzWC9iRzM0SXFlZDlPczV5RWdiYXpvc2k1MWRtdlJVaHNlcitV?=
 =?utf-8?B?Ukxtc0hRc2ZBdFBEbzZYYmM4cTRRNU5lbkVueDYwbXJKbWVZdUlXejN1MmJF?=
 =?utf-8?B?bEpxNUNZMHZXUDQzSUgyZXJxOENDZE1XV0ZqblZDUnFMTE16Sk9PSEV2UkVi?=
 =?utf-8?B?K0crWVlZMzZvblR0OUZCOG1QUXZhZmlGMzBQekdsaFlDc2dxOWJHM3JheUc3?=
 =?utf-8?B?SnBtU1laVUQ1UjhJcXNOcGRSSVlZQ2gwZnAzOXJiQ25TWk5CK2FRYWlmaXpX?=
 =?utf-8?B?blNSMmc2Q2pERy9MMXdVV2Y0enEvT3kyZWg4VzEyWERMbmtTcGFoQW5QaGNl?=
 =?utf-8?B?S3VQSmtFV1hRb3RMOFR2bVQzNTl1TTh3dnJYVzVtUDk1M0RzdW0yQVM4K3hN?=
 =?utf-8?B?YnhabG5TVUpMYmVQaGZUOWJjZTI5ajM1RWhwY0FzaXFXd2c0RFUyMjRTb2RR?=
 =?utf-8?B?ajZ2ZUxSY3c3eFJVaGhCbmVmUS9ENEo0K0tCM3NsTzBQU1M2UUZRc2EyZEFv?=
 =?utf-8?B?U0JiRlZ0czI2ZERrWVpDb2IyaWNEQkZORDF6YUVnV1Bma1I1RElodHJselNR?=
 =?utf-8?B?L2R1SG5ROUlKY2ppdzJ0cjAvbGszUGd0ajlKUGlKdC9BQXR2R1lkYnNkeFly?=
 =?utf-8?B?TWN5a1FMY0U2WG5WaS9FcWhVWUVVaG1LWnZsZXFMMm1OWGVmNGdubG9ubE5p?=
 =?utf-8?B?VE0yU3NtQXI5YlE0bTBZa0hlMzN5ckNLYVZZZEt5aVBYSUNDaThwelU2YmdX?=
 =?utf-8?B?bS9EWWVTMFFpMTYzcXV0Tllud0xtYjJuczM1U3dsOGdBaVdoTkNkVjFQcFpw?=
 =?utf-8?B?ekdWUUdFNWpta21NOUlmVTR5TUM3dXd2MGZua1VCcG5lTXdqeEZjdVljQWFH?=
 =?utf-8?B?UW01eTYrWHoxVXoybXZnYW1TQ0pGMXFYb2l1OUJQeitKNzNtb3NsN09USW82?=
 =?utf-8?B?UVNVRy9Ya1lMeUJycm13Q011bGd2UnR1OUU1Y1Y1TldGS1lmYklJdWpaTlBj?=
 =?utf-8?B?YkwvbnlZenNHSEo0RlEvaDNrTWRXajlKWUduZkhOOEthMzY2QTl6cGVwSmsw?=
 =?utf-8?B?TklYcWxtdE9BNzZQazg1SDBPb0JVWG41aUtaSDJmM0ZGY3hGSGkwUDBxeWZu?=
 =?utf-8?B?UHVpSlg4bnN6cXJ1MHJzcUNnMVZBQ2dRK3kyZEsveWdzTUFXUkJvMCswTUhO?=
 =?utf-8?Q?Lij4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHZYUGtlVUJiQjFOOHd5TjlNT3BJOHlRWG81ZlBiMHcxUUc4cmVhUFd6b29H?=
 =?utf-8?B?UC9Na2xJcWRBY2lXV3VZdDM1ZnJDeGNTL3duYzExTkRWUWo5eTBUNTFqc3ZU?=
 =?utf-8?B?ZHkyQThFZmxrdExpMWdCUE40cUhBUHVudUtObG04SmFJd1pFaUJQTXpiTzdR?=
 =?utf-8?B?VkFudlJMN09aaUVNSk9xcE9ENm81SDhqa0cwaDdyaWRjQ2VENGk5ZXlWbFZ0?=
 =?utf-8?B?RHQxQ3B5bStvSnAyeWhVOVQydFJPK0pza3FyY2lENHB4cmpMdjR0OE4xaVRQ?=
 =?utf-8?B?Z05iejB3OU5oK0hoa3FIaTlBYXVJNXJIajlydHRUYW1HUktDYjJUWng1eTlC?=
 =?utf-8?B?LzRnU2M5YldsUkE5a0J2dUVyMkRDb1MvQlJlQ1QrYlZhT2tiZVpxSEtXK2Y2?=
 =?utf-8?B?SXNMV2dXTlZyWVk2clJoZ1BmQ0JTb1BiazROZ3Flc0lSZE1sbFl4T3gyM1Yv?=
 =?utf-8?B?Qys5VU1VYUR2ejRyUEJ6SGl1REJadmlPT29PR2pDcE84cmROa21WTWcvdG8z?=
 =?utf-8?B?dE93ayt2dnNmZ3grdU5vd3hZY1c4eklNYnlQTkN3S0xsQTYzLzVFRFBObnYw?=
 =?utf-8?B?ZmhjU1BqUE1maWpNRTZLUklRajFRWm9qaTVNVC91TGhINDZreDlaVmZDMlpI?=
 =?utf-8?B?RGNzYzMrWEk5ZHo5YkxHamJxSkFoTkYreGhNUE9MRXNkM2dXN2daN2xKZGpZ?=
 =?utf-8?B?OGdRWG5IZTd0MnZBUkhyMkdTcGFIbGtFS1FxenZhYmhpb0daRUR3ZTg4YnJD?=
 =?utf-8?B?Vm03b29IMEUycXkycXJTZXRybTJ3WHY2ZzBkcXJuY2Nnek1iVkJnbE1TdkxH?=
 =?utf-8?B?V0Z4WUZrUjJjMnRBSUoyTms3ejR5K2NjVzNTVVdMS29oMkZoWlJUVTRwb25J?=
 =?utf-8?B?UWxyTzBoVWJWMUZPU3BrVHpURzZ2dUE3Y0Y0anF5ZU9qWUFJNTZYc0d6eGhQ?=
 =?utf-8?B?aDUwWHI0Slh4ZjB0cFRhSTFMZ1dCandpZHd0dS9WQkZiQ0ViWisxTmRSejNC?=
 =?utf-8?B?RDd3eUYwZTRhWHlwWDllb3Y4bklsZWFVbkhlbEFNeGVSZDJhOU9hSlArblhs?=
 =?utf-8?B?QVVCTjFzU2lqMk1kOE4rNzFqd1Uwa01IK2Q3cVp0Y01neWp5Q0ovdzhDTVNS?=
 =?utf-8?B?dEFyeFZXWExaTVQzbkdYdy9SV0RYL1htcDlQN2ZXdXV2NHJmZWQrWmt5eSs4?=
 =?utf-8?B?a0hvbUpiVnhjU2l4NFd3NkluQTFEWjZ6RFlJNHN4dm1ZSUhiSklBRTRaUmw4?=
 =?utf-8?B?K0laRW0vSUdYajJ4SkdHbzd0dUJxSWQ5dWtpczYyakVtcnpCMHdUOUx1Ty9K?=
 =?utf-8?B?WTFSUk5rL1g1TUt5alBEVTFPK29YUTY4NlFZRENOL215S09hVDNxZHZobDhl?=
 =?utf-8?B?UUZ6aE40RGhTYUlJcW1tYUh4UXBta2hubUtoQWRQNGJXMzh1Y1NXOVRVZ2ta?=
 =?utf-8?B?emJ1K2NpZkRVWm5TY2pTSXJscTUvdXorYTI3SEhVTUZPOUs0MWk4KytiL1Ns?=
 =?utf-8?B?L04wWVRHTi9KQnFyUkJyWitVdjFYQXRHY1VuQXRpK0prUUJXc2Rwak5tMGZz?=
 =?utf-8?B?NFF1N29CbGsraUpUWXMxaTJTQm1ySU90aHd6Z3RuN2Nwa3BYczFlYm1SNnJ3?=
 =?utf-8?B?RlBvSnB1bHRhYUhmR1FxbnV4UTV0Qm05M3U4N0lNbVAxa0hJYVluV0VYa3Rw?=
 =?utf-8?B?b25BUG93MU8zK04rS2xqQnpjWndZbWYyakZOanpWUTU1NkJMTDdDWFJZM3d1?=
 =?utf-8?B?bnRHSjcyNEpsUTZsdDZrZTZuMjFMRExXRjdQcERXY1gvNE5NS0RnUUZVOGlo?=
 =?utf-8?B?SS8rSk1yNkVZaHpDRm1zTHJzUkc3UWsxeCtPK3hFNElqdmhRbVdZSjU2bHdu?=
 =?utf-8?B?ZEJEeUZUTGRYbm9JYTN3NTZCVkVCNzJQSXF3L0phbnF0VXZkQkNOeXJjUWx6?=
 =?utf-8?B?WjBWQ0hwSzY3OEx6VFZRczZ2R1ptZjlRMi91S21yZGZSRkF4NGhjcWZxOWsz?=
 =?utf-8?B?YkExYkJnWkJiWmhzQ2ttYklZMTdkcnBDQ1Y2dG9RZG92dHFJUDhPQkJLTVM4?=
 =?utf-8?B?YkFLa0c1ZTRtOG5qQzVHZmZyLzVGM2o4RTgyTUU3eGhJWHJXeWNDbFJwdVBa?=
 =?utf-8?B?Ym5GSysrS1hXc3Q1WlJJQVFGM0Q4K2w0cTVjRWhpeDZFQlhNck9oZWlhOWZk?=
 =?utf-8?B?Q0R5b3RTWkVHaDRrL3RxNGhnUitqMEpsaERRWDVnWTVaaTZpTzhXdElxVG9i?=
 =?utf-8?B?NVptaWJ1aU9tSWt4NUVmYUl4MEViRWtaa29LUFhURkFXdjZaeHpWUjNiT0RC?=
 =?utf-8?B?OU1BRzV2eU9YamlyR1dJL1I5cE1zV2hUc0JPTkhwUG0xWENub1NDUzJ6aGRt?=
 =?utf-8?Q?07Eog9k2ozJ4QA4Ig/S5lIJZw3vSK665JtOrG72S2T5eE?=
X-MS-Exchange-AntiSpam-MessageData-1: lJf5U85TKa9Yvw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730f0c62-85ad-4b8f-73e5-08de5f3c0a74
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 13:41:01.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJ4i/3CigvCY88cRwegLd/JnJfPCHMwTkf0FqiQQAOSBV0Ad4vmu/af3ETFFCeL4aqc1dmBlfbYeHACcOmM/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8909

On Thu Jan 29, 2026 at 3:05 AM JST, Yury Norov wrote:
> On Wed, Jan 28, 2026 at 11:12:27PM +0900, Alexandre Courbot wrote:
>> On Wed Jan 28, 2026 at 2:27 PM JST, Yury Norov wrote:
>
>  <snip>
>
>> >> > Then let's implement it better. Can you comment why the suggested A=
PI
>> >> > doesn't work for you?
>> >> >
>> >> >         color.set(blue, 10);
>> >> >         color.get(blue);
>> >> >
>> >> > I think it should solve the problem with name clashing.
>> >>=20
>> >> That syntax cannot be implemented as it is written. What type is `blu=
e` here?
>> >
>> > 'blue' has no type because it is not a variable but keyword. We do
>> > such things in C all the time:
>> >
>> >         DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
>> >                     ^^^^^
>> >                     keyword that becomes a part of cleanup function na=
me
>> >
>> > And in another email I seemingly do similar thing for python_init!()
>> > macro in rust to pick the right constructor.
>>=20
>> Yup, and we could do the same in Rust with a macro, but your example
>> above was not macro code (macros are always ending with a `!`).
>
> color.set!(blue, 10) is equally good, if it helps.

But not doable unfortunately, since macros cannot be declared as
methods. The closest we could get is

  bitfield_set!(color, blue, 10);

>
> If someone will point to the excessive use of macros, you're safe to
> ignore it. This is the very basic fundamental type, and I believe that
> it brings enough attention and expertise to make it safe.

I think the consensus is that macros are fine if they can hide
boilerplace. For instance, the `vec!` macro declares and initializes a
vector with content and spares you the need to write a loop. A proper
and elegant bitfield initializer would fit within that category imho.

>
>> >> The closest we could get would be a macro, that would look like
>> >>=20
>> >>     bitfield_set!(color, blue, 10);
>
> Or maybe bitfield_set!(color.blue, 10), but the above looks more natural.
> Is it possible to make it color.blue =3D 10 by any chance?

the `=3D 10` part is no problem. However I am not sure we can parse
`color.blue` safely since the macro should also support
`object.bitfield.color` as an argument and won't be able to
differenciate between the path to the bitfield and the field itself
(hopefully that makes sense).

>
> Again (and again) - usability and readability is a king, and I'm glad
> we're moving toward the right direction.

I am confident we can find something that is both nice to use and
efficient under the hood when we start extracting the bitfield macro out
of `register!` during the next cycle. We've already made good progress.
