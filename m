Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742139B4AF;
	Tue, 24 Feb 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942947; cv=fail; b=LzhTjkJaU9KuK1LMDvAkSnKyRiDAkfoLVhyOLoVndBpTj9MNdsb5e70IjlYQGkyHrz31FAT7hdmcfgO2o8wY8w0C1250y2cFWcHSU5JHk50W69+xE27IsoR/tZCMgcR2eYYpv3chOlhkCwNDr7v1xiYtcsxSMfj3WbEcikdoP5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942947; c=relaxed/simple;
	bh=/6FS+f9LJD+ykvstPp/esTg5M/Vi2gdGcPdIKyp7zQM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hsOMIzaBwQCswxrFpdi3LiW4mP93uuslPpRcffziqeYBbZnUWgo4pr7Mi2J29gqk6u25TIGxF0ou1bDK+5Od4uDC0Yb27mwRmWep5BYMR9MDa4zdIiSosXegkL4uYqytvSFtIZlJJi3lvJJxzg6wv7ESIv8dIb0fuE+FhV/v39k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pPcGiS1C; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pPcGiS1C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jR5Thc3wYtjjN7emRdDvogPbgFFLzhMvZ4iTmM9LdcYYT2y1ZfzQyyp4GguQkC6odjsYZiCew0v/aNBc9IrNWQzUdRJG0TjmatN5D6QwL8HEkOc07DqlxpqnfkYtfCWj+rn/PS5kwg9ouUvPrhNz4hfswXo7o+IlT4abWlv1jN/krb+jxyEMRfE0FRSX5+bHiTtv/+zpalDVIpTERX4Buz3yny+pf5VSXA4TPHy+/i/0rKiZtzWl8PAP2znsWMu9/ROMlVXNGsW4whX/Jl8kgrFXzFLz/Ea1C242cQwUg8H7imPa6YiAZ7LSCBQ++IRacbhuFB7gyTGe9kB3TN4KZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEpzwvMsTGgwfIdOlMnm44rPFMDaT7DWwdb2Pr12dRM=;
 b=kjY5Fyfb0yMG+Q07rE4SzUZBBFY5gAPU6XIS+vn2hnOGIDE6Talrpc+GDL6Bg1VskHMf16zKtKqTXMY9bQ/EKh2OnYV95m8II0ixXHCDuOGzMfWtxXARU7Dl/AP4WTUQxcwMjBtsWd3CNnUQU9VA1gE9YstbGcciCfKByOydgObOVBfKTzHJ82lH0Iq3OrtE95ZU4GLdiP+4SKiVW7f9I7FkHemlGeaBrawpori+jLRXEDEbAgKdq3z/UK7duj0auMDg2409qtjW5HTin41vxeJOgfd3Wx5iK0Dkza0aHPKvcIGEQZ6LKlcrlP+9b3XQ9CWceGI72qq3S8Wo+vARtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEpzwvMsTGgwfIdOlMnm44rPFMDaT7DWwdb2Pr12dRM=;
 b=pPcGiS1C4oemOBEV9h22xp/chEi/cXBwzxVk4/Z8+ZrthcdkcbljrxPeT2Re4P3/QzmUD1eXLHEWj0mdDcdoWDECC1xQKVQo+xMW4R6Is/zlbVidaNJGIC8Bg7A+8sNKJXa3W+NwXUL1zAbw0XCUIerwH0l67pm6j/d2dBSu7ioohQcLJswz4096c4Hm6vpK8aVbkXlhVTGDyM5aR0wPUisuc8cKXREWUVcjdzaIKbFYUvZX7vAs9UHLHBNTGibmAu65t8qkoufvbzZFwVqENW/y4HFKcXmUH/QvmQFt3bfj7vB+ZfDPxlcFkSd+aH3MciP6g11gAe9adrg+DYQBJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:22:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:22:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 23:21:42 +0900
Subject: [PATCH v7 04/10] rust: num: make Bounded::get const
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-register-v7-4-aad44f760f33@nvidia.com>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 881027da-824a-499d-f40c-08de73b02066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFB6d291blFGbkhpajk3d3ZQeXlDcHJsMzNxQWEyQmhXK3FPZHNlM1hZNEtC?=
 =?utf-8?B?a3hSMXk3a1hzeUFSSlVlM0g0b3BuSVZoZ0FMNFdQcWlWRDJCM2dDakpGb2Zr?=
 =?utf-8?B?RTNEamQ3UDgyZU9YaUk1YklhdnFRcnlyMVd0aWt2UEJyYVBNQ0t5eTZNd0hN?=
 =?utf-8?B?NU9tb3NGUnhWdE5UekI4anl4OHVwWnpDdDc2U29kSGhXKytBOStERzhsV3pX?=
 =?utf-8?B?aUtDdUlzbFJlTThJUllxNDFMVlU5VHF0WVJpNEQ5WlhIcTUxM3phM3RGcEhB?=
 =?utf-8?B?MUh5Y0ovc1VBTXd5RHNJY2RhSm5Demlmd0lYQmVibzNIamphVGVkTUVHcTFi?=
 =?utf-8?B?aEhmei9SNldXS3MvVFZwMlJSWWVETm5SVXB0Z1hjR0JCVUdSVWZYS0hva0tm?=
 =?utf-8?B?ZnFyVW5GTnBPbTFDb1NPdFAycWNtZHR3VlRRTGJjWStiKzRTSERYK0MySU9y?=
 =?utf-8?B?SzlVazkwdDlLSi9nQjVXT3F2OEdkUXFiSmt2V1JxZ0RsaTJOcGd0ZzZWYzRl?=
 =?utf-8?B?SjFEMkR4NDZ6YkRNcDA4dTNtdkhsZytKYU03K1hHTTNDWTNLVkxnOWFHNFV4?=
 =?utf-8?B?ZnpmbDNUa3BFRWJmamJwVktYOEZZS0NKaFBmUEJodmZXd1ZienhxTHVCZk5X?=
 =?utf-8?B?U3J3ZFN0MDlzOGpDb2RldWU3Nmw2YWtaWFlRM0tNNmFGSlV5NEVkYlZZcTBl?=
 =?utf-8?B?SlNOVzVYMTNVbnFLK2FMRVRKN1p4TUFoZTBFNnNpWkNQQzZTVUFhdHZ1SUh0?=
 =?utf-8?B?Q3BDM1FkMTBKbUM3OW5YWkN3a1NJR1dTT01qdmVDL3F3REVkWEtBSG1nZnNv?=
 =?utf-8?B?YWQrdks0cUtHclRBQjR3MjNBblZVVkZBeFEvM0tJcmplYmRFRVRmdWNDM1NC?=
 =?utf-8?B?RlQvNU5TNGJTY1lWUjJURGhLT0Y1czl1WEFnZWFiTlZKUVA5OUxUdEpoODJD?=
 =?utf-8?B?WHlMdzRoeWlUN1NPTFExSWhVTUlScXNlTCtoS2FFV0FqNEJ4MFBUaWtYTkwy?=
 =?utf-8?B?Z1ZVdzR1MEx4UnRWSVBrVVRwQVNrRkR2K2tHL3ZvNWJjQnhCQmhQR01VWlhm?=
 =?utf-8?B?SDdyZGx3WGQ0bC9SdCtER1A4U0xCVlAyQytzT0RacnBjeDY2ZEtlbzMwbXho?=
 =?utf-8?B?LzNQdjlLc0tLZVkzQkh4WU1venZ3VllzVmpvdVpQSmhEUG1wTjJUNm5MVGcx?=
 =?utf-8?B?WUNHalZWY09VUDl5N0JranZUQ3Y4NGszM1UxTkdYTVVaSmxTWXB6Z29NcmJv?=
 =?utf-8?B?VFZ0K2RkdUlxUUNoWnowSkNRSFhyWFBVU1VOalF1NkF4QVJiTEpLNDdBczN6?=
 =?utf-8?B?N1lWb2duM3VTeFZlbFpvKzNkSVFidzdIbkZlVDBaVjcrL2JkNkN2QXN6eFBl?=
 =?utf-8?B?V0xjdzEwOUFpQTRXSTIvV2w4eStOOVI0cWhLNnBnbm1iTEFPM0JLZVB5MHcw?=
 =?utf-8?B?M0ZUWjVtNXJzbnZwRmQxZ3Y5WXJKL2ZvS1pKTDN6NTlwQVRXRkRBbWdEUlVN?=
 =?utf-8?B?OFd6MVRPUW9zbmQ4dndyUDYyMFBNL2psWitGNGFEOGp3bWFOUHphT1pJMVdv?=
 =?utf-8?B?YWx0WWIyQTYwU3dMTDUvNmhncjF4YWFBckZ2UUdxRWNlUURETFJHNk9UTnh0?=
 =?utf-8?B?eldMeFpCZVlWa05xZWVjQ1pCd2ZyWitRK09ZRXlvc2ViaTlzcEY3WDl6VDRW?=
 =?utf-8?B?RzYrSWFmZllzZVZEWEFvUjVuVzcyZkZGREJLSGd4Skd5d240TzZ6dTdVQVha?=
 =?utf-8?B?aGpyOWJnc29ZVmF0K0x0T25aYjdqNkU3dnR6NFVIRFRuTEhvTzBKRzhtUXZz?=
 =?utf-8?B?SXpDSnlFWXFOY2xvd0RJam1aNUl2T216cW1pUXdGK1FQMzh4ME5OcGpIL2J6?=
 =?utf-8?B?dFNjZnVjSENKYWhxOGFKejJ2emFoWUJBRzdnSWllajg5UGphTlZLRTVXN3VX?=
 =?utf-8?B?dmNnaEM4MElkcDFtM3Q5c0RPVWN3djNqYVNOQ1k0RnJoTnVLcVlyU0lvR1Bn?=
 =?utf-8?B?Q3ZoMStXblB0dVYrd2Z2NUVyVld4RkhVWFlWYXBDa1NyQkcyVHZRaUZkcCtU?=
 =?utf-8?B?Ynk3UE5YSXk0OC9DVTkyTjVuelNMVmJ1b3FIWU5sT3VaZGRVeWdrQW1hbUF3?=
 =?utf-8?B?eURLd3RlTVZFR3didUJHU2I3VlM0RlpQM3lLbW1yNEVRckVxTkpFcTZrQUhC?=
 =?utf-8?B?WWc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFExNnFvYkNkQ21UOXhrQnRnV2R0d0FZcXRkMG5TWWx3eEpaRkNrODlJR3U2?=
 =?utf-8?B?ZnFiOTBCMk9JSUkvdnJTc1lhVlFlQ3c2cEFLMmg3WG1rMUdEU1hGRkRPKzRJ?=
 =?utf-8?B?Tm9Va0lXNTc5ZVhPQUZkODRMNnBXdndPOWVQR2xlUEFEMi9ZV296YlMvT3FI?=
 =?utf-8?B?WEtkRnNiYktQSWdmbDFCYWpsd3RSeWVnc1RmejJRYjdUY3d0bThON1NIbWli?=
 =?utf-8?B?WnJBNDk5SkM0OTA3eExEL05zS2JYcjBVUS9TdkQ2WWZaTnhCYlFBaUtudnFT?=
 =?utf-8?B?bFVPYkhLZFBnN20wcFFIWnFHbmJBbUF2cGRmQkRJZDlNVXVrTUdGRGpvUWpz?=
 =?utf-8?B?SVpKN0NYa2drL0tReGNYTk5FZFF2TXNFbU1PdHFKVTYzYWkzUzREdjhVMXN1?=
 =?utf-8?B?eTFYTkVyTjhUbi9LVVc3UmpHRk1Qay9Wak9oUHE2ZmF1cUE4TmlGcHNldnpE?=
 =?utf-8?B?anY4UWxvc0ZxRXJ2NGZDSS81NDdjb1k0Z2xveXRNREh3Y0p2dUVqai9rbE5H?=
 =?utf-8?B?VkhnNFRTUDBkNzJ5UktrUlpiNG1qYnBqRXRMOUsrWXpTZ1dtYUZnWkNLWGxj?=
 =?utf-8?B?bHcrRTRpc1VRVnkzU09KUk9HTzZZVUs3QmNLcCs0MStWK1VqK0k3TURSWi9l?=
 =?utf-8?B?cm5oK25oVUdoYTRhWWk2Q01CQXUwTjUzK0JrZkZIVkQwTHc5ZWlVSjluWFp3?=
 =?utf-8?B?aEZkOHZydk9PdHczM0FRbkwrWllEcXg2Mkt5MU5KUDkwb2RLWWlrY2E4ZDUx?=
 =?utf-8?B?VmpVVWtEaEVjWXFhUm44cWVyWnZpVHU4eGM2QXladzkrSjJIY2ltWTY5aVlJ?=
 =?utf-8?B?VENlekVkdG1mdzBCMHZjUlVTU2taUkRiR2RCK3hnRXVqMFhpcmpPeGdjRDRy?=
 =?utf-8?B?RzByaFRKZCsrbWlSQmd1cHFqU2w0S29LSzQycnA1aXB6MmlvUUNBbjFqMXF6?=
 =?utf-8?B?WjhocnJxQzM3UWEzbVlLVDRyemVNRGF5L3NkQUY5Vy8zaHdzaFZnbU94NkVX?=
 =?utf-8?B?UkQrUmZXMlZMenRjVS8rSHJPUS9ZYm0rd1dVTDBjL09MajZtUklkalgyNVJK?=
 =?utf-8?B?ZGlmNVlvb0ozYkladkp1MWtpSE9PMTVGODB6Z3hSQTFnejE2MWhqcnJlMU5S?=
 =?utf-8?B?bno4QkxyWkJ1amlRU2t2VVdOaVJrcjRLV2ZsSUxTZmRkTDExRElhdXZ3ZVMz?=
 =?utf-8?B?VEZMeDA1T1l3cE9TZlhocndrc1d2U2p5Y2JmT09NVis5bng2QUk1NmJWVC8w?=
 =?utf-8?B?cndXL1V5WjJNQnk1bXFOd1ZsWnJRVlM4a2g2V1FVL0l4blJCZ2N4N3dXYTc0?=
 =?utf-8?B?V3QyeXlyUUdlUDVmYWlFRXo5YTQ5UkhnMk0rYWpzWU9MRnpRNW1OSXk3NEtm?=
 =?utf-8?B?NXhxejBvaDYzK0lEdFY1UWVaMm9aeWhiM1ZZK0g5cXJsRkNEeU5rRzhBQytm?=
 =?utf-8?B?N2QyS0daMVBWa0dkN0dIaTNPQlI1QXMwWjhneUkxWDV6SlpPaUFybmRWZUZX?=
 =?utf-8?B?Tm5zUE9QTVFsOHFFZ1ViOFRBcnJNZmVMdHFxa01qdGtsTU8vQ1dSSFFiRkJh?=
 =?utf-8?B?S1ZxcHZSck80YWg5S1NGQWVOUkhvY2diVjh0NWREM05Db1BFcWhUa3RuZ2ND?=
 =?utf-8?B?ZzROeG5LQUJuUmtoUjFlSmJNYyt2cjh3Tmh3Tjg0aHh5VHk4WTVWKzNCNHdN?=
 =?utf-8?B?dG9OUDdWZDZoVnF0bytwdlhtM0lyY2p2Rnh2TUhEcytHT2huSXBYMjEwcUk1?=
 =?utf-8?B?VnQ2eEQwbkJUL0N0ODdMWFp5M1NibmpsWEpvTkduNnZnL2xTUU0zRUhTM1Fl?=
 =?utf-8?B?QkcvVndOK3FRVFFFMU9PVE9SbUM1YnZEaEZRUzNnREpkaW1UMkdaRGpLbEVa?=
 =?utf-8?B?enBIVkhkZmczQkVTdVhiK05IeXpBNnZOenhYL2krK2paUTVJQTBRQUViclQ2?=
 =?utf-8?B?eStzcVhnZHJpelYvUkYzQTlWUk1wK01kMk5VQWJ4OXRoSVBlMitvbnJUVS81?=
 =?utf-8?B?Yy9Ca1NFdTNkUWZWNlQvK1U1bHFJNEV1WHh4S2p6RTFvZGhkOEhad0gvMmZ5?=
 =?utf-8?B?b1ZGcjhURXFSeTM2RU5TQmp6TTBsMDV6NDJmWDhQaDBPb0JDZVFNbWFFaW5s?=
 =?utf-8?B?MzE4Tmg1YllJc0pUQW94NnE3MWs4eCttYTlHdHpESXZQeWw5aTZidzJPRHg4?=
 =?utf-8?B?cWh6YUlNRHcwSEgrK2lhamxvZ3MzWWlaYUN3N2k2U1VYYzU4c2ZBdXkxSEVU?=
 =?utf-8?B?ZVh1WjBCY0paS2VtSmlLR3hiSGFpcmhwb0wwakcxRC9tUHhHUDRNTlJYNmhk?=
 =?utf-8?B?YkEyUXVwdmszeitVOWV0MXdZYmtEcXBUalUvaWxxelNpdjZzVTlTekNsdk9a?=
 =?utf-8?Q?Vqk4Hmznk9x80JvgIer0phjKWnvC0CAK+T8Dn7Sc7k6ak?=
X-MS-Exchange-AntiSpam-MessageData-1: SHx7bYcumlAPFQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881027da-824a-499d-f40c-08de73b02066
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:22:22.9632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp7EMsod7v8jTLYE+Jy5PyXS/loB8HXGaSGk5DYvISJqmVIktVPkfA+41RIYKeOlGelo0tv+9+1ms5lGDiCGQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

There is a need to access the inner value of a `Bounded` in const
context, notably for bitfields and registers. Remove the invariant check
of `Bounded::get`, which allows us to make it const.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num/bounded.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index d28d118abd8e..bbab6bbcb315 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -379,6 +379,9 @@ pub fn from_expr(expr: T) -> Self {
 
     /// Returns the wrapped value as the backing type.
     ///
+    /// This is similar to the [`Deref`] implementation, but doesn't enforce the size invariant of
+    /// the [`Bounded`], which might produce slightly less optimal code.
+    ///
     /// # Examples
     ///
     /// ```
@@ -387,8 +390,8 @@ pub fn from_expr(expr: T) -> Self {
     /// let v = Bounded::<u32, 4>::new::<7>();
     /// assert_eq!(v.get(), 7u32);
     /// ```
-    pub fn get(self) -> T {
-        *self.deref()
+    pub const fn get(self) -> T {
+        self.0
     }
 
     /// Increases the number of bits usable for `self`.

-- 
2.53.0

