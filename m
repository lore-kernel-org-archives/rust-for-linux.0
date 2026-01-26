Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478B0339846;
	Mon, 26 Jan 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769434159; cv=fail; b=RupaBRAB1tZcJMwUUct/z0RaImaxZaOn9xiV1yUc9+7kIal57x4pKYsUMV252CPNgRJji/IakfOgpjjvrol6Ize1BhsMsEAIysDxevJCdWD6a+3k1kA7Ztx/2pT3jNeGvPmkBtkFsbs4Wqvyu1qpm7BBQT0I/azg4qomWErxqKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769434159; c=relaxed/simple;
	bh=NcOB0KTjmSMVqkxjEDxbyVk3/qDkhNMKwnwLpeYFN3g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Np/cYFAWBVZVf77ePHRAjxmqYKeTiHh4jmfsb8zhVoTJCJ3XLOMMImJ8V7RGf6ABpF19rhwo6TzR20Y2hB0pklo3rldlF5RTfHdnxX4mu+nm3aj2OJY0OMaS/73u2kFDTA24s7OejB6kVq1MrLHdBGyNhtEWf3QGQC8biHxyUUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c1OFLbtB; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c1OFLbtB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azOpm1/YJ92TeWKqsub0l+SbFxRwpYH0p91d6Op0l/oOGTtc7qqHMN+mu3TupS4OYE1LveNkr/eWlasL66T60thtHF2XzcGjv1lKpM78+ijcH6gOIu1umDyaqzciVQKZgRklapmGP2fhXZa8h2vwjEkNA44uGysH0ReoEOXOFU/LbqpbTCY/qo6Ovm0ex21j7rUcJgMx71OzAowDrO3SCgj5C6w28jI4GQryRrZFelJiiSIsFn9woyVLOsaR4aQmdyyB2Kw1KSF0aixebzZ3sLPX81JhS0MPrvJDmrsVfngWd3wRZjq9otWVA5WwJCxtEANCM6kV/41EJPtgJ3X3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jBdQu6GetQOFtmsL631n5vo03qTOEBIJojMceXek6I=;
 b=aZ/17OSIP3Rh7z87H8MDhVzFPr2wHq/v9ZH0iWRKKdGo8fLlL4p2CRHrlpL04rx67h0dNDO5Hoz4kKrhTjRYkxkvpBYBVLahySVr4IeoPcukOSXox1cWxfs0QYCLaoI47DwUllfj5pYAeeMmnSX+SOaKvF7uHkWjRaWPDQdN4paNAuvIpzM2A/gUUXAEmE/pMjiaLVzqwPB+ZMsU8mPo75C4eZgFl6vXwuTwKNS90Pp3Bf296oTJEz11DDZ2C9zLDA/0ZZX4ywAWSJL4I3DK+hKMUW67cAtSlR5TWk2U2h8osY4Qm6DBXZoCalunawkesDS1XtxPxTUqgGAVqpVm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jBdQu6GetQOFtmsL631n5vo03qTOEBIJojMceXek6I=;
 b=c1OFLbtBE06GhNLobcOn2U59iNGvYBRt39ecSF+M/E0jzMFSk4CANa30p9meyNYzfhKiCS+ZNeDBkpGaZ5S0kZpNJzRDgB8+BLbrHS7aE141pMUELy0oVSDTzWhO2mntiTqFj0qAluBVvX+8UAmwDaLKZ6BRuxdfTuN6KKiIefr4Qk+WkpsUauiVtIKv0B8Z2Q1/qGm0ZmMZCF+9UF1kZDAdZiZNGSw5jGLEK103gIF1J5/CuVYtFoIi3crU1QHbrvIToR81XqNFSpglEw4vDNgbSOotl7Ccb14zYWtwuXh/upT4Iazr14LJwvRWVrO6VcSzRUHBSchoov+TzOl/kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:29:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:29:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 26 Jan 2026 22:28:44 +0900
Subject: [PATCH v3 5/6] sample: rust: pci: use `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-register-v3-5-2328a59d7312@nvidia.com>
References: <20260126-register-v3-0-2328a59d7312@nvidia.com>
In-Reply-To: <20260126-register-v3-0-2328a59d7312@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0208.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8e5ad6-d712-41ab-028a-08de5cdee660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGx0MXk0UUpVWEVaenhESDlqMldSWHpQYzZEQjF5bVhDbkdrOXcyTDIzZDZt?=
 =?utf-8?B?d1gwRXl4WG5lVEw5NFFBanJ1Sm5TNkxpeDduMC95NlJTaURYM2ZCOGZlakpj?=
 =?utf-8?B?ZEpXUlhEaHN6TGlHeGlYdnNmN1hUSGRSZ2VrU2xKNktxWGpSTWpSVUdlVzJ0?=
 =?utf-8?B?S1lOTi9aMTV3KzJmdm1haWlpYUZuU0J1alkzSmZoMjkweWY1TkVpZGRiZ3JX?=
 =?utf-8?B?SE9aVWhybnRnbWlmSFRMTDYySWJuYnBEQkJBQklob013V21iRVBEamZtRDdn?=
 =?utf-8?B?azBncXZJYjRDL0x2dWEyanFVQjhFSjIzZ3JOSWZtTHdtbWNweC9VZ2xCSmFK?=
 =?utf-8?B?S1ZSczQ4TkRJVlhPb2hyaFRQSHlOaHFaNy95TmxVMEw2ckFMWWljOXBjOGpB?=
 =?utf-8?B?WFpiQzByeFVEbXFmR3NNY1k4SW05cDdIaEF4WklMRHhFTTJhVXAwczJodWxS?=
 =?utf-8?B?ZEpNZW11OG9sajQyVERNdjlUd2tJZzcvVnpaL0xPVGIySXl5TlcxS1FkMUwz?=
 =?utf-8?B?QllQODJQOWMrczFnVGxBTHFUeW45RmJ4b2ZkLzF0Z3NhSlk3MFl4WTJ5TmFx?=
 =?utf-8?B?Vk1BaTh3TFZZRlhJdlo2SnRucEc0TFl0VEgvc2w2M1J3UHcxSkUwNmgyZXdi?=
 =?utf-8?B?UzNOR1lRajZYbGtnQXJaejhqYUMzR3pCNEN1NEF4SmpjNStCaUNwK0hobW1u?=
 =?utf-8?B?eTZ0Q3NlcURhR3dpczdhbjBYdjQ1cDFHeGloUm5ONXZqbFVLeGpWeU9IdVZ3?=
 =?utf-8?B?L1o4dkgwZDY2NnNTenRTT1U2b2dEd0RaKzJTdm9FK3VHZ1Z0QTZ3QzdwYUdZ?=
 =?utf-8?B?V3hyZUtYeTJ0SWtZSTBtWEdJTUpUc0FwVnVBaUMvRGdaSFIxR0wyS3IyNmtO?=
 =?utf-8?B?ZHdleUhoRVR1aXdvVTZoRTkrZGhHMVg3NVJzcXZuQUNhL1Z6MGN3S21tdlJq?=
 =?utf-8?B?NmMyQUtYaCtHaWF5L01qWnUxemJoQUg2WmMrRm9wOXdxZkE3dE1lcVBERkhW?=
 =?utf-8?B?V2tLYXZqa2IzSmdSNnhkMmtOZjBIc0VIcDNPbklkUzdSSVlXYjRjd0NZODd2?=
 =?utf-8?B?d2x0azhES1BSQms3Q2hsdFN4UmZWNEJncnJOL1pTZkxTcEU2RU5TcE51YWkx?=
 =?utf-8?B?VEE3VHRpM3RZN0FYYmVYKytxRklCRkNUMEQ2UHBMYldMUGtCWGdWVlBZTDhD?=
 =?utf-8?B?NjMwckljVElsV1Y3Y3ZTVVhMVXVtMUJXVzhYOEZBKzcxMmllL1NJamZDNS9p?=
 =?utf-8?B?azlUQUtSZXN1ejFpckcwWTBJSGdBKzRlazI2aUFCYTlwTm9YeENhRERBVkt4?=
 =?utf-8?B?emhkY3dMRU9JSjQxMG1BUzM0M0t3Szcwb3E3Z2Y1dUk3cW9NdGUvVHM1U004?=
 =?utf-8?B?ZkhjdW9VcndIWWRxWmV5M241WHh5UTFNUEVSdUY0OHdETjJndEhwVnFrRjhE?=
 =?utf-8?B?NUVUWkpiYkMzMmd4OFhuRTZrREZ5Uk5yRHI2VVR5Y2JOdDJrbHZaQmlwVlUv?=
 =?utf-8?B?SmE2dUJ2T1d5Y2l5OWNoTytuekNmVUxQQnlVWFdod0kyR3h2d2JjeUtoSTd3?=
 =?utf-8?B?dU1CSFFQb01lTDF4NDhzbWtZanI5Y3NreXdDSjlwaGFUazlzWWRMWWRYSEpI?=
 =?utf-8?B?WWFHRVYrT1ZCdUxoSGQ0WDFURE9TWXRyNE1id3pyNUQyOHdEM2hTMXpNazBx?=
 =?utf-8?B?WWtyY3JuZ0J2eE5WTjJVNk40NFhlcDF1UVdtSDNOQ0lvOHBFWFJSRFJkZ2Jr?=
 =?utf-8?B?YmF4WEdDTWRxenhTUUlRalhNOXRXUFd5NWFjeXVneXNFN3hUNnFyakYwOFNW?=
 =?utf-8?B?dDdsRll2b2NyRk1zQnFNV1RvZXUvMkJneE9oRngxTXpyendZdUY4WGtHS0FR?=
 =?utf-8?B?cTRmemR6eWVvQkRCb0JFNnA0VG1DbzJ2UVRhb3NpaTdDQ3FkQ3ZHTUN5b2w0?=
 =?utf-8?B?K0lUVUU0VksrQW9NZ0VsZ0ZTd2lueFBOZEpPaXoyZmpvbGtlVzJtYmVKZUQ3?=
 =?utf-8?B?ampKb3JsKzFHczNNWlRkaDAxQjdNcU11cEFRQytpWjJtV2h2QVpHejhDdzVS?=
 =?utf-8?B?NTdaOEVCUFFxbjZRVktVcDdtQWYvdkI5TEkya0pHQVBXRS9aUEhQMXpTditQ?=
 =?utf-8?B?UTNGWXd4bjFFQXl6VGMyNGZiZzhVLzZSQ2dKUVkrSWxnN1hEN0FoeG5hT01Y?=
 =?utf-8?B?SlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czJ3ZFRYcmppVE1DUm5SWUhwU3ZEbWV2L1BNVTBCL21wMkNmcFNVWU0zTVlQ?=
 =?utf-8?B?NkJHanZkT0ZOUmo4V0NYKzU4NDhwd3J3M05IZmFYTGtBcGRYRU5mb0ZnN21V?=
 =?utf-8?B?TENiTU1pd3hJZHlkYmRMY1hHMnkxZVltcWdtRmxYRWU0bXFuOEVNU1Y4elF3?=
 =?utf-8?B?L1NMQTdoaHRETFliRkptOFZkSmU4VCt1QzFiT0ZPVkNTNUJxaXJDTnc3c0tG?=
 =?utf-8?B?TjNFN0J3WHQwL0lWU0I0ODd4SDJ1eGFMTksvVUQ3eXlnMzMzT1c5YWdqZmhZ?=
 =?utf-8?B?bWR0a3czVnlOd0YyN21kb1Z1bXcyWWZHaXd5VmprMlFBQnphMngyRWFOYXJ0?=
 =?utf-8?B?TWx1bXdxMWdCdmZKZEY4NmRnQm9wTHBpdW5aZXozVlk0Q0xxNHlxWmt5dEFk?=
 =?utf-8?B?b0RLeFlCTm43a2tJOWZKWUsvOENiNzlNSk5zeVFOWXBTNnF4Ri9sOFYrTTc0?=
 =?utf-8?B?U0hKZUpQeUNTVkhOclUyU0h2aFZzdkFka256YlBmVjdMWVBCalRaV25hTndm?=
 =?utf-8?B?RnF1MEx0TWdaSCt0aHB2bFhLWk5mVHhOSnlHQzhjK2ZSYmgxU3J0ZURmOC9h?=
 =?utf-8?B?eDN0dHB0OURKRzdtcDh3bm4xTEtHelMyZ3RCUnRWT1E0QTVncHFpcEswQm5l?=
 =?utf-8?B?UkVLak1STEsyeXpLUHJlSEwxUFFURTFaQ2hRNmcrK1FYNDNXS2JCWDhYRld2?=
 =?utf-8?B?VUdJUlhvZjZ0VDY0Qk1aRk1GajRTYUpjcHkyS041Y3BNTnZVazVYaFFxSjR4?=
 =?utf-8?B?K1hFMmQ5NTFCaGVTZUNZb1lWci9EbWJKMTd1UlIxb0I5Zk5mQnNxWWhTL0ND?=
 =?utf-8?B?YUZOVGp0VlZqVGZjeVpkN1FlUEZCR09oUUhvOXJtVEpHMzlOOUQ5NEpTQWpE?=
 =?utf-8?B?MjU0VHFQcXhETEVBY0c3WEtOTCtvZTdRL1FlbFJOV0p2S0ErMWduVXI0T0ow?=
 =?utf-8?B?NCtiUGIxTjdXY21HRmRRSEhiY2VDTGhPdmR4VUtQV1ltNGJQYXFLYksrdURV?=
 =?utf-8?B?OFFjdXZBYlhhblRYdXUrS1J5eDBmRTBsWEkwWnEvdDB4Ymk0WndqbTJsYVhG?=
 =?utf-8?B?SUxzS2Z5RVE2d0N0TGZsY1RidmFUNGo0UlNYL2M4SzByRTFCWFNtL1BaOFhs?=
 =?utf-8?B?Uk1Gck5ZYVBZTGxncXdpdm8xVHptNGduZHFlVWdEM3RsMUdTY1lvNDVES3FG?=
 =?utf-8?B?QldEcHp6alR3N3lDZ2F3WGM2T0xOckhmcFVmL0Fpdk1OZmpuSURIQlEvZlc3?=
 =?utf-8?B?eE02Z0o3b0ErUjJoaUpzNWhJTW5HdWZNR3JCZkpIVWFmNnJZSkxYQnVabGdN?=
 =?utf-8?B?NWxIb3c3K2k2L2d4bjNhS1gxc3FUWk1RN3JyZ1ZtT2RLbFdtSjFOUGZkZ002?=
 =?utf-8?B?QWowcFJaVm1WRitPUlhXbUJwcEVrR1FGc0JEbFZOcGVBVit5WUV0czFhNFZv?=
 =?utf-8?B?bWxMQWFBMDlEYzR4NUVIOGk3cmJGQmlLci84ZGUzWG9Sb0I1bGVFaUhkbm5m?=
 =?utf-8?B?VWFIeTQwL0ZXV29iQVRyN3F5S25qNEs5NXZFdi9ZL1F5RE9CVE51SE9xbW9k?=
 =?utf-8?B?cWVEajZHT0drTmFXck4yVTFKQ1crTHlWbjN1MEROaURyaG5WU3B0aXo2NU9J?=
 =?utf-8?B?WlE1QnlLQWJZeldXT1hFVGNna0tZT2ZYbldXbGR5ZkQwdElLL05XWitDbGFI?=
 =?utf-8?B?N2tRUXZQbjF0eHJHNmk5ZWFydm1CQlJYdWlKT3c4a2RNcjE0VW5ZOTExTHd3?=
 =?utf-8?B?dXNuZzdsZktJM2VVS3RSbXh0N2E0L3VkSnFPSk9YTXhGNDBCQTlnOFdMSFpS?=
 =?utf-8?B?aFlyU29IRi9heTcyT1MxbS9DbXgzOFJUSEE2N0V0dzVuWTBadXdHR3RPbkpt?=
 =?utf-8?B?TXBLdkQ5ekg1UlFlWWdjRU9TOVlXVmp0ek1xVjRWSXBMeFBETTVGLyt4Tkht?=
 =?utf-8?B?QTdUSC8vRVB5RVYyNDJtUFpUemZ2RlN5MnBrMVU0YWpxQ0VUYjNvZzd3L1VK?=
 =?utf-8?B?aFJ1eVFUcWdTdTdmdGNwa1JzUmpBbWVlUE4wbW91c2YzQlhBTXZxYkdMaXh5?=
 =?utf-8?B?RzRJLzZvQnVPa3QxbVRqR1V0T1Z2OFVLWHZMRkRhQm9Dbi96TlRKaDB0Q0pv?=
 =?utf-8?B?OGtReVdtVEg0c0lkQjRPc2tUWWhWc3g3R3BwT3hYOE9ta3Bnekc4MTQyVE0w?=
 =?utf-8?B?OEg1cUViejhVZzVYZ3VMVUFuaW9sQkRIckU4aXdCVFpxczZYck4yemRtb2RW?=
 =?utf-8?B?S3haMURaOXlUcTJ1VTB0UTBBdGlIOVFUdTFxNlVoZFI4RGJyWTNQY0RCdlRO?=
 =?utf-8?B?TUttclNYOE9lbVduaFdmN29VMTQ0Z2cxcUJUaXkwMmdtOVQwRW96TjNyY3c1?=
 =?utf-8?Q?u/ZDxbtZABHCMuFV+p//gszYZL4vYMIboS4Uu0hh+rjM6?=
X-MS-Exchange-AntiSpam-MessageData-1: 5XNKH4HcHkqgSg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8e5ad6-d712-41ab-028a-08de5cdee660
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:29:15.4102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cNM1WKhduR8E1AvvY64/khegBKJxVvCcZICoF6PNs4q4w9WLOZh0154KvC4XxphIJKbrpbPeqHO3rH6XzY/uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

Convert the direct IO accesses to properly defined registers.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 samples/rust/rust_driver_pci.rs | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 4dfb8a6a4707..df2232d6b71f 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -70,24 +70,37 @@ fn testdev(index: &TestIndex, bar: &Bar0) -> Result<u32> {
     fn config_space(pdev: &pci::Device<Bound>) {
         let config = pdev.config_space();
 
-        // TODO: use the register!() macro for defining PCI configuration space registers once it
-        // has been move out of nova-core.
+        // Some PCI configuration space registers.
+        ::kernel::register! {
+            VENDOR_ID(u16) @ 0x0 {
+                15:0 vendor_id;
+            }
+
+            REVISION_ID(u8) @ 0x8 {
+                7:0 revision_id;
+            }
+
+            BAR(u32)[6] @ 0x10 {
+                31:0 value;
+            }
+        }
+
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read8 rev ID: {:x}\n",
-            config.read8(0x8)
+            REVISION_ID::read(&&config).revision_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read16 vendor ID: {:x}\n",
-            config.read16(0)
+            VENDOR_ID::read(&&config).vendor_id()
         );
 
         dev_info!(
             pdev.as_ref(),
             "pci-testdev config space read32 BAR 0: {:x}\n",
-            config.read32(0x10)
+            BAR::read(&&config, 0).value()
         );
     }
 }

-- 
2.52.0

