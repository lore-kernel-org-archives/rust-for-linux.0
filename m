Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020111.outbound.protection.outlook.com [52.101.195.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFE19CD1D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701551; cv=fail; b=lelHT3b2NwTZ7H/gB7AnwpvWotV/5Gv7KDHIgZZn8TQhchfV/V3Ys7JKRdu6p9j6kETnS1nvtX1h7iPZW1N96HFimBNXIv0hlyMo3dHmTdIz8RJNwEQ4rDNxKdEX3xhvxGyUjloVL+pX9oMyKo6Yb7+F6LzO5DCuTRXoJgm9uOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701551; c=relaxed/simple;
	bh=Wo+XGfYyiDqaMDVf7FU0kfphxaZxjklNYgHDD/S2yaw=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=OEMhSHPiD3NmTo61BpPV4pRpa0NxhbNRDwBZYq4Q3jSOXCCPuQ7GLXsMQFQ4HOVh8Fe/i/QfwKU7uJsnDOpItp0u8rfsMVl5+TdcCD2gdo0O2AStTxNanF/27lkmIlY4/w8b8kjYSVk69jaskG+7b2gVPUHoj9vXCovnwxilrtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=rrYXv3Ug; arc=fail smtp.client-ip=52.101.195.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="rrYXv3Ug"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWyk6Trqb6WIA1GJc65KD+rrl0ztEn11IZbCd1HOFzjmtDoXArqk/6FqKjsstqP5J4evJsuloUmeYkijaPzGcuE4JBQhRlexPdRunoqvkdXsVEw85djUDkHTyYuulv7yArnPPcxJ+wc8d7I87E7Ys69Hjs9wCM80VDYn7sFc6HUh5+CE804tSkUYXl1Oig1NAgr2gjzUHvB7vVt5VBn33di40Mq/2GEyY72KVsMhdhB9OqyubVDAepWVYT0CxSoIZG9kGI8bDCAfHDioCb6HubZ4Kxa3kJb3t+SsuOTkIx9JKU1+CXIfQfy2WKxXGA0owX0eiDVhImhJRfFQ9bWJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P0VN7nGDjX6QVQOYPu7VOX99z0gX3EMd517YVtMD48=;
 b=bzXgeUKGqj7Yc0637PYK2g4RtxMP11qEQLmCNzC6EBSHuNGg+2+4CVwGQP1voK26hDYSsT1sMaUR7GDKKMVhw5eahuXp5Ig0xGZbNejYMyTg/Lbm6AvIGDPPYSS+s1Pv+AOQWXKCCa/QPtxIyMRnhpyl71fFxvdOHyMS/w4szE2OLoZziuoyloWPHmiMwup98P0ACdJ8uroioiOy4r/doXnwVvNoclrFTd6oHrO5gS7dAt5Zfmi0+gTNMP/FdNx2+qm3D56jddiHPHWOgMMOU2YjQTZpxr00gRjbmUipTx9TzmKkZYwE7kqUijJ6Iun46UUWmgZqwF06jHE21kuJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P0VN7nGDjX6QVQOYPu7VOX99z0gX3EMd517YVtMD48=;
 b=rrYXv3UgSYMUpjFOl4xW+2utuvPnDxfJno3j55PFwBsK/Y2nZv4xNKfPAbhaGueBYW+NebfBgAarRJlJHPZNtUAgoEb41CLx0aDErMVs9aurRoWfC233RyRe240H3Jv+uiyGdXSqPWxSHwd8oZ6gGkqQCugmzBxY/avhBih7xZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8799.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Thu, 29 Jan
 2026 15:45:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 15:45:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 15:45:44 +0000
Message-Id: <DG16UA4XED07.1871O8HM1MN1L@garyguo.net>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
From: "Gary Guo" <gary@garyguo.net>
To: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "FUJITA Tomonori" <tomo@aliasing.net>, <ojeda@kernel.org>,
 <peterz@infradead.org>, <will@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260129122622.3896144-1-tomo@aliasing.net>
 <20260129122622.3896144-2-tomo@aliasing.net>
 <DG14WXLRULYY.268U7911TMRLE@garyguo.net> <aXt9vTuVpEdkzdYD@tardis.local>
In-Reply-To: <aXt9vTuVpEdkzdYD@tardis.local>
X-ClientProxiedBy: LO4P123CA0280.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 592953d9-e4d5-467b-cc38-08de5f4d772d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXhJUFNpa3hSVWo4cFBXWXRVbURsdW9qNXFwZWlLUTJER1FESWlwR1NUTzNT?=
 =?utf-8?B?RWhSaGhCdzhhTU9wWjVvWVVnc2UwaVBpODJMMzlUd3pvVkoyWTd5Z0c4OVZB?=
 =?utf-8?B?N1Q2N29EVjJ6eDNtVytQUDh1YXpMcTdDcmtIcGFKYVVtcExLYitoVW5ZVXFp?=
 =?utf-8?B?c1hBOVd6WTZoMlJvdE00eTI5QmhSUThvS0xiUE02eFpaN09tNFVKQmNybzJ5?=
 =?utf-8?B?TmYwMmJLMmVJVVJORkZuTE5YMjE0S2cyNGY0MlMxMVFaazdlRmh6ZXphMjgy?=
 =?utf-8?B?N3poVnlwZENNZzJsV2xrL24zOGtpZEZ2VzFNU094SUpHVWE4aDhiNVhSWXE2?=
 =?utf-8?B?RUNPaGdreDY0NGxvUjlUNitMZTV3RHQ3QlJaV0JaNmY1VkZSREMvMVF2Tklt?=
 =?utf-8?B?TEc1T1hPcnp6RVNGWVNta3BtQ3FSc0YxVG4zWEFCZEk3QVZUa0pNaGdRSXFJ?=
 =?utf-8?B?ZlpBYkJYbzd5cjczcjV5RGlpbUE3UlpzRHNUNE5rdENEdmUyZm42YzliQ0Fx?=
 =?utf-8?B?UHRiZ0hvcHlHY2ZRUzlReWV6MTJKQlIzK0dXR1JjVy9PdDR1NThIcldiUXNj?=
 =?utf-8?B?cFdvQmEzUEpvbUw2eXN2NTdkMExiNnU0SktyazF2RlR3UUtuTDI4Z2JCSTZs?=
 =?utf-8?B?Mm9yL1JrVnVOeHFtc3RvZnN4aGtyemJWalYydXlxdnF5eGoyckt5K0Voa3k0?=
 =?utf-8?B?bTJyREV3VzBwaXRCL1ZDUWNScGxrZnZWT0ZJZ2ludFZzRUx6S200RTVqTVN1?=
 =?utf-8?B?NzMxd0JURzA5eVB4L1RXQUZzWGtBcTIrS3pHQ1FBUDgweXZ0d2srZzdNWEJN?=
 =?utf-8?B?enNCaCtOL2JGVXdmdkdNbkFvdkh3bXA2STFyRnBrTEljTjdzTjVNMEM5NzZQ?=
 =?utf-8?B?N05GODB1OUs3RGZicENXMnlKNUxhVEFWdmZKaUxFOEc5QzNVbjlsN0pXb1Qr?=
 =?utf-8?B?eUM2SVoxOHBKSkdwT2RlTnpVTER5aXh3SjlkVHVxNjhJZFB2TEU1TFgxa1Zj?=
 =?utf-8?B?dmovMjlwb3pRSnV5RXBlLzJNd0RNU25TZjhlMzMzREJ3NStWSHp6YU1lOCtm?=
 =?utf-8?B?ZEtYUEMvU09GQVRkTnJ1UDVYMHo5Z1gwZVpMNzJndlFPWmhWdmdDOFlXMjBz?=
 =?utf-8?B?cGhNQzlGS1c4cGdyOEFIeDRMbVQvNlJzYk04VGxnMDQxUEd0VHJTeXdnQi8z?=
 =?utf-8?B?ODlocEFJR2tpM29JOWRjblQ5d3JhaThiNGh5ck9MOFQwZk16NVVidEU3SXJa?=
 =?utf-8?B?aFBJWGVsQmVjeGwrOUhCcVFaTkthRHhUdE1JUmdzOWlzZDl6bHNYTFI0d253?=
 =?utf-8?B?OG9FUVBNL0Z2d1B5Y1oxa0RveWhjbmR2ZXJGN3RGWmthUlFNK1A1OUFSQVhC?=
 =?utf-8?B?R0FoaDlnL2RQNGJvSC9XVmFYY3Y5bTNhdVlmb2J0d1hOLzBvazZsbkJkTWp6?=
 =?utf-8?B?TTdDQi80UGpnQWorbXNRNEJWRUxaUFF0UWtYQU9vWVQ0b0o2bFZudW1DWWlT?=
 =?utf-8?B?YTNIVEIrZm1WMGRXYkt3ZTdwSDlQZnBYTS9LanBiczZielhYZHhvWlJwUFdM?=
 =?utf-8?B?c01KbmRuSlEwa1FaYmJ6N3FKeTRMNWErMmptcytnV3prbSs0eHQ0b3c1UTNB?=
 =?utf-8?B?L3dxSmJXY1lIUVBieDdibG96ZmhZcVV5eUxvVW15by9EUUpBT2dDS1B3SHBj?=
 =?utf-8?B?OUV4QUdvbWV1STg2UE1EWi9HTGp4RlRtU09WNElLakl3SzB4MGFXbTR5VHVZ?=
 =?utf-8?B?di9teDhLRlZ6d3V1N1BMUzREVEhFaDI0ZFpQUVZmSWE5VzZ3bEl0OUpZWUw3?=
 =?utf-8?B?djRMZlNZdkJIUExETEJJQ04yd1hLQ2RwV1RJVjNSb1ErUldYOFptZk5SVVdn?=
 =?utf-8?B?TG9nSTQwWmxSMDBZTUtkTEZtTHljTUFGY1JDbHFxZTJoYi9YUlBGQUlQazN1?=
 =?utf-8?B?K2hGbmMrZTNvV3oyM0JkK2JkN3dJd2NHdlRUSFBxeDdBU1NBNS9PcllSS3U4?=
 =?utf-8?B?N0N2eS90U0UxUWJFN0paMWt0b05YenhNRUE0emFucGtmRkxCUVczcU1RS1Jt?=
 =?utf-8?Q?3wLtp/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVwTmZLayt0ZzN3UUhadnlSY29RQmNiZUVyWDNJem5qMjdnT3U2bWFpaWh5?=
 =?utf-8?B?UzE5cytPYVRXRmh3TmljRGxtU3ltRkxKK0FWclZLdUZDdW1vOER4Y0RBQU50?=
 =?utf-8?B?c1NOczBIUDIrM05HdEdCbHdacFpKVTM5RiticjZtenNHaUh6dUI2blMwaHJx?=
 =?utf-8?B?VjRDWUJHZ1lTRUNKeEorSFhGcnlIaVpVVjRabHdmOXh0NEZkVVFyNUdUaVYv?=
 =?utf-8?B?OFE5eDVCYWZqNnNFNnlkdUlYV0FsTVhYeWZ1c21lcE5UQmNycXBPTlN1dmpH?=
 =?utf-8?B?ZjZ5MFVRUUQ0OWwvK2UxaEtCZGt2Y2dmYWYzTTB6Smp6TVlDZURKaGlXbmdi?=
 =?utf-8?B?N09GclNWSlpuYitDaDBoQUF0eTBGSFllL3QvWHR5NUlBTytLMTNJaEw0UHpC?=
 =?utf-8?B?V3B0Y2tFakZpZ3VtY2hvemVZNjJoMGxrYUt5eURrOFA4d3JYVDRIdTlVdXlB?=
 =?utf-8?B?ZE5TMjNhM1AvaXRkekNJSDRwaTNYZWt1MklwcU8ydFpjd2FHbGVKdE1paWJ3?=
 =?utf-8?B?emlmaXFjYm1OR3ZQVFhWVzhUYVVjcVNLaUNGTS9Ed1pnTEg2b1E0Q0tPQTZT?=
 =?utf-8?B?a2VDRzRGMUt2TGxDdHVHR3FlMnlrc2wvWlFUdlF3bVRtZkMyVkZBcUk0VDk1?=
 =?utf-8?B?S0pFcjRpdW01WXIyaXdNNmFhZEJtWVJmbEtUZjZVWkYrVDVqQkZBTnM1VVhj?=
 =?utf-8?B?ZWdla0xTR1Avbk9iQlZ3aVhzVnV1NjZtdGZ4bG0rVnVjS3RobGR1ZWo1NEVa?=
 =?utf-8?B?SFJUTStNNThhS2tGSkJ4YmF4OEE5SHZ2aDIxWXVGMnRaWVY3STA3Yy80R0tt?=
 =?utf-8?B?aTRScUhzSjdjYnc1ZTJjSkZ5NHNoS0pkZTY2SlA3TkhCZDVIdksvNGVQWnpZ?=
 =?utf-8?B?Y0RaTk5WMnhjVzViaVlFejFDSXFBR3ZhWWFCTkd3empUWGhzSjZsS2FpWjht?=
 =?utf-8?B?eTZIRUdaOGNLUkJzTmFjM2hZQ2w1Tzh3Q1prbm4zY3NyQ0plVUowcmFYaDB6?=
 =?utf-8?B?Z09ZZlp3UmhsL3ExQWVhSmtJWnpSeWNUTG90OVdnZVUwN2N5QjZEVXFUTlMv?=
 =?utf-8?B?YUFRbWpxZTNjcExtOC94TkM2WVZJbElvd3NxRkY1OTNxRnZiSS9oSWxlL2Mw?=
 =?utf-8?B?V0FyZXZwRGhiajdGWVl1cmdtZ2N0RVZLNm9LZldpbitob09yVndta2RnWFg0?=
 =?utf-8?B?ZVdKSkE3VnZTVWxTWmtndm1zUERWK1dsZU85VE8zaDQyNjFXOStMWWxTb0t4?=
 =?utf-8?B?TS9oV3UrS3JaQkkzeFdkV1dITVFMU0FXUlVybmJ3TnBoSm9ZM3JRaUV4eXQv?=
 =?utf-8?B?V2UzYmUzaGtLOGRoVDVhdGNlZmxRalI1VEh6OGJCS1pmQnMxR0hxeXFsa2kx?=
 =?utf-8?B?V3BVbk5LMTNhYkpHbURhbkpTWitvM1ZOUk5yQ2VQcFl3bTNBb3pSeHFuQWJi?=
 =?utf-8?B?Q3ZwWXIwUEpDWFdSWTNlZDBBSU9IbG81L3pWTElMeWEwVHR3REdjS29XSUpN?=
 =?utf-8?B?bVBoZVdsL2hMTE5UZDJ1Q3Z1T0FTSmJmY0VwNzNld2UvSFBuSlhaRVBRVjBY?=
 =?utf-8?B?QmJjRGxmSFdyRGN3VkNvRmZKNWNlRmJXL0pMV25odzZJM1dTZjl2Z2RYVlFZ?=
 =?utf-8?B?NWQrTW92bzh3dGlaRjZadlIrS2FsOHR5VWgrOWxpWFlOQjJVS2V5SzlueHV6?=
 =?utf-8?B?Q1BWT2FHRUNreVQydG9naHkvd252MFkwTHpOVTB2RWZsNVpZUzlvOFAzQmxr?=
 =?utf-8?B?akhsUkJ5UXVmaXVFOENKYllVdFF1UElKOVp4cHVXVWZlRnhVQVhYRjhJanVm?=
 =?utf-8?B?dm8rYTVYV3hvcHNuRGhUOHAzZ0JRYU5MUmM1YkJUMVdRRkhsVUtsUHN0eEZv?=
 =?utf-8?B?YzdPZUl1MmttRU1rSWx4bHpXMjdaenFOZ0oyL1l1Zk5oN0RVamRobXcxdHlj?=
 =?utf-8?B?U1BBeXNPdWdjWGhTQThCcU9Qb2VWK0tDdHgrZFlHMHFtcXBWSHNyZ2U5a1pF?=
 =?utf-8?B?a3RsMmtLbEtqbWptNGN1TGU0R0pEdjFkWDliemo2Z1R3cDMzeWlyQ3kxTTRD?=
 =?utf-8?B?bW5iTXlFeFZNYzZLRGRJWTd0eGV5eHhsM0Uwb0paTDJtWE1MVGZVdEtTeHd4?=
 =?utf-8?B?WFFueWZxM1RCeUs3eXRiUFVoT0ZkVnhmWS9xbXQ1SmRzSTFpamxudkhaWW5V?=
 =?utf-8?B?VEpzcGhlQlcwUEJRVThNaWlWdENOa21Md3J3bEg4eTVUTFBiUzcvM25GeDdz?=
 =?utf-8?B?SE9YRFNMTG1JR2FKT3NEWDlMWTNEUHl4TUZzeDI0R1VvTEdLTS92YTVqS0xz?=
 =?utf-8?Q?iIAPs8vNBVieje5tpp?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 592953d9-e4d5-467b-cc38-08de5f4d772d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:45:45.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7yKFLOfz4YZk8p9chUfP/9nOefQsV5OJKxHt/T1Qn+zENd1zJDBsfzgv7KRWLANS9jGyCnRFMcYHfMkPghFJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8799

On Thu Jan 29, 2026 at 3:33 PM GMT, Boqun Feng wrote:
> On Thu, Jan 29, 2026 at 02:15:10PM +0000, Gary Guo wrote:
>> On Thu Jan 29, 2026 at 12:26 PM GMT, FUJITA Tomonori wrote:
>> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >
>> > Add AtomicFlag type for boolean flags.
>> >
>> > Document when AtomicFlag is generally preferable to Atomic<bool>: in
>> > particular, when RMW operations such as xchg()/cmpxchg() may be used
>> > and minimizing memory usage is not the top priority. On some
>> > architectures without byte-sized RMW instructions, Atomic<bool> can be
>> > slower for RMW operations.
>> >
>> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>=20
>> Hi Fujita,
>>=20
>> Thanks for the patch. I think this looks nice, so from design point of v=
iew:
>>=20
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>=20
>> However, Boqun reported that the codegen of `.bool_field` may involve a =
bit
>> masking instruction.
>>=20
>
> Yeah, but at the moment, I haven't found any elegant way to reduce that
> see [1], plus I've tried to transmute the 32-bit Flag struct into a
> 32-bit enum, but for example on riscv64 an `sext.w` instruction is still
> generated [2]. That's a sign to me that the micro-optimization here may
> not bring actual performance gain. But of course, open to any
> improvement, let's ship what we have now and improve the codegen later.
>
> [1]: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/=
topic/A.20.60AlwaysZero.60.20type.20for.20padding.3F/near/570631532
> [2]: https://godbolt.org/z/3PMK3EK1r

Interesting! In this case, disabling MIR optimization generates better code=
 for
test2 (-Zmir-opt-level=3D0). Although, it still has an `andi a0, a0, 1` rem=
aining.

Testing with `-Cno-prepopulate-passes --emit=3Dllvm-ir` it looks like Rust =
is not
telling LLVM about the fact that `v` can only be 0 or 1... Although, I reca=
ll
that previously seeing LLVM codegen issues when Rust does give LLVM additio=
nal
unreachable paths.. So the fix isn't going to be straightforward.

With this background I agree we should ship this as is. It's much better th=
an a
LL/SC loop anyway.

Best,
Gary
>
>>=20
>> > ---
>> >  rust/kernel/sync/atomic.rs           | 125 ++++++++++++++++++++++++++=
+
>> >  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>> >  2 files changed, 142 insertions(+)
>> >
>> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> > index 4aebeacb961a..bfc393d98aa9 100644
>> > --- a/rust/kernel/sync/atomic.rs
>> > +++ b/rust/kernel/sync/atomic.rs
>> > @@ -560,3 +560,128 @@ pub fn fetch_add<Rhs, Ordering: ordering::Orderi=
ng>(&self, v: Rhs, _: Ordering)
>> >          unsafe { from_repr(ret) }
>> >      }
>> >  }
>> > +
>> > +#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
>> > +#[repr(C)]
>> > +#[derive(Clone, Copy)]
>> > +struct Flag {
>> > +    bool_field: bool,
>> > +}
>> > +
>> > +/// # Invariants
>> > +///
>> > +/// `padding` must be all zeroes.
>> > +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
>> > +#[repr(C, align(4))]
>> > +#[derive(Clone, Copy)]
>> > +struct Flag {
>> > +    #[cfg(target_endian =3D "big")]
>> > +    padding: [u8; 3],
>> > +    bool_field: bool,
>> > +    #[cfg(target_endian =3D "little")]
>> > +    padding: [u8; 3],
>> > +}
>> > +
>> > +impl Flag {
>> > +    #[inline(always)]
>> > +    const fn new(b: bool) -> Self {
>> > +        // INVARIANT: `padding` is all zeroes.
>> > +        Self {
>> > +            bool_field: b,
>> > +            #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONF=
IG_ARM64)))]
>> > +            padding: [0; 3],
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +// SAFETY: `Flag` and `Repr` have the same size and alignment, and `F=
lag` is round-trip
>> > +// transmutable to the selected representation (`i8` or `i32`).
>> > +unsafe impl AtomicType for Flag {
>> > +    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
>> > +    type Repr =3D i8;
>> > +    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64=
)))]
>> > +    type Repr =3D i32;
>> > +}
>> > +
>> > +/// An atomic flag type intended to be backed by performance-optimal =
integer type.
>> > +///
>> > +/// The backing integer type is an implementation detail; it may vary=
 by architecture and change
>> > +/// in the future.
>> > +///
>> > +/// [`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when y=
ou need read-modify-write
>> > +/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) =
or when [`Atomic<bool>`] does
>> > +/// not save memory due to padding. On some architectures that do not=
 support byte-sized atomic
>> > +/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
>> > +///
>> > +/// If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<=
bool>`] is fine.
>> > +///
>> > +/// # Examples
>> > +///
>> > +/// ```
>> > +/// use kernel::sync::atomic::{AtomicFlag, Relaxed};
>> > +///
>> > +/// let flag =3D AtomicFlag::new(false);
>> > +/// assert_eq!(false, flag.load(Relaxed));
>> > +/// flag.store(true, Relaxed);
>> > +/// assert_eq!(true, flag.load(Relaxed));
>> > +/// ```
>> > +pub struct AtomicFlag(Atomic<Flag>);
>> > +
>> > +impl AtomicFlag {
>> > +    /// Creates a new atomic flag.
>> > +    #[inline(always)]
>> > +    pub const fn new(b: bool) -> Self {
>> > +        Self(Atomic::new(Flag::new(b)))
>> > +    }
>> > +
>> > +    /// Returns a mutable reference to the underlying flag as a [`boo=
l`].
>> > +    ///
>> > +    /// This is safe because the mutable reference of the atomic flag=
 guarantees exclusive access.
>> > +    ///
>> > +    /// # Examples
>> > +    ///
>> > +    /// ```
>> > +    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
>> > +    ///
>> > +    /// let mut atomic_flag =3D AtomicFlag::new(false);
>> > +    /// assert_eq!(false, atomic_flag.load(Relaxed));
>> > +    /// *atomic_flag.get_mut() =3D true;
>> > +    /// assert_eq!(true, atomic_flag.load(Relaxed));
>> > +    /// ```
>> > +    #[inline(always)]
>> > +    pub fn get_mut(&mut self) -> &mut bool {
>> > +        &mut self.0.get_mut().bool_field
>> > +    }
>> > +
>> > +    /// Loads the value from the atomic flag.
>> > +    #[inline(always)]
>> > +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Order=
ing) -> bool {
>> > +        self.0.load(o).bool_field
>> > +    }
>> > +
>> > +    /// Stores a value to the atomic flag.
>> > +    #[inline(always)]
>> > +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool=
, o: Ordering) {
>> > +        self.0.store(Flag::new(v), o);
>> > +    }
>> > +
>> > +    /// Stores a value to the atomic flag and returns the previous va=
lue.
>> > +    #[inline(always)]
>> > +    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Or=
dering) -> bool {
>> > +        self.0.xchg(Flag::new(new), o).bool_field
>> > +    }
>> > +
>> > +    /// Store a value to the atomic flag if the current value is equa=
l to `old`.
>> > +    #[inline(always)]
>> > +    pub fn cmpxchg<Ordering: ordering::Ordering>(
>> > +        &self,
>> > +        old: bool,
>> > +        new: bool,
>> > +        o: Ordering,
>> > +    ) -> Result<bool, bool> {
>> > +        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
>> > +            Ok(_) =3D> Ok(old),
>> > +            Err(f) =3D> Err(f.bool_field),
>> > +        }
>> > +    }
>> > +}
>> > diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/a=
tomic/predefine.rs
>> > index 42067c6a266c..d14e10544dcf 100644
>> > --- a/rust/kernel/sync/atomic/predefine.rs
>> > +++ b/rust/kernel/sync/atomic/predefine.rs
>> > @@ -215,4 +215,21 @@ fn atomic_bool_tests() {
>> >          assert_eq!(false, x.load(Relaxed));
>> >          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>> >      }
>> > +
>> > +    #[test]
>> > +    fn atomic_flag_tests() {
>> > +        let mut flag =3D AtomicFlag::new(false);
>> > +
>> > +        assert_eq!(false, flag.load(Relaxed));
>> > +
>> > +        *flag.get_mut() =3D true;
>> > +        assert_eq!(true, flag.load(Relaxed));
>> > +
>> > +        assert_eq!(true, flag.xchg(false, Relaxed));
>> > +        assert_eq!(false, flag.load(Relaxed));
>> > +
>> > +        *flag.get_mut() =3D true;
>> > +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
>> > +        assert_eq!(false, flag.load(Relaxed));
>> > +    }
>> >  }
>>=20

