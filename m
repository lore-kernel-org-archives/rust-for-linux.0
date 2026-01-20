Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F536CE0B;
	Tue, 20 Jan 2026 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890225; cv=fail; b=QJc6ALtlb2zX8Bc+21zmn3VTD/eMEgAVSw1XmUmKUNG1P5kWRPBgXuBXhXAWODRlI2iON/wP7UJ3XQpP53jDhKz0agi6wzZnTEGrYfCY3EBpn8RzQH3StRfj2nhXwL75eZDzF7r341tTVmDAjcDYUITyEA58cGjL0oAsMli6Rfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890225; c=relaxed/simple;
	bh=C7ez5OFeL8l3viuUvwijKSCc6c3b0GOCX7OijFYEH8I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lc1hdh/dJHiiZe3eHPiUBvJZv+vBHe8rY6hE/fQzBpDZn7N2ig5jzsYtC5q6pYvPad4/hue6aIdloom2GpzuxKbv3D/2d+rSlbax0bM5R59oGUd+sNgNSCDjd18FSd7nrLvZN3o6aVsWQY9M+ndxzrppHhoJWvIB9IoCJEyAY7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MVhRZixm; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MVhRZixm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8XfrFzw2Vv5l0qY/gXaKqkTo3UDYQQR27gtru2+aDWSat2ehx2ujzlVTbAoW32rl556kLfwo7lDFkq9t7jd/vTOGiIzrJ7M3iikG6n3QjHijx9AavvoTODDVvw8DFw/zOK7Cn4RhatzoGS8NCoC8EUCwtqrW7nq3V9BK5oCg1FFB6O2lXaZMK122ahQ7RNpT/g7QhigtYkDRyIEETiobRgDoD8PDST4CZGM6nXhE1dotyplQPKFV2H7EVFWaOBZOkse/awv/wpkivBTPrtMTQQ/SoAnIHytLHeOXCM5DuUr/iLYi6rkn8fde2L7oxDY8tdtbhQqjms0DMV3JGO04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjZ7D/0XfHZ2kBqQA3+9bVwri+SnPyAQcMa1pX2JGd4=;
 b=WigzeNelqwq5vP0O5cbtzJOUAfbwYyB7sUxtx3xuiB6LM40I5UTIw/TPiPGlT6niyv85/x+emVUOhuZucTMJmg4y3ygh01YelicCu3s4ELIqW49WutokCpP0N8cqTu9MeA9+4RwVglL/gjytgLJPTMwbkU3BO+XqTdoWLYcGM2PvnuCNrnHCqz08tEQBwvba/96Ekl1lqSk2GL+6I5pmovxzBB2On2miXoAWkjnwBOZrXoWMxZjYOTSuzWewY0XQmJZ2R0ci2lCSYoFiqUWsQvWgh6ue8LRllj2SMLejWXKQ9MGJBJmbEEnh9wkoPFfAtsMsi1ioTLPB/Oc2fOJhWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjZ7D/0XfHZ2kBqQA3+9bVwri+SnPyAQcMa1pX2JGd4=;
 b=MVhRZixm6JDlSYIqc5vshyQ/RfBzYnktqUI/eNHP8hLBlAtEMh9B/h14QezAT5YJzIBM9Wgbx1aoX/D0CEBIiTOZPQMx4Dr7jdWf140mXnzaxXTqTBTdXieopa+zqYW5TroSRuAEYJ+NGY/0H2nh6TlFlmuWYaUs8f7+KZ1mjf9twMJk+kWKvqgqXGQyuMBK5ktvwPUIEINIw3ubtz1GKcFV/IVMx5jIkidor2aWxiAHciq/5yIxJVV0BM68Twtsy3T5B/hF9CK2LCc6CG2q2jwwrRmv4fNv5wsVqTufjLrBhqJxCB/3764i63GAJ1QZua/ibzF2CA7DL7jlyAM33w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 06:23:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 06:23:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 20 Jan 2026 15:17:55 +0900
Subject: [PATCH 2/6] rust: num: add `as_bool` method to `Bounded<_, 1>`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-register-v1-2-723a1743b557@nvidia.com>
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
In-Reply-To: <20260120-register-v1-0-723a1743b557@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0084.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c950ee-9ae0-4ee3-b04f-08de57ec73f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WExiSUppYlVXTmo5b3hJT2hJZjZLbGdGNHlTbUNyamdqTGg4NW5tZUJoUUhs?=
 =?utf-8?B?NXU5ejVETWRvNzJqSFo1cFRyQ3ByKytiZGdVbi92aHI2ZVlheC9LVXdEMlZZ?=
 =?utf-8?B?eVNDVldldURzYUtLaXlpbklNN0kxQmYvMFBqVzF4SWlqTzN3dXRLbDJ3Z3Jk?=
 =?utf-8?B?bHpGdlR3UlNXYTJJQWpKVzZoQStNUGVGNUl1QVpXdHRrb2s5dG1YeHNkRXV0?=
 =?utf-8?B?dE14UmlueS95cUpBc3crc3kycmJKdkFvVldEOFExNzUvYWsvTWpKYlpwMnEw?=
 =?utf-8?B?bEFTQ2NPd0xzdnBRaTUxNm1RR0YxSlhhRUlJUkY0bzRGSFh3d25VK2dncnBv?=
 =?utf-8?B?S3dqYzN1dU9kOW4xWEltOE41NzRuWGVIbmo2V29jeS9CMS9XSzRqcmhHRXVP?=
 =?utf-8?B?YWtiVnNhYmYweFJnd2ZRSURyMEZTdkxwWnY5TFg5MUJFRlVYOGpUQlZWem9V?=
 =?utf-8?B?YVFlZU4yQkFJa0pCV21Td3RUYkovdlFEa1dNRDBWbllkNnhzMEtPclZuRDVy?=
 =?utf-8?B?ZFpkWFpweHoydjdNTFBxMUdNbUg3MTJDQUs0NS9zODB6NTlDQUt6Z3NMY3g1?=
 =?utf-8?B?ZFNhUEIyeWlocVpNQ1RFSDhpYW1jRkUxVUZSYWdaUjU0YUxScnp3UlQxODFE?=
 =?utf-8?B?NTJVbXJhM3FZeElycUs1R3hSNzRicUlrakpXRC9Na3A1alBSME9PdDdpK3J6?=
 =?utf-8?B?QVpkZkhwcWZUNThZM1U1MWJlN01lWmJqWDVVOEFlNldVeGpxRHdhVDQ0R2Y0?=
 =?utf-8?B?V3ZYeHZTQkdXM29XaGs1YVR3TFNGL0lOMWVZWjA2eUFWQ3A0U3c0dGUwVG5j?=
 =?utf-8?B?ZFVrdG02SzNYVVZIZzEveDdCUTF2M0FaZldkY251Rld3L2w1WThsUHh0dklQ?=
 =?utf-8?B?SGNFNElYbmpHNHFlRUFEaURFK2VkbGxnNk1oSHFKc1J1cU81c0FlOThnVnV0?=
 =?utf-8?B?NnZ4RnRoN2JaN1UzcmpBL1NyajlmbGhsYkZzY0RxdHgySEh5SnJ6RllKeTNv?=
 =?utf-8?B?S3E5UFRNMmpWMEpIQmkyeGRHcFlGNXBkVjAvdDNFVXJ4MWpXc0llZnZVdDZD?=
 =?utf-8?B?eDJZZm0wY0J4MTB0ODFOZjhSNTNCbStyTXZHdG8ybkZIMWUzbmZOVFo5TlFU?=
 =?utf-8?B?VEtZclJQRWFXSkFkQ1U4RnVycitXZTl3M1NUZ1owU1NWa0V1Y21VcitnYndi?=
 =?utf-8?B?RERtcEplZERSbWkwRFZIRHhNaDZSMUJmbWpJb201NXNrQmxoWForaU42TjRS?=
 =?utf-8?B?ZHVJSWdpV21Ydk9oNnBlVmx3U1pwOW9aaFRXWTFPa3pLRDNvNkdCUDI2UlFx?=
 =?utf-8?B?eXFsNFZTRUc3ZnRxNStCbHpFenBzRE5mR0ptSHpIcVFSTGpNa0wrdmF6N0hh?=
 =?utf-8?B?UDFsalBRa2F3a2ZKZ1VITXB6RG96cGM3aWdsM0M1U3kzODUxdUtPMXQ3azk0?=
 =?utf-8?B?cDc2b3A5Y1gzRGU3cnA0a25JQW55OURQcWxpc242Um96OENXTVZKMGp5cmRG?=
 =?utf-8?B?NnRLUDFmeStmNXpubGFuakFzM2M3OHFOckczM0VXMVEzZlhlVE9xaVByYUIr?=
 =?utf-8?B?SUp6bUpjYmdrUGd2cTVCVklseWM1eEtnNThNaXpIS1RpL1BLUWJJMUVWOUlD?=
 =?utf-8?B?Z0hpUWtNaW9LMWJralUvRGdLREhEZ3VxY09LWU5rQ2VDcGRRU21WNG9MNmVr?=
 =?utf-8?B?bk00UERWR0oraXIyRmJlaVovMFlScVptTWl5cFNWNFVVSDAvdGdXNi95MjZE?=
 =?utf-8?B?Zm9QYVhLd2FFTXZqbmU2Y052d1g1K3ZVMGJST1pUM2lkRUpsM0hPdE16UUVY?=
 =?utf-8?B?VzJvRHJCbVQ4cGpSTEltSEdpWVExRUpycUN0RzlLTnFJSnpqTDJzeTJTc2Zk?=
 =?utf-8?B?K2ROd3p6ZTBFN3hxa2czWHBEaWRnT1Rxbm5pbUd6dXZBQU0yUEdiK0lmK09N?=
 =?utf-8?B?eUJUeHRxazBWUXlENG9ZREJJREcreGUycWF2YWcybHdaWkxxRUk3TmFCZ1Mx?=
 =?utf-8?B?RWw1K0JUTXFpcnZTS2wrcW5idURna3o4TmZsRmlQdlo0OEczNHhORFc0cGZK?=
 =?utf-8?B?MjVHRU1tOGdreHA5UU5DbndSYW9POWtTblBlR1RIczNTRzYxbHpqeTJKcFdn?=
 =?utf-8?B?UHd0V1NheHpqRDJqRnBIZ21HT0ZjM0U0bmlJQUQzdVlVTnNCaEQzSDRjT2FJ?=
 =?utf-8?B?V3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGVOR2lxZjJOeGI0azR6MThLRnhnS0xIWTZXYU9iTWovVkJmemtTMjQwRVB5?=
 =?utf-8?B?dE0yZWE0akNFbUF5bEUybktkSEVicmtSWUpFVzQ1QTFpODZ3ZmNZa05WT1Jy?=
 =?utf-8?B?YXFOYmoxZzBzNVRucUVVdGlHSTkrNm10bWNMMldlZlhiaTV0aGxOTG8vOGha?=
 =?utf-8?B?NE9FdjRHUXRnYzVrNGg2K25HclBPaGNndTRxRnkxdXZvM2IxYzVFRHZ2SkVC?=
 =?utf-8?B?aGtodm5IbE81L0JZNWZtdWdBWnRDblpkVk5pWmpqY25kOWdpMmFOZG9CRzJz?=
 =?utf-8?B?RzFGa1Fodi9uMjNPbGY4WnF1S3d3V3ZZYmRsZ0NJa2Z0RHBMamhzTEc5M0M0?=
 =?utf-8?B?Y28vY3dTcnVRZzUzRk9xcWQ5b0p3dXZPOFZhOWh0c2dlYkFLajlhZDM5Z3Fs?=
 =?utf-8?B?RlFBWFRxM05kZ3ZXeXBCcnJWSDAxK0hqOTZNcThxeStiSEJCTXU2WXFTcmpY?=
 =?utf-8?B?eS95UmcwVEdXa0E1dC9ITkZ5VFB6aGR1SjZCbjdmc2JvSStmTHJCaGhvREdv?=
 =?utf-8?B?MmN4VGF1d0xRVUFMQUVOMEozWnRrcHZzdjErTU44aEN6TmRoTGhEWXJVR2R2?=
 =?utf-8?B?dzVrUUo1Y0FQYTQ1TWQ2emdtK05ObkRuN3BVc2RtSlRHOE5MUmlNbi9OWnVI?=
 =?utf-8?B?WXdSRWRHeDhrMEl2cG5GRzhMdndkd0N3d0NBUE1PRzMrV3lXODlBWTZzeHdV?=
 =?utf-8?B?WSsvRW9CUndKYURrdWlqVlAwUXd6Tzc1U3NyODB0N1JGNVIxbmF1NGZkc1ZB?=
 =?utf-8?B?dnNQYVE1MmV1M0piaGhTZ0tJRkFIcFdqcTVNTFN1a2hXM3pOT2svN2RzM1Vs?=
 =?utf-8?B?OURTdWZMZXJMUmJaekhHQVRFcm5keG1HUGt2aXFidTc2VjhqcnlQRXU4bFZy?=
 =?utf-8?B?NW9XdnRMQ2dxZzd5V05NZStuUlp5RXY2NFlrWGo3UXJMMm1Qd0xxd2VYa1BZ?=
 =?utf-8?B?LzhwMEtPQmllS0FycldHcjl4VC9DQjFnWTVKenUraUwzVm1Dckxsb283ajVq?=
 =?utf-8?B?dHJJUFErb1Z0MmNQZnkvR3VZSkxsVnhoSGhIZ3RVa0ZKZWdKdHB6SS8zaXM2?=
 =?utf-8?B?K01oZWs2VGRJMjJmL3AwRGRNZnRQekZyS1JpUWIrbklBcDVOT05OUVltVUFH?=
 =?utf-8?B?K2F6TFNiTSs5NTdsU2JoRFRkTGFzZTVNU3NTVzhvYWN5QWIyZWlTc2g0eWVs?=
 =?utf-8?B?RGdLaDVPTGx0ME5KanNJRWMyQURiK0YvSUJ4WFFuNGxzS0NhSm9KQXNsVUxV?=
 =?utf-8?B?UmJ6SmdicDVsNmlqU2tER3NGZEZsbTVFZlNBbUMva3dOVDNHZzZUMm83cHBP?=
 =?utf-8?B?TzZsakVxZUtrNHVHK2FpdXgyQW5HNGZxUlBLYVVmcnRieks3b2ZxUE12d3FX?=
 =?utf-8?B?eXZlOUhNVE1BcnI3Mlgzc1Y2UnQ4MU9oVHE2MlB2TXVBV21VV0RPeWc1QytL?=
 =?utf-8?B?bW5iWHpPWVAveVFYbEpYYkhyZzY3ZXlzVUNyTFNNUnhSdHJTVWdKdWMxY2sv?=
 =?utf-8?B?VWhxKy9QSnJXUTZtY3lTWUROS1d5L2crTXo5Z0tTaXNLWGM4N2d6Mm4rSE5Y?=
 =?utf-8?B?UnMyV0dvTHV3NTQvRTd4UDRQcTNlVVQ1ZjMvcU4rK0hQcDlQbW5OSldaQ04x?=
 =?utf-8?B?dkVVMHgyU25ETW5Ia1Eweng3a3Jpd0JKT0FoSVZtaGpCUkFUNjlwalhaM0E4?=
 =?utf-8?B?c0YyMTJINDZLMTd2UWVZUllEMEdPR3BJNmRUR2pscFhGRVZwL3BsRnpndGlx?=
 =?utf-8?B?UjJieTNkNnFlY3RseXp4dkxJNW5OMll0RCtLVGdtbmhiQTE2TGhZMHEzc3Vy?=
 =?utf-8?B?WnhRalpZY3RYQjFVbXRSR2JPbi85L0dNVGhPTVRZM25jVHlPZzZuanB2Z3NF?=
 =?utf-8?B?NlUwOWlwblQ4STgvOTMvZGw3UThTQy9CUUErcXZsa1JVcnJTblZDYzhWMVJO?=
 =?utf-8?B?VG1vdmdxdlFrdVhQa2xsUXQyVit3ZkVEb2k3M1k1UDhYNkUvbVVLU2Rva09Z?=
 =?utf-8?B?dndZVk92ZTgrZU5oRjhJVnpJVXpJMVVIUVVpZ0wzMzZEOWZORFA3UG9xcG9I?=
 =?utf-8?B?MHpuQ1QybStyK2NIcVFqNk9CMVh2UE1WYmU4TkVTdm1ZTlBibVY5UFNxSnpw?=
 =?utf-8?B?ZW5WTktsZXFxdlpTMUV6eUUrbzkyUU1rdEl1eHhzaDZMaW9zTXVSSDJQVktu?=
 =?utf-8?B?bnFXNVYyY0lacTQ1WTIzQnZTQ3hHQjdhemJOVkxPWHJPNXB5ODJYb0JqekJ3?=
 =?utf-8?B?VVhaYWdGVXZBTVlLRzM0Y2lqU3MwemQ2Y3FYQzA0NHFMOTNITDF6WlRoV0c2?=
 =?utf-8?B?L2ZZbExKd1ZjSXplVjNwa2J2UnZXZ29rVTA3WnNoYnpLRHRYUHRjSG5WVlky?=
 =?utf-8?Q?rCEyB6uJN77+L4Gadg7TapTAwOgc6sAE20p+Ly8ssG0+S?=
X-MS-Exchange-AntiSpam-MessageData-1: Y/PQSbcyGBuC5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c950ee-9ae0-4ee3-b04f-08de57ec73f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 06:23:40.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/cxTrdTYXDmUEfU07o+UxWiG8/C2mKEBhoT3JJOsVUSgNjv3JDZH80epCR4i/TFDWAZ7/Ogu9QY6bKVfEZoIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Single-bit numbers are typically treated as booleans. There is an
`Into<bool>` implementation for those, but invoking it from contexts
that lack type expectations is not always convenient.

Add an `as_bool` method as a simpler shortcut.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 6e3f4a7a5262..803ed0889ddd 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -1101,3 +1101,24 @@ fn from(value: bool) -> Self {
         unsafe { Self::__new(T::from(value)) }
     }
 }
+
+impl<T> Bounded<T, 1>
+where
+    T: Integer + Zeroable,
+{
+    /// Returns the value of this `Bounded` as a `bool`.
+    ///
+    /// This is a shorter way of writing `bool::from(self)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::Bounded;
+    ///
+    /// assert_eq!(Bounded::<u8, 1>::new::<0>().as_bool(), false);
+    /// assert_eq!(Bounded::<u8, 1>::new::<1>().as_bool(), true);
+    /// ```
+    pub fn as_bool(self) -> bool {
+        self.into()
+    }
+}

-- 
2.52.0

