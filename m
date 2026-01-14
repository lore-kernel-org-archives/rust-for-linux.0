Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022104.outbound.protection.outlook.com [52.101.96.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9CF2FFF8F;
	Wed, 14 Jan 2026 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768415352; cv=fail; b=RhWRISPAcuVJMd+mF4Fn3WU0nK3blmsr7zcGlOzsLZlTx/Z9uPC74DosdWbRa+1bodN2vXOVCbVvZZa5QGicn4P21nYhBBepsnUQ9Zes2BPL9iQDV7ld29Ozs8ehsrSce7tRTaumO2yDpqsN+Sa+MEbEBkd/HD4dt7x/eADq0Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768415352; c=relaxed/simple;
	bh=DkbtoHt20JPHFK1RjOAwtc1VPjQPWmmfZXhNSuzGf8o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VlmTUdD84PCCkNm7vEcaCjXYNBs4uuvZ6l0ySfx9PI9J+DRAh4ISY8dr7IM6O4msQU5EYYL0ovLEGBcTNGs7t28CY0t3v9aaZbFPp+eRzkxyDR+6RpVNG/DLtBsm7LQWc0xpr9MSG20XrmvMzfrrU6hy32JCm0uMNQfR3hScpqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=e0TjZFoz; arc=fail smtp.client-ip=52.101.96.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="e0TjZFoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnQJU40H4RuXxi4nAD3bpvfh7+9iSoiHzTfTxYY1eMSrvT6nB4vqGKSLLSBZp1g23az1odfpgMoGhFC5l/pUb6GkQ0o9F9U0b7bdwuA6n/xP9iN9RYDwy/Xz+pnQ0hxYWSERJuMB0vhBz28BZ/RNhHU4EHFU7/GEwU+ElxnIJaHWdkgcbc5nuukEmX5yhZ7LpTOOmuRiP+lM5hDGPNqWeFV2EcXEnOXeeiEUpG2g7mc5Ng0ivOHX9qGHjlJQfeVWZauHG6qfpCurHAM78Cdu3i9zvQ6vrgjo10Kq3nTekL4xyE0vm3oUdptdd7LWskc1AucmasGaXIjGnVG95kiHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gH2YZ4v6scl4iwsa248VTMLv8+vZvk4gbhFBzeu0OnU=;
 b=kDKhCtFMqyBmI9JRfvAiVYSLLMDD0egV7Juut/VTOl8WCtT9+uM4n877YIvXhUCain/3ehZbpbLsCnA0ovacQtz6HB/U96Q5nNzTCJtkfK01Hui1OPpLbrtx5n8Xox+FCqm/5F9vuuQcHfLKWrFyDvepoq85zpTO8YztwpoXGrXULbrDUDwttmzVoNBBIqzAKl2Sse8BKLrVC3HCXTdqLl48H1vUk0J0jJxQYaR0qC+J5JEkeNPml/D0x07FfV64jkp8Q/OHPcVVZTCyZpQM8MM91RPcqv8TEfqL1rWYCSHNRSeI3i/QA+qL1HCn/DZqhgFit1XriKrkC8zR5lwmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gH2YZ4v6scl4iwsa248VTMLv8+vZvk4gbhFBzeu0OnU=;
 b=e0TjZFozlavXAefulFRlUHo1itiwjgzcQQm+m72vri9kR2gfZp7JdM/w5TErBQEb5DOI8xW/KruaFpMUscSZAIKSI7XaW/I//hze+qG9DjaYqkynHG2xnU3bKDOsLxTSA9LwEoC0fuFBX1+OTPY7WMGHZ420E8WZJF6k06BjNUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2966.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.9; Wed, 14 Jan
 2026 18:29:08 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 18:29:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:29:07 +0000
Message-Id: <DFOIX7B383Y0.30X8ZSG4HOJ4M@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 05/15] rust: pin-init: rewrite `derive(Zeroable)` and
 `derive(MaybeZeroable)` using `syn`
From: "Gary Guo" <gary@garyguo.net>
To: "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Fiona Behrens" <me@kloenk.dev>, "Tamir Duberstein" <tamird@gmail.com>,
 "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260114181934.1782470-1-lossin@kernel.org>
 <20260114181934.1782470-6-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-6-lossin@kernel.org>
X-ClientProxiedBy: LO2P265CA0351.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::27) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2966:EE_
X-MS-Office365-Filtering-Correlation-Id: ce04797e-34a6-4cfa-d53c-08de539ace24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024|921020|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MExmUUZMVU9yZGwwQUt6VzVGYytuV3VoRHUvOTh2a2FET1RHTVVKR3RweGN6?=
 =?utf-8?B?QW1iZ21lbDdtc2llOGsrajFMZXZSRyt5dFU2WVgwTEpMK2tIR1A5elpkME1Z?=
 =?utf-8?B?dXRQcGRwTDE4QmNQZ1VDb3ViRzVPaTV6dVl4T1VDS0E5U3pJSCtsRUVoVk44?=
 =?utf-8?B?bThLSzE5Nkw2WmlnclVFVUtBL0lkQUpaelhBeTIrU0RPWS9WZkJRTTlpdXYz?=
 =?utf-8?B?OUs4cFBZMm02ZnZhMFNMbzRhUmNqK2FwRmhDTDI3MGdxZUt4REpEb0FERm94?=
 =?utf-8?B?RDNySU5iMis1SlBlYmZteXpKRC90cjRZTnlDNTgwY2hiaytzbk9mTE1vR0k2?=
 =?utf-8?B?WkJvbU5lVmJodkVZdG5NZzRuU2xEMkFVbFRMZXg0S24vcGlwRU8wQmVxTXdQ?=
 =?utf-8?B?V0RDSzU3MFV4Q1hqT0dnbUJwNFJTT2pTeEdZblBKejYzVmdKMzhDQ3VETlFo?=
 =?utf-8?B?d1VBM1AvaExTNVZ2cXl5NGxUbzFPaDR2d2pGSEVpY1JVdkprNHlRN1lmcCtY?=
 =?utf-8?B?RmJlbUliZkZoeEZUaTBWelhsa0RSMjkxOEdlNk1rdkJzbmNmcTQ4QXQ1ZWNO?=
 =?utf-8?B?OTUxemJsZkxkU055QTdpb3IxR0V4TElFd1BqNmR3UHgrdjhNMUNyNGlBSXNn?=
 =?utf-8?B?L0h2MWt1WHJydnpUSjRUMXdwV2dNTVVXRHhFSWdoaW9xWUJxcUxNSmNVNjZw?=
 =?utf-8?B?VUora05xS1l4bE5rajU1WUVXMElETWQ5dXBZdVlWSDRJQ1VhaXF5czBjQXRh?=
 =?utf-8?B?ZnQ5cVNOYkNXdVhwY3JGRm9hMjVvRlFDUDBRaEZYdktlYjZ4WkJvQVNEU0R2?=
 =?utf-8?B?Z1dubmFkRlRIWVVFaklGbklJVml1N2R6Y05yR3psVW1nU3Z5ZTZUOVJKTE1l?=
 =?utf-8?B?SGdjWGk4eHFXY2duL1J3L0RUZjBhVWhUWWlxMFRZZXdMNE1ndU5DZWFiL1E1?=
 =?utf-8?B?UUVaZ1dtNUZURTVRaEY0NlVFRERQOHlid1hqNHoxb3kwa3QybEdqSWtGR2Nu?=
 =?utf-8?B?WVVKd3dMUHo4UmZCaVFaWTVLNVdBNnM4dHcvTExYZTVQUVR5MXl4M3RWRUdZ?=
 =?utf-8?B?d1BLQTNzb2xiNUc2Q0J1c3B5RzJuTC9BRlU3M3FjblQ0cVRSU2RKMWllL2tZ?=
 =?utf-8?B?RTV5UFp0MVRuSEM3dkRZeGJHMXVod1YrZVBTUG9LeXpCM1lDM08xMkRzd0R3?=
 =?utf-8?B?Wmc0ZUZWNXFjV2g2em15SjFBbG85cXpPTzRGUjh5QU1FTHpaTXc0Z0VYYXhY?=
 =?utf-8?B?YnJOdERiL256VWFoZitLWFZhMkZ4VFdsWEh3ekFTVkxuVXc0Sm9lSXZrYW1r?=
 =?utf-8?B?VzM0S3FmZFpQUjk0L1g5c3U2b1lCRmJxMmwyaEw2UFZnSlNsOTJodUdLQTRn?=
 =?utf-8?B?a29Gd0VabkpFSkZZRnVxbmVVZjJUdkNUMjAxeWE5dkoxVmxVUExGaXVUL0JW?=
 =?utf-8?B?S0NDSmNpNWJrR082Ylo4NlJmcmR0MUNKQjVRRDBWQVlCTlB5UVRHa29VcHcw?=
 =?utf-8?B?QWR4NkUwWXY2UTNBQmlsUVMycmNodVl6U1lRQjBiclFwcElzQ1FwY3h3cVd3?=
 =?utf-8?B?V3FWdGIwd3NMT1hwRjJxYlAxMjZTQkdES3I2TC9kV2M4QTJNWld0OWJDcG1O?=
 =?utf-8?B?cjJzaXFtMGhLZW84dlk4L1lVSHhPTU9jWitIOHU0bGdpbjFjRnBBY0hmaFJM?=
 =?utf-8?B?TEN1R2xJOTh6Qk5VcktqV2xLdGN6bnZ4M1BseHl5dGhxdW4rNkgvbXJXNnBm?=
 =?utf-8?B?cjdYZkErb1loSlQ3QVAwWEpDYlk2Qkk1RkQ0YWRXVmg0M2tobEZrVHVPVWkx?=
 =?utf-8?B?a0ZoWDdRckJ0eDZiWmRzYUxaNWZZditlUk9rYXE3ZEpEelM1RzhmU3oxMTRy?=
 =?utf-8?B?aXFPQ2QvVXo4Mzd3WjFhMWpJL25qWVlxZmVxMVd6MlRTaGJrWjRnSFM0OFA5?=
 =?utf-8?B?N2dGTHVZNzhBMW45bytRYUNvVytncWlzV1FFSk1FUCt1ak84MHFldDN0U244?=
 =?utf-8?B?QjNtSEJrNEFkL29DbXRCWTlaZnZ3aW5idlB0R3M0dnRhM0p0aGpYR2FHRzhS?=
 =?utf-8?B?Ky80RXV1VEk3aGM1WkF5WHNISVBLNkdmTTAxV2N3a3R1VlRaVlRsYlZWbnJD?=
 =?utf-8?B?MCtrMkV5MnNCclRrdE9HSUwwVUNzRlFQRXlrclBjNFRZZG01S0I2anpjaENt?=
 =?utf-8?B?aXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024)(921020)(7142099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5xa05QbEl4QmRBbEF5VEkrb3FWQ3h2SnFvelpncERYQk51WW1BMXNLVnQ3?=
 =?utf-8?B?K2lKMGtORjJ6d29pQ1cyQ2M5Y3czcGVzTUp4QmFHYmZlTEJkZjNrYTJmRzVr?=
 =?utf-8?B?RVc0ZHJBNThLKzk4cURrVUlxKzRuVmRjVG9wa2xsZ0E2dUxKZDd6QzBVQUU3?=
 =?utf-8?B?VmlYeGYwS3Nvb2N2TWhzQU1sTW9TcllIcmhKeXNLVXFCaW9YV0tURWgzSEsv?=
 =?utf-8?B?U3pyRXlNaDVyQTFTTE92cUtFSVJ5QzZYZnFvNitLOGVlOXNIK1BwWnhVM0Ns?=
 =?utf-8?B?UU5HUWRiU1l0SzlLYUVuL0U1ZTVyY3FGcUhLb1RiQzM3bk5vY3huaG9oN3Rt?=
 =?utf-8?B?MHBRdmE5cW1qaFBMTEFJQisrb1JpcDBydEpYc3dVVlZUV05tc3hhT21vajBy?=
 =?utf-8?B?TEpoZHdvbXE4SXhIRXR1L25oOFB4ZG5Tc1lScnlwTlV5TGJ3MFhMOEVGK1FY?=
 =?utf-8?B?WFAvZXZxbys2Y0dPNmFyQnMvdkl3ZEY4MzRKS2tzQm4zYWdoUjNaUWFnQjNN?=
 =?utf-8?B?dU9tcWxpc1RhZ3kzdEhJejF4OVlPN3d2bklTRHpENE1FL2k3dlNzY3J4Qnpi?=
 =?utf-8?B?YTZNelcvQnRJTG95QlJWRGdXNHB5b0JLZ0ZBSDYyYUlSd0hUaVdSOWNrOFY1?=
 =?utf-8?B?NUVvWHNhWlhYQnpYaHJvWmdkTUtxNXp2cjB0disrdlJwZnlsbnVwSi9waG1p?=
 =?utf-8?B?cU9VelVJRlp3Nzh5b1U0OERrcVNkWjhmNklPSTVHV2VsdnI1SzcyaTRKemZ0?=
 =?utf-8?B?SHd2VDRzOWgzb2Vud0UxUGxhTUxmOG1vaFBlNXF0T2RTcGNuZ3Fyb25FRUVz?=
 =?utf-8?B?SDFqc3pFSkRJY29zbmdrY1ZkazJ2WnFYR0g5b2RqZGpYMVh6N2x3WUY0WXVN?=
 =?utf-8?B?THFqaDR6KzZYd2RFMlVnSHpkZE94czViQ3RLdEVUYUdQV0tjcGpGb2U1YXBo?=
 =?utf-8?B?bU11N0NXNjN6MWVKVThBeWN6dlVwVDhLamJyVVhSUXUzd0JMS0laRWpxMHY2?=
 =?utf-8?B?M3FQeXIxbTNHWXNhRXpaMnVGTU4zTDFKQVk5R2hBRkE5dmNrdEwvNWhxZ3dU?=
 =?utf-8?B?dVhTcmRDUmRBMjhFUHIrMThaMGJneXFJTFNKM1B5bUNiWGNHRW9yTjJvVXZH?=
 =?utf-8?B?UVBPcCtTRXRRUG9BR05aSUNSQWNWVERXODZzUkNzRzBaNlFORGhZT1U3Nk5p?=
 =?utf-8?B?ckMwL05oZVd6RytNMUFmTVIrcm9BU1BweTNuNTBISkRpYUhWdmNJRlRENS95?=
 =?utf-8?B?bUVYZS9iWHBmL1hTbWxyRmN1dmxpVUp0ZWVTR1ZVd1pwa29IS1FSV2llcy9B?=
 =?utf-8?B?ZlhEQnd3YmtTNXUycXcwa3NkZmdTemJWQkpXMy9HT3h5aWtXNlI0RWh6NGpv?=
 =?utf-8?B?UzV0bFBHRWVOSWs2ajVaelFiU01BdUJhTGpCRUVSYlJvOEJ0Z2xrbGJCZmVT?=
 =?utf-8?B?TGJNTTdmVWhZQ2RpTXZIUVpHSnAxcm9qbW5vZEkvOUhHRlU2RFJZVHZNbVN1?=
 =?utf-8?B?VE1ad2tpK2xnOWwrZjU5dm1qZVNaeGFadTlPcmkzYldRNGdpREUvZ3dzbTU1?=
 =?utf-8?B?Q25jSDgvM0dSa1l1aHZjbHdaZ2kveTVITkpmRlluZjB4eWl1eDQ4ZEJrV0FG?=
 =?utf-8?B?RDNyMEVQS0pKK2swNEUyY1FoekdpR2xiZm5ydkFIakJTa1V4aENRWUxRdVVV?=
 =?utf-8?B?bUpkNzMvQ1ArOUd3VS9sUlNMcmpOeVlhb3dWVmRxRnRtZllGbjFhV0lVSzVK?=
 =?utf-8?B?TVA2MWdBY3Frc2Y4bjFuWVpPL0NrMGdkUFVpSzNJcVJwQXhlTUZyd0p2NlhZ?=
 =?utf-8?B?dHdIa0xYellGeTFNT3hBa1hmbEFxKzR3NHVEQ0hFTXpRb3hLZ3N1WFJRYTVS?=
 =?utf-8?B?OEhvdXp5THd4VXdQVXRTRlpraGIvc2dTd3ByQllINGI3UnRKWXlYOWszcmdn?=
 =?utf-8?B?cGsweTVwL1JtUmxDL2tWV0pNRGNXWlQ3ckRGM001MU0zeHBGaUFRQVgzSW8r?=
 =?utf-8?B?cVRlWUpJYXdEekZuSk41RTBtZUVrVkkvbWhDTjZPL0Q0RGpCMVYyamdFTVNr?=
 =?utf-8?B?UDk1amhieXVGQ0RFNEY1bmhSY1JOMmtpMVJyWC84bVh4VHA1NjVSN0xrakFN?=
 =?utf-8?B?dUNGT0VOMEFZQ0JtVUFlSytWbEx1MGNMamZqMHZMN1hDbnNiYmVoNTZrclNj?=
 =?utf-8?B?WHVuRkR1Vys1VHhwdWF5L240ZVpaUm1BbzV1NWZiODdYNmJWYllhSlMwM2oy?=
 =?utf-8?B?WFpFajZhQTBsWjFpbFJvK2JUZG5ZMXA3Nm45cG50dGlxVmc2bUxiUUZteUJj?=
 =?utf-8?B?dmhOZzAzK0dTRUhocXlZU2JvRlgzOUoycytBWi85bXFNQkRPQXRuUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ce04797e-34a6-4cfa-d53c-08de539ace24
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:29:08.2500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRJ4+tsms/Khb0lKbbXJpk2EZiR4vGNFPoBbQfzLMfTF5J7Sj50MhzVfUuD1XAN++NiSBl8eOsEKk8aYJDgcTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2966

On Wed Jan 14, 2026 at 6:18 PM GMT, Benno Lossin wrote:
> Rewrite the two derive macros for `Zeroable` using `syn`. One positive
> side effect of this change is that tuple structs are now supported by
> them. Additionally, syntax errors and the error emitted when trying to
> use one of the derive macros on an `enum` are improved. Otherwise no
> functional changes intended.
>=20
> For example:
>=20
>     #[derive(Zeroable)]
>     enum Num {
>         A(u32),
>         B(i32),
>     }
>=20
> Produced this error before this commit:
>=20
>     error: no rules expected keyword `enum`
>      --> tests/ui/compile-fail/zeroable/enum.rs:5:1
>       |
>     5 | enum Num {
>       | ^^^^ no rules expected this token in macro call
>       |
>     note: while trying to match keyword `struct`
>      --> src/macros.rs
>       |
>       |             $vis:vis struct $name:ident
>       |                      ^^^^^^
>=20
> Now the error is:
>=20
>     error: cannot derive `Zeroable` for an enum
>      --> tests/ui/compile-fail/zeroable/enum.rs:5:1
>       |
>     5 | enum Num {
>       | ^^^^
>=20
>     error: cannot derive `Zeroable` for an enum
>=20
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Changes in v3:
> * use DiagCtxt error handling
> Changes in v2:
> * improved error handling
> ---
>  rust/pin-init/internal/src/diagnostics.rs |   2 -
>  rust/pin-init/internal/src/lib.rs         |   9 +-
>  rust/pin-init/internal/src/zeroable.rs    | 155 ++++++++++------------
>  rust/pin-init/src/macros.rs               | 124 -----------------
>  4 files changed, 74 insertions(+), 216 deletions(-)

