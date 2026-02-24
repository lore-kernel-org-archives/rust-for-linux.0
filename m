Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC01A9FBC;
	Tue, 24 Feb 2026 02:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771899946; cv=fail; b=btOM/MbsJOsVG5Q/OMnKPPxjIiaVE6tAQs3hU32hFwyEwfdb9wkEV9zQsql0IPsqRBxaI6ilRrl73sXxrEZvKSkU8HDVEIGL94SehGsuKaUsM7pkd2Yb49OuXYLA29ox9zasvcdAy0MVmkGqBE+mq95gTntZfiwTCKsOyloQhA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771899946; c=relaxed/simple;
	bh=QD+bm7Jx91aJuknV+bYcMlrcXurHOq5VVNb8vhtUrFg=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=r6eRgLJtNNaBlaXR0oEONXf6SiNkBdo1/DOYy9Gw3OkMwYYmra95Zog71126G4MF4Xom9lGCuVwhKAUbShm1hQCEL2UG5nd9NrlVdjeo49wQLPKDGmwNnB/p65i0ARTXoqDD/+At0/92o8Czj03O91HGD88mF37Wlr2sAp69hW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=azaTK7qt; arc=fail smtp.client-ip=52.101.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="azaTK7qt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuDuRMuv9wfsOEhT0MBuzDESw4CdGkaZI70D1lwqWJPkOwXf4YczmsRPTKsYhgFzA6GL5+2ajZn6F5qyCyJm3Nf9vktW+xkIin+fTujMxze+bicibvY+mtnelqMQWgHKUjn82fzOzIjlP94sUrVlbnXR/kmWq5puadXPLG6Tp33GWjWjd4Ldtq4PFSrXSZOkzYi1GHE14/vEh8c3oHOVVTz2AtIvlbnTQbYmb6CHuWqmjKBZDMiN1PVwHq45cXUHO9wSAEgBuCgUfKv/PTKzNvMlbZJ8nB1b0RkU2p8nElOTndZJdUONUMygqeDB1E0wPVaSy7Z5AwstVgwr/oxtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3J+Gpb4tdPL4K+CRAyIacl0XsVIY7lpI3RNrkLYhy8=;
 b=p1DjLzFXbEymys3ZUYQ0lnnmi+G+36QLV+w2kG5W7d7rab/ppYuNNZF3t7E1Yp5IxM/VNSlHr82TYOgz5ol/+g9B+ezgbhNBjOW/+UWiCc5CFZLi7C6y4CHihPMoT3FzKc51vrQ4NcE6Xe0UC+T9yphNxPHrZPcFDTP573xRBV+avvV/+JS8vCQkkW24xSLrzy4+A0JoAkKRcAwT9HUATUWAMWlPdatTD1VuwpACP1mpxUeJpx583MalMbRyn0VvU3KUoa21Ib2tTIDITZixKL9szw4+6jbHSz+enXASoPzKaIorK5XOGSWLLXA8EVv5COUa9lDJAy7t3wvsfk+7lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3J+Gpb4tdPL4K+CRAyIacl0XsVIY7lpI3RNrkLYhy8=;
 b=azaTK7qt9HiH5DzLZVC1NQm24FR13vMMb8BlI6pXV4I6WB7lYUg54/CpLluUolXuw1u+K5MdDnCiNHo3jWEvmjs4/gNp4YuO4/fMLbqB41CtpCM6E1D71CcaAD5VJfYBnUmuIeHSteTDL2aO0y/IG2LW/ePFAkm+ssUw8jS3YjKhE22MPBRJH4TqC90/Kx7od63Cslinex3MTXt2Bu+/PiZB0BdpdYQvurmLM7ucsltvu4c/PUc9ZZ4nKHm0hNlcdLXul9RVrvpHa/OFykRk4gBfkJMN/qdTWOWdkhjhORgsw2zy9nli7fE0/sHHqHewAmRt6/i4BoYRtHsUR3hYtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:25:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:25:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 24 Feb 2026 11:25:34 +0900
Subject: [PATCH] rust: str: make NullTerminatedFormatter public
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBNMo6CrRAvTqQZKY7QIorsnL
 d/i/wcSMmGCXjzAeFGiGArqSoBbbVhQki8GrXSrtG5kOLctI+8UbEY/R95tLpZetc50xjgzOSj
 1wTjT/Z+H8X0/6LbQymkAAAA=
X-Change-ID: 20260224-nullterminatedformatter-d06c3733c3bc
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYXPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:403:a::23) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4425:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3cac2e-102d-4937-ee88-08de734c00af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0NMdG5FTXJHYzI1YWpKL2owcFhMWGd3Lzl4V0ZmUlFVOGZGVTF5VHozakc0?=
 =?utf-8?B?SDZVTjVkdG9NcUtXeUNPZ01LUFEzZ2ZFQzRLcW5pS3NhdXhPcDZ6eURuMjNC?=
 =?utf-8?B?Qk4vYmFmK3VNVUtyR1lBajc0SnFIV3h3WVpVb1UrajV3Sy9ySW5Bbmg2YXNW?=
 =?utf-8?B?dmYrUStIRW9wVFdxelNyYm14Njh3Smo1UXhrL2h6OUxlQkxlbVdaS081MC9w?=
 =?utf-8?B?Ym1zOG95RU9YajVPM0Z0cllzbE9ZSTcxNXF1ekVUUTZ5VGxSOGxJYTI5ajlE?=
 =?utf-8?B?aW9LMmtvdzhwR3VncXduVXlQV1RpdXR3VTh6MGtGTGNCRFVzNncwOE54cHFP?=
 =?utf-8?B?TDlNVFJOeEJaeXhiRDNUeUtJU3QwVWI1ZHBnN2hwSkhPUWNyWmdwUXJuNUo3?=
 =?utf-8?B?czkvNDZZRlhVandUSGhMdFRtbStDNXRuZlBaNmRzZ285N2llM2VvWFdHMnAr?=
 =?utf-8?B?VVdLNXh5c3NNdlQ1TnVubyt0NkdINE42Vi84RHdJTnlGaWlCb2dBcnlkekdV?=
 =?utf-8?B?eGlLUURkS3UvSXNsVlY2a0FaRkh2blNJaWxKbGNXdkt2TTErdTJoRi9oZ01X?=
 =?utf-8?B?NGxvYnB2NnIyWXBHbWFUa1ZQVWxiWDFtQ1ZxNXFPcEZBQjk2RDZkVlNXcXlV?=
 =?utf-8?B?MDFDU1JjaGxhdFlMSjc5eVlTR0czZ29GWWQydW4vL09iUWFtbWpTTThVenI3?=
 =?utf-8?B?VnJJY2tkMUd5eTRYQTFFZkgrb3hSaVVwYk90R1Z1clFYQ3VyRlg1dzJ4UUxv?=
 =?utf-8?B?Tm5aMWcrL3k4Ni9NMWZXUitRZjhmMUZ2eE53THJMSUxkejRYQ3prYVFSUTZX?=
 =?utf-8?B?N01uM2pCcVg1RUc1MkkzcjBuVXZCUjVqVnU3bUNFQWNNejFQTklJR3VIN284?=
 =?utf-8?B?QnFjNVNrT1RVNUxrK2R1b0RFWnBPU3dUcDgwcmduZ3JFMUFSR0dQYk5kYmR3?=
 =?utf-8?B?bG55YjNWdlI1Y0RTZ2ZzK3BaTksvVnU4blJIbXpUaEpqaXBpaXhoa3ArSHZJ?=
 =?utf-8?B?WUF3TGRuRHk5ZHNISU5WakNyZVM2RVlMSzhlSHM1bDl6TS9Bbkg1TzdVNDFT?=
 =?utf-8?B?ZW1XcHNwRFFUSm1ZdStQZC9XVFlEaUxvYVR4UzJma3NybVhlV0FGckN3dlhC?=
 =?utf-8?B?ZXJOcFp1VDJkSi8yTDNyeWh4UVk0ekcyZzFPTStjb2dhbjNTTldtYzdKTHFX?=
 =?utf-8?B?ZlMxK0hwVjRkOFBCWnovdkxZS2RJOVZpWXBqcWxaOEd6NzN0RFllNSsvK0pT?=
 =?utf-8?B?RW45cXYxN0hkSEJ3L3BiRnA4QWliYmNML08wZkd1Q091VlFFS2tGaHdQWU9C?=
 =?utf-8?B?SkRoekpVMHg0ZjRBTjUrTW9NdHUraUdzSktrM2lYOXdISWFZSXA4ZE1YeXhz?=
 =?utf-8?B?UHV6UFFKSFFzV2M4VlB0V0VKRVJuZENsOHFWekw2NVpsU2dNWVdSNTBGd29H?=
 =?utf-8?B?b1V6a3lQUms5eDUvNUZtYWIvcDNrYUF2dUFjZlRDQ2d0eC80UGdCQjdMaGNG?=
 =?utf-8?B?cnRNU1lUUkdPZkp6dWpBaEFNTE9SdzZYS0RnajFjRVY0M3ExSlhaL3RaWDNP?=
 =?utf-8?B?WmtacTdHNEh6clJwVWNqemcxSjExQmlXOVJOR3RtdTBaMHpHZVFsaHl3SjNH?=
 =?utf-8?B?YzhpS3lzbXVSWDFLL0pZekUwNzViMmNldzY2bVVCY1ZXZVBIcFM2dWczZmtU?=
 =?utf-8?B?TTdpL0xRZ2J2blhvcU5iL05IYjk5UFM3ZUJ0dTFOQjMzVnk1WldEVCtRREkr?=
 =?utf-8?B?WTRMWXduVVcyKzJ1Lzk1MmthTXBHekJsZU5GeUhqaUI4MHc5eGJaYW9BbHBN?=
 =?utf-8?B?ejJvZjRYYmhLcUtNZDNNZWdRVG5LOFVHcXVnVTdaUmNJSDdBcElZdnRzRStx?=
 =?utf-8?B?Q3BEcW9ScjdvM2FYK2JNMnNIUm9wOGtXT0FsN2IzRUZVZGlhUjhIcWhSa2hV?=
 =?utf-8?B?OU1WZE9KMld4dmNHYms0NmVCc2ZPZTdOYTNZaUdhd2N5a2VpUTdoeGNSYU82?=
 =?utf-8?B?Y0ZDSXBlbEZjTDU1cWRib3M4R3hndERONG1MMzgwNXREekpiMDdrb28ycDBD?=
 =?utf-8?B?OWp3eEpYM2RDMGlWbWZLelhTTUE1MUxFOFZlK0k5bHRvTU5nUGdoRVlKWHRq?=
 =?utf-8?B?L2VmZzNvZzU0cDNaQTJlWkgwSkIzbC9iN2FNVVRqYTBRTllnK20zVFhzZzYw?=
 =?utf-8?B?MFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk1JeHBlZ0FJYURHSkNxNUdrTkJvM2V5VnZ0cEM5NmFZTkVyM1pWcWU4VkZS?=
 =?utf-8?B?M3ZBbFBXU2RVM2loUTQ5L2hIT1ZjOWJtcFQrWCtNNjVTd25oL2VWdVJHZ1d3?=
 =?utf-8?B?NC9kVGYwVmJUZy9RY2ptOGM4U3kxQkZ5UGFueVdmelFPaCt4N0R2andieWMv?=
 =?utf-8?B?dXB4QjlDRE5ZdDhuYWVQQTVCUHlJSVJOYU95QjVOdDlyZlhqcFJrQlFUeUxT?=
 =?utf-8?B?SU5MTlhzQkd2TFN3UjJ5SzFnUFJOcjdVMDBvckNMNGtHNTFoRGtSUjNlSmdi?=
 =?utf-8?B?QkJiWStTMC9VcUtqYmt1QVkwbytRa3pKbEhDeU9ISjJZNDgrOGxReWNZN0Yy?=
 =?utf-8?B?R2s1S3hibm1JaTRSeHhrbXRuWjBvREhjVDZoajd3M1M0a3BibzlRazVpSkdu?=
 =?utf-8?B?aDJqRDYzZ3dVMDJwbEMwQkgrOEVmb0Nvd0tJbU1RR1ZEZk1oYWJyVjZsYjFv?=
 =?utf-8?B?NlFGbWE1UFpTbGxHVUx4dU5mU1NXanFNNHZzamdkVkFqVmhjdUFicXViR1dr?=
 =?utf-8?B?WGN4K0JSc2MyZTF2dkxWTXJoYWhvNllhRXp5dUk2MmlNOXRYNEpSUGdCOFlN?=
 =?utf-8?B?V0N0RUowd3NZZGZPT1F4MzFkOThpWDhUR2RiSmEzaG16U2tpSnlIWnlqZFpq?=
 =?utf-8?B?VmJOYzg5dkZyYnVacW5OaVBtVEQyTlBaMDM3QXA2QTN6aW1LaWN6YlR3MWNU?=
 =?utf-8?B?ZUVrcjdkRFNBOUszbXczUjRRT2hGZzRBbitBbkJYK2NZVU4xeEtmUHlxck4v?=
 =?utf-8?B?N0dlb0V1dDdBQWtuY0NScUZnQzR1dUlrZ0hWRmhwNkMweC9icVp1WUdHdVBR?=
 =?utf-8?B?Mlc4REVQVmxaeTFGZUFEVldRZ2ZmSUJTTTA5dnNpa0FyY2NIUTJoLzhyS1hn?=
 =?utf-8?B?bFZReXRDMEhGNmxwTHdLSnRiTU55QWZKVVZ6dkRFNFNXZzNqamQzdmtMNFRO?=
 =?utf-8?B?TGJaVTJwd2IvTmU1RmhMQ0VXZGZKYzRGeTNLNDFXb0duT25GSng5T1JwbkFD?=
 =?utf-8?B?ZnNjV1hRSUdNV0M1UXp3eWExVjZYMEZHbWdQRzM5VDlJMWlOU0k2WlpmZ2dk?=
 =?utf-8?B?WFYzUEZkRVp4Z3prdGR0VC8vVm5nRVNwdlZhN3hRQ09yUlc0UGVuM1RSVGtK?=
 =?utf-8?B?WVFrK3ExYWRmbU1Ha2NwZnZSdVhUdHZ3QkhOVjN3NlFGL3NnV1o2YXpzcFFm?=
 =?utf-8?B?N1R2S3prQWdvbFR4NVB4WU1LZHFubFROcTZ1eWFQbURVbGFKZkwwYmc0VzM4?=
 =?utf-8?B?NUxBZnl3UEdTbWxCSDFsd2FiU1dTMFZWRU5wVFZzNU5qdmZnMEt6em03aVVq?=
 =?utf-8?B?Uk5XanVpK1BpV3Q0YVpTa0N1ZDd4QzhtVWhSdEdyV2NNbWxFNFdDdVdUVHhE?=
 =?utf-8?B?WGJOY3FmOUtrdUhlUGthYW1HN285Q04xS2xuVCtYMlMzTHJRZjMrQ0s5Rk5m?=
 =?utf-8?B?UDlwZGZRWkhaSkQzanpyNHpUdG81RzRZMm9iVHdRS0EyNmJUcEwwaTlXQmVT?=
 =?utf-8?B?RWhiancxbno5TDdKV0lmS3k1MHhacEYvdkdJU01YQ3BCbVUrQ1BxbUZpWHMy?=
 =?utf-8?B?VGd4VnhyREZ6Y05SYmVaRVZVSG9QNGNMMWhHbmN6aUJkU09TVitLOTg3dWho?=
 =?utf-8?B?NVVlV0wrMXdBNXJZd1lMejkrRlpnWkVRbUcwK1RMRHA2TjdqTkRKUzNiRUhr?=
 =?utf-8?B?enMwd2puTkRWSWc1dSt3QjVlLzFqTGhmdTRnRXBVbUd6MHVqMDRKZWpTY2Vt?=
 =?utf-8?B?ZU9zQktHNElSRWNiOWI3TzlwR1ZsRTFtTHFHdm5mNHlydnA2RThCME5ScEsx?=
 =?utf-8?B?UTRwQi80OUJZbWlDdlJQVHhSWlBrc3pXZk1NaWIraWo1OUU0MDJMcnN5SGE5?=
 =?utf-8?B?REJmRFBwQlFOK1FUZHlkOTl4MlV6SGdvcHFMWWhHeDdjNmhDVGlpRlg1cWFq?=
 =?utf-8?B?WVpabi9BakVhV1diT3hmSGhlQmpoeXBFeWlXekU3UzhYNStJcGNYWEtBMnNJ?=
 =?utf-8?B?Z21BN1R5dG5OemZqVHpFRm9tZXJCUjVYdkVRLys2WnNKeDh6N3pOOElxZEF3?=
 =?utf-8?B?QTJzUWNjZ1l3djFIVm5JSDVtV2lTWjFlNVIzSTRyb0tsNjB3VHl2Q3dOTTJh?=
 =?utf-8?B?RjZTTStwTWY5YTFKOHpEYzFSUW1qa1FyejJxd0xvTnpzcmNjR1lIZWwzUVZE?=
 =?utf-8?B?ajdrVUFheXFRd0R3NmxzSkgrUklBdkJ5QU56NTZoSjFBRndUaCtEODI3Q1Bs?=
 =?utf-8?B?aHF2MTEzcjRULzlMcUVmTFFJd2RHR09JbDY4a2VQVmJoUlM3Zm9JcHNsWUVD?=
 =?utf-8?B?TFpNYXRyS05yNmlGT3crVU5yMkZPeDkyUHhqWjNJdWo1emFpZUR6b2w5WW5a?=
 =?utf-8?Q?HHkLphZnSZp8C68a0jmsbqsriponEVTv9Dq+DqZipY3oo?=
X-MS-Exchange-AntiSpam-MessageData-1: yOLvFZbswm3Emg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3cac2e-102d-4937-ee88-08de734c00af
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:25:40.3605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YicHBahBgoAekV8bXaIkBrEzJ/xXeEDDk+nbR+suGJYGtXzkY2m6Nq9uqpDhPr8y9BoIRZXtaDWTphxVQWR4ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425

If `CONFIG_BLOCK` is disabled, the following warnings are displayed
during build:

  warning: struct `NullTerminatedFormatter` is never constructed
    --> ../rust/kernel/str.rs:667:19
      |
  667 | pub(crate) struct NullTerminatedFormatter<'a> {
      |                   ^^^^^^^^^^^^^^^^^^^^^^^
      |
      = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default

  warning: associated function `new` is never used
    --> ../rust/kernel/str.rs:673:19
      |
  671 | impl<'a> NullTerminatedFormatter<'a> {
      | ------------------------------------ associated function in this implementation
  672 |     /// Create a new [`Self`] instance.
  673 |     pub(crate) fn new(buffer: &'a mut [u8]) -> Option<NullTerminatedFormatter<'a>> {

Fix them by making `NullTerminatedFormatter` public, as it could be
useful for drivers anyway.

Fixes: cdde7a1951ff ("rust: str: introduce `NullTerminatedFormatter`")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/str.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index fa87779d2253..3f8918764640 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -664,13 +664,13 @@ fn write_str(&mut self, s: &str) -> fmt::Result {
 ///
 /// * The first byte of `buffer` is always zero.
 /// * The length of `buffer` is at least 1.
-pub(crate) struct NullTerminatedFormatter<'a> {
+pub struct NullTerminatedFormatter<'a> {
     buffer: &'a mut [u8],
 }
 
 impl<'a> NullTerminatedFormatter<'a> {
     /// Create a new [`Self`] instance.
-    pub(crate) fn new(buffer: &'a mut [u8]) -> Option<NullTerminatedFormatter<'a>> {
+    pub fn new(buffer: &'a mut [u8]) -> Option<NullTerminatedFormatter<'a>> {
         *(buffer.first_mut()?) = 0;
 
         // INVARIANT:

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-nullterminatedformatter-d06c3733c3bc

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

