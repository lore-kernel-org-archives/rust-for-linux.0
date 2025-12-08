Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84D315793;
	Mon,  8 Dec 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765187701; cv=fail; b=DTmE9pT8pjSN5xYYmkPWVxHS2UuoH7yiDSs8hYnlp4PpWXwKLqAI4v0jO4F75pXEVK/uF/bpywIuZyFtu0gELYt3FszxUNRVZfXtPB0K2NFnBi6zDkBFRQWVEmJ8ENtqDDJypOCxf1FX6bM807xd3gL0NRzhcA5QsKQV0WXUh+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765187701; c=relaxed/simple;
	bh=ks468wVbDOFUa/MWBUYCYVwyEBNPmE35a14wx7zLnAg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=isKxjJdO1EsQcdOTmBDUdSEbXY3BdQ0dTjkaLhDXCtOgPAfWGKLfw5xt4KHCJQ9VDpJf4cyDar0Ch65beunk8o9+xvQ5RUrrnpFn8MmGqq9FsT0eoTo/IgJbQkPodl1/ftpfz8hhNLnlhhddB9+HNkfgWY8/WDe9feXEWFSXmtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OEVGKCon; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OEVGKCon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBQoYJ47aSmge7WdcajmxFptKl951ZV2hn7SIIgY4NEB2LZd9i1r2T5upRqmU01zKL3LMkNYg/mHJvOJKwb1WFzWCIjFw7jS53KO5+47TWBYaxIdkT5s75CDM7MSwiEXL3j1CiDn3l80K3scDm9ednrgSjYbvvD19RcbQOKiAG5wuwcb3PqFY7cyEHOwVti2fIOWcI1VjkbNGVJkXk7mQcxmFNxB9Pd4DstbZJvLbjJkVhIM5gTskfljSpwCRX1BJh0kSLb6z6Rgh9UzmoBy4NhAFeEghqiExXO74kIe2ioeftweDUGgx3Z3ZAi6t9FGw5/TH618Fz/W/A3lk2rKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hb5bYIVnBODSq8ka/f3JblZnnhmtLKiCk/8nXbm7usc=;
 b=p3TH2ynmRD+z+95INPKCw+1xkrSN0VHLWwwz6noV9F4KZHHRxFGyzAvqqceyDL3FfE8/O7cCWXHyZWD79QaPn1wKUyJOtpAg3EzQ0jsxSOeBxXJEhZ/C8WHu4Gs7I5O30FeLu6dXKGP6WNf4rtyjJ6G27y8s+bb/v6CtmKRCNpTYj/xplgE9dWS+KUtfC9Oq9fLevN1+U4QTlcYWhzy/zKV6uMJG6r9DjiSPFp1hUk5xJsps1jfj7H3epJwg/B+DNmkvuPkC2dRSZzWttKyLRzZS12MB0D1Xcy3h1CYehLrxUVkTJHIZzZ/lFiQS3+C2k8cVFiyISAgtWfKlGyxzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hb5bYIVnBODSq8ka/f3JblZnnhmtLKiCk/8nXbm7usc=;
 b=OEVGKCon1iOmnp0Su8caD47ijgWV0qOW17xcSLGeRd5SNUoclAimGI9Vyhc5k6v66EfO3JWw36utjlLFf2jwG74HCUn2FSdKR4vyLhNIk49GFIByXfUE1t3zGPrFnbKKFyDYKZ+7T/ZcWxaUS8yC4xNgbco3mJl8Zj3SnPZo74vVYIxmrUHSMP2nDak6y/loiSxkHfd+qXg9HcUZZm2P4w84YaAnOysQ/R9EcvtPKrqrSmq18qsjOtIxCGQ0kudPnF4CsqW6GaYsaxOCdcOWNMNvHOpR01rvVRTscLzfONYJ/NPnbbrwtwmg1VyYU3xPsR4t3WsG9NTg5QHCUhpLYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:54:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:54:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:54:40 +0900
Subject: [PATCH v2 1/2] rust: transmute: implement FromBytes and AsBytes
 for ()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-transmute_unit-v2-1-aa17a6848afb@nvidia.com>
References: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
In-Reply-To: <20251208-transmute_unit-v2-0-aa17a6848afb@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0117.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bae11d1-edd3-4e10-7c12-08de363fd837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZvbkJsNUY4RUFKUzdEck1EWUF0RjJiZjZvWkxSYmlRNmhwNnhIOXlWQVdW?=
 =?utf-8?B?bFVZM3Nud3JndjVoQzBqalRWVFlNaWVMNmtEOHFTR1JGTjMwUmUyTk1PUWtG?=
 =?utf-8?B?NEVYY0ttTktieWJDbVRMM1NkT1NiMGl3SWFsM09DNlRscHBBSnpVekJzWk02?=
 =?utf-8?B?Q2ZYdkdYTzJoYVpQSUdRZjk5VGZ1alAza3dmS2ZXaEViTU5UbkJEaHNLT2tI?=
 =?utf-8?B?Ky9IZWFpTWZoKzROazQ4V1RPeFAwVm42cFpnSHducFprR01uK21lUDkyL2FQ?=
 =?utf-8?B?NWJmSlo1TGJoYVFzU1h6SUJLbnR5aFNFMngrN0FmNFkwQnRaRWRCM2xQMlhh?=
 =?utf-8?B?eSt6akxUbkJuZy9KS3pmY21TREVRZzE3cDk0NXBZVlFXNWxueWZXNmdycUQz?=
 =?utf-8?B?blRWam1qc3d2bEh1eTFnRGFrOUcxVW1uZDZoL0czZ0FhUFZhS1loOTB3RVNy?=
 =?utf-8?B?L2Q0ZU1GMTcvV0ZiMTR1M0lDYndubm1XQzVOd1J6OGxhYzdWcVI0cURYQ1Jz?=
 =?utf-8?B?MXNuVU1zR0Y3S0hNRnBYYzVDUlZ0a2YzOWJqcmY5QXNacEc3RVhHS2hTU3dl?=
 =?utf-8?B?UGNzRFFZMDA5eEdlaVdmNUxUMGh6VVlrYUNqdzloU3lUS0p2cXRrK0ZMSFAz?=
 =?utf-8?B?Zlo2TlQwTytYWnhyOWt4eW8zdmRaRnBUL3hFeW9vR08rRTI5dzdMYUJrTkh4?=
 =?utf-8?B?aXJQSC9yRnd2aVVDMWJvQkl1WUUvbk1oaHVrUUJudjBsSUNLZkhCNzFpUVBx?=
 =?utf-8?B?VFY2YmJPczdXbjBiK1BVUGhCbVhZMEM0NzFFVnJXTmk4eWc2VENML0FTTDhV?=
 =?utf-8?B?UVNPK1BIRGxnbkNaejQ1R1FWRFNtcDM0TEd3YmZ2RitmSjYreE5vQXM4a25j?=
 =?utf-8?B?cUQyWTB1V21tQzlldmYwNVdiRE1hbk50WGpWNGVVOHB0cDZtN3JXZkg3bFVU?=
 =?utf-8?B?SUhKWDVhQWFSNGN3bzBzdituYTcrSkhWYUV0bGZNV0J0dmVISzVFeURPYUhV?=
 =?utf-8?B?REpzS0dudlY1OFFuUU11Zjd4STlRVkpZY1N3WGkzdFcvQkRqc3FpOWRmaENE?=
 =?utf-8?B?bFYzbnRKV1B2N045SlBZZ0Exa0ZWNmRwSXNyamJyODFFRGVRVHhheCsxUlhu?=
 =?utf-8?B?cDJISk9ldDFsL29JOHVuWEVZd2FPWEU0RzB6SGZIK1E2czlLRTBoenR6dEVC?=
 =?utf-8?B?OEduZ2RLY1FaRFM4dVFrdGYwOXlsUFdnQURSemYyT0V2L1MxY2xUbE92endX?=
 =?utf-8?B?WG5TbU9VU2ppd0trYk1WdUl5TWxIS0RWSXlyUmFYRG5KRW5QUzNGdStLWjNZ?=
 =?utf-8?B?bjlieTdMRGp3dlRNNHNEdHo1ZVpqR29xTzdrSDlXMVF4RGs1TFhiN013Ym4w?=
 =?utf-8?B?dUhneUJYR09qaVUwVGlJd2pKRVhLd2lFU0FSdUk0YjFBZjRKWjcvRFJFNkE2?=
 =?utf-8?B?VTBMQjV1NTV5WlFWRWw5NmErVFo1ek4rQXlTK016cWFzWk0rOHBRdkowdDNY?=
 =?utf-8?B?L1Q2cjlIcHFSTXl6Z1MvU3ZyQ283S0ZvUFg3TDVGZnZCTnhqYkRDVjBtQVdI?=
 =?utf-8?B?Qk4xUGtuZlNhZHZna3ArSEJnTVd0Uko1TEJDNTVra0xTQjNKdlg2cW5haEtN?=
 =?utf-8?B?ejZsQVRVUkFIM3NUMGRRN0hMaTBNSnlGVXZ2NjNDcVlKSjZJUC9uTGpPU25Z?=
 =?utf-8?B?ZWxKQ2wrWGZHY213ZUg2dWh2MEFIVDZoZVh6R2kxZzZFRld6c3k0ZUNXMWxo?=
 =?utf-8?B?eWk5b2FaY0VGMmJmamFyQi9tOWNSOG4ybkdSSDIzSis5ZmtoVVR5YUFQS1RH?=
 =?utf-8?B?UDlwMGxnVW1WSDNUQzFZL0gvYnUwNTQ5RHFDdWJhTU93dHBKT1h0Sk1PZGt1?=
 =?utf-8?B?eEFjTkhkeUEyQ0E2NERLcUMvdG9CcTNnZ1FEa0ozR1hueTcyREVNNng5Tkl0?=
 =?utf-8?Q?JzTDzsfWRz5mzP2yEbRJX7+1ZCHxjxpf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1QzaTFnMmZsT3VBQ0FVWVhpOC8xcVZaREYraWNSSTI5WlBoNEhVUXlGYUR2?=
 =?utf-8?B?dTlGN3pCQU1HbXNzbDZiQkxKMVo3RHVjbys0ZVZkUnlqbHpmcTR5MnhZNW5Y?=
 =?utf-8?B?U0JQRFNMczZ1eVBxSzBLNHd6SnFQb0MyNE1MenFlTlZTMm9ueGZrMnpJc20w?=
 =?utf-8?B?eVQwckQ4QzUvMTUvUlJXSFFNUmhGb21mWURVcDNqT1dnVklmQVBybTZoTGth?=
 =?utf-8?B?YmExZDcrNmRDQUdRWDNBNzdtMHRZaDk3bk1kQlY1TTM0bUZub3I0bFBxZ3Q3?=
 =?utf-8?B?UndON3VOa3hVd0VZOFBKTU9JMVZhMVlpVEFTSVBpSDZWZjhudXdDSm1aQUJv?=
 =?utf-8?B?WFUzUGUvQ2JDL1pkak9ZT1Z0MmFISzhkUzgzZXdDaGdDNVJ5TlFsS3gzd1Ro?=
 =?utf-8?B?VUtxczU5K1ZwNStKaE5McTVxZ1A5THFtbkNyK29VVU1aRHlsWEhhZTl6Mmkr?=
 =?utf-8?B?emtjemg4ZGRtcnN6TmlBQllNK291U2JDdm5iSjF1KzRidFdwYzQ3NTh1UWFL?=
 =?utf-8?B?R0ZXcC8zR2xkTWxvQU9BNFRaeEFqdFFsa2VKSU55YlJtUC8xTkptZFJVWDZs?=
 =?utf-8?B?MFBYVzdZMGZSTUhEcDRyUjFCQVhSaHlwczJ3blF2UDVYWElHUnEzWDBzT2NL?=
 =?utf-8?B?bXhUbCsvdFpDeGVnUW93VXFveFYzWXNoQ3hsQTZqbHNTcTZ2ZHRWUFJNZnRG?=
 =?utf-8?B?T0t1NGNQS0J4LzdCVGxkQUtUMTJrVko5eGNiVDRTZVdSZ24yK3h6WENOS2RO?=
 =?utf-8?B?cEhlRit2RmcwZXo3Yk8yY3huQzZsUmxZa1dCZTBJQnlXeWpScnJTRjZtTXdR?=
 =?utf-8?B?OHpBNHkwMUthWk80cWt4bDlaZi9SdWFacmZEYkhuVVJzNlZSNWRzak4yaSsz?=
 =?utf-8?B?bHJ6MXJ3bEszVU9xbTNXMENiTkR6TitaL2FHQ0plTlYzUld1bkNxQ2lCVUhT?=
 =?utf-8?B?ZThtbDZWOHpiNC9HSjdGTW15bXRzMTZOZVJiTUFhZDhuaHdBcWd6UDhaTXF1?=
 =?utf-8?B?Y3NBN2h5enJiY25jUzRjcnN3em0rRDhyUmJIVEdRQlpmOTUwdmE3WFg3QVRa?=
 =?utf-8?B?S3BGQ2hIQm9xTW1pcmpkTmlOTUhRSzNuQ3FybVBqdVl4SEtGNVV0YzlIT2Ru?=
 =?utf-8?B?blgzWnR3S1FQRFJqNFZHam1hbHFnUThvSGJJWlZxUkZoeU5JZDhBQVcxUWtK?=
 =?utf-8?B?c2RLS01BYTFNNmhwQkJmL2VVWElMZXl3VVBjZ0NsemZQSEVPSWJwNVN6SlFC?=
 =?utf-8?B?bFFVYThncHAzZnZmNFd0c0FVNlNCSDh6VTRVUHpHN3JReUQrczFYSEFrTjc5?=
 =?utf-8?B?QXB4Ti9qR2I1aEwvMFVYdWE5aW0yeERlNDJlTnk2THU0VFozbFM4UkVhZFFU?=
 =?utf-8?B?VzlkbmxGNFZtb29iU1AxWUt0LzltYTRGR3l5TUlURWErc3JMYmtlYnF2QTJr?=
 =?utf-8?B?NCs3QmRPTlNYTXcvNjdLVjRRSHlYUGJ4WHZTalRibHhkMnZuYkN5eWlQcitP?=
 =?utf-8?B?Ykt0UWJabGhYWVQwY1Y5aVk3akRacnZNM3kxZ2xpSVpmMHVpWmdWQ0NyOFVS?=
 =?utf-8?B?d1BRS2x6dFJxSi83T2NNdVVrUkxuNFF3Y3p1YzM4ZHV6WWFqNmtCdWpob3h5?=
 =?utf-8?B?NlVYSzFXU29uNUlaL0FnVkZzR2ZENk9uQTF3Wk9LVml2eUxaSFRITEs4azRI?=
 =?utf-8?B?cWhObUdNb2tIb3c2RFZwVlZ3dDAzWmF4ZE8wL0xqRjQycVc4Z25xNXJJNjQ1?=
 =?utf-8?B?dzRaQjJQRHF3MlE5QWJ3U3V6ODA0THlFVEg5Y3lOUm1rMm8yMG5KWjJMajdZ?=
 =?utf-8?B?REJ1NUJiYm5TT2RrenFRVmsyL2tiaGl5b0J0YWxSSTFuMmNjaEVxZnhEck9C?=
 =?utf-8?B?NFd2dVZ2MnpkMUgxcWpoZFNsRGtncDR6d25qeEEzOG5CVUUrNE5Jdy9BWTZh?=
 =?utf-8?B?WjZ5Mlg3ZTF3ekJxcSs1djVETDN0cGw0OWk2czNvbzNOdm1BbVgxbTdJOGZK?=
 =?utf-8?B?ZU9Scm9DemxOekMyTkVmMGpjZWU2UDIwSm1Sd2V0eFphOVBaS1lHNUxrOXR1?=
 =?utf-8?B?Sjh0Q3NESU5VanhHbGtiV1RtR1dIdmRFVmd3S3U0NEtiWmtKb0hwaDI3SDFa?=
 =?utf-8?B?MVRLYXBjTFpPMWtJLzNQaFAxVXdGeWtnVENNc0owSm1TdXY3REJUU0xGb09t?=
 =?utf-8?Q?ESoO7v9QZTKkYBMzi/oUmMV36eHDEcudQ+/h6iYerDS9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bae11d1-edd3-4e10-7c12-08de363fd837
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:54:57.3306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Diwzsmgt4nSPdaSrKwycHhWYgBFistNowb81C5L3LWzu/HpXCLBfQz0Uab36ULKAhYpAUSUYf+Nvl9Iix7egAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005

This is useful when using types that may or may not be empty in generic
code relying on these traits. It is also safe because technically a
no-op.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/transmute.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index be5dbf3829e2..8d78c81e3749 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -170,6 +170,9 @@ macro_rules! impl_frombytes {
 }
 
 impl_frombytes! {
+    // SAFETY: This type is empty and thus does not consume any data.
+    (),
+
     // SAFETY: All bit patterns are acceptable values of the types below.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,
@@ -230,6 +233,9 @@ macro_rules! impl_asbytes {
 }
 
 impl_asbytes! {
+    // SAFETY: This type is empty and thus returns an empty slice.
+    (),
+
     // SAFETY: Instances of the following types have no uninitialized portions.
     u8, u16, u32, u64, usize,
     i8, i16, i32, i64, isize,

-- 
2.52.0

