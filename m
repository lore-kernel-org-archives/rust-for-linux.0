Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022141.outbound.protection.outlook.com [52.101.101.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93318B0A;
	Tue, 13 Jan 2026 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313391; cv=fail; b=Twjnsj4qHBYaVRs5DdpLGis5g4eUfXPutA+S3O+NHvaTCw/2JFVxLo4WW3UoDPDYwzNA7Orh8IFpQEo6Mmpz3WCvwL1FfjSJ0Vset+E0OOBIR6Qh96RdP+5wvgCIdbnsIJ+mcKmeoWwbmSgWKfTcbglTanvwp05mHMULm34CV/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313391; c=relaxed/simple;
	bh=ryZuFEbmb9jGaJEskgRmrpu8avanU04ExZKZMHZxK/c=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=r9qTaz7DA8vZ4sCh55EPCEscq2S5a3d8kwiQpcMqdTKNwFSquj21bOm7syk88XcFDPB5HMtzzjnM/E0KVIzx2mvli6B5okJFDRuqCVsCpVH8ZWRxlEC7V4Yd8Y9OJ95F0Bt7PentVAHa/OsX202hdAwUz3eUTPf4TDS3yeSO5Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=kA/SGtr1; arc=fail smtp.client-ip=52.101.101.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="kA/SGtr1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/NWO4kXeAeqfJ5fEbHLYNlH2x/VYAlywngyacLBFE0bRUydiBYpsSNhqaWC8xKywccFqxnpfCGzn1RBdRBCm7SbtqWPk6ObQJcFxblRBm1v8Ndk+Wd2e6aOi4RJqGFSFrcQ7gxQEMEb3PrYQE5bPLJQzUyGSbvdgq8NZ3VPVdlf6J9kkrOHrIEOzYwsl7lIdKikC0ap2OYGLQp7I/bzaPKyNbojHHD+uMXepYfZCs9cVLQ3yBSi6uD4Jcaqjh+64CTSOSPWJCCOs8IKDY5kWBvvtCp01ApP71xcmVFN11jqlbHbhLQGhdL9SB9sGl6GVY/C9atcmt5mNVkWmhXS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uQElX57gyvlwOCLlD7E0akOOKyz7PweybqVyW0FizA=;
 b=YcPI+/B5x9bXXHNNRmvpwnUTZRqk7izGjTrEFYrOSk7vI4fcr/nUSYa56PLK+/w9V7D6fNAYe78GOQs5FyJSRUc63MgJPNSv0Mu1yLSPv4THEVrgb8kQX5wrhKe5NPMiikzmiYQEFM0q8mLDUR8hwbo8ZRzf9PjlOkdKcsafCtSSXASoEZSh0VEW4GXqnexXccFjYt/xbv4LHzWs4UW0YgZ77JdHn4DQ6FVsBb8GkFmczWbl/vov9nKfpnMF2b7TIbZCum3GyP28TQ81yRZh6G2xKXuoxh3p9Ox8SPNc8DiQtmlDMMrSnm9YuvTFOMGFNgLUgQ9zK2F95MQc9m+09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uQElX57gyvlwOCLlD7E0akOOKyz7PweybqVyW0FizA=;
 b=kA/SGtr1nAvjyucMwcyh3bwLcTVnucBkHl/1hH5SOYLujVyo5Kf3ypwZZxrRjHvgJEcVd7QkaIBkfdXRNWyCWA556lLy2b+KB2j5vsYuRHleiOkNsderSr2LqSS/C0uXA/sP+RjFYtz+5HOyPYNcs8t8jYmys7aiZERfx+nZYsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7512.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:39e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:09:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:09:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 14:09:46 +0000
Message-Id: <DFNIS32ARBRQ.1842L2438YTMB@garyguo.net>
Subject: Re: [PATCH] rust: macros: support `#[cfg]` properly in `#[vtable]`
 macro.
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@gmail.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com> <20260113131138.2155899-1-gary@kernel.org> <CAJ-ks9m4bCoQbrHeO14wXdFyMhkWf=SRzqkxY=gk9tpB594cCQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9m4bCoQbrHeO14wXdFyMhkWf=SRzqkxY=gk9tpB594cCQ@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bee536-c221-411f-7583-08de52ad688a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDlXL09RSDRLK0ovcFhFbmg2MUR0M1orSmZOUHlZYS9xR29rc082WlhhcEF0?=
 =?utf-8?B?TXdLRit6VFRYTHZKZHJGaS9NMnBlbXB1RHRzNlpwUUF1amhCSXhpSUlJZXJ1?=
 =?utf-8?B?TkMvT3VlR2pOUkpHeVQxMC9xS0xvR0RJTlo1YnptWnZOQ1p3c3doSGlIaFVj?=
 =?utf-8?B?b1lkaitMMERZb2NTdjdGRUlqYWttVTJsSmkzSG1jWjhOTit1RUY1UlFBMGVw?=
 =?utf-8?B?MnJmbVMza215YVdjY1hUbFVReUNZRjVrdXEySkVmTUl4K0dlN2NGQ2N5Znc3?=
 =?utf-8?B?NUdiT0RjUklrdzQ5dnpiSys2TzNMQnl6VVVrMWZIVW1QVkZ1STV6SVIzUy85?=
 =?utf-8?B?aDNBSzlBVGFhU0lod0hHWDlycVd6b08vOFh3Z3Jlekx3WVFZK0Y4Q3kyaU53?=
 =?utf-8?B?Z3JteDBlYlgzdS9XUVNNTUJFcmp5UE1FSklCMktIY3dwaHk0WFRqSnBjbU1a?=
 =?utf-8?B?WFNtcitTaGZBNGUybG9iU2lkZ3JLQ3hSbDVONVR6R2JRZ2VJNWsvSkVGNDdM?=
 =?utf-8?B?TThRM295OE9WWEVpaHJlVGpmbXJnWEd3OThINXlvc05YWUMrUWI3aWIwZFRk?=
 =?utf-8?B?YXFWOXRxTVhxbFlJMmJTcngyMENUSWhjbHprU2t1Q09ibG9QS0RiNjI0T1JG?=
 =?utf-8?B?SmNWbUpBVnZTa3pRZjVTdS83Z2czTUE1ajN6VGxvTjA0RVJERFVmWEFkQVNQ?=
 =?utf-8?B?UmYrMjJGYzZTQ0NRbDQyZXUza3dTLzhSZHNtejF3NDJ1aStDTzhNWTJXWkkv?=
 =?utf-8?B?THJFMEl2aGQ1YUNCeEYyZ0UxWXl4bWpsS3BHNnhqR1F5YzZpejc0clg5YTl0?=
 =?utf-8?B?RytVdGVPNlMyNWxJeGZVbVlDQzloKy9SOWdPQk9oMkpPL3F6TmpIdndjYVVm?=
 =?utf-8?B?MEQzZXN0V3VaUVFLK3BZZ1NHSjlpaTNjSjFHeDNHR05KeW1QdVdiclFWV0tw?=
 =?utf-8?B?VUJXL1Z4VXA5cjFlSGc3bEw5MHh2VXA5YVNsaU1ja2hsQm5sS3czaEE2N291?=
 =?utf-8?B?NFFUSTVPV0YramVUejQ0VVBjZXA5WG96M1IrVFZud2FUNFV1MzNPYno3RDlE?=
 =?utf-8?B?L1dqTERwRHNUVVhOUHo2RW40UU5HY2xGeHBaYkRuRDJ0QUN3b3h4MUc2SWtk?=
 =?utf-8?B?dnFlTzZrOTJ5dFg4SS9BSTk5N0RzWnM1ZlJCczJ0TjdzcnN5TVhicG9qb293?=
 =?utf-8?B?M2E0MmFNQVVaeGkycGtXMVNzMG5hT2doRFRaTS83Q0c2czQ1SVlLT0kwQWl1?=
 =?utf-8?B?TU5rdUY1ZXltVHFkaStMU201M08vdnc2SXRuTlZQS1ozK0ZQOUJUU0NmaExs?=
 =?utf-8?B?cXJHb3BaeUwra1owNlBySW1uTHV5Z2toTHFOT1lwak4vL2JLc0cxMlpIODZK?=
 =?utf-8?B?NzNDenRYOHJxbUwwRHcyQnVvRUp1RDJRVnRsQWpmaW1OOS8xYlJtNitTZTky?=
 =?utf-8?B?eXlPcDg1ai9VbGJxeTlGdkd2UHNENWRFaEk5ck9OTEFGaWtUMnhDMEV2SVFB?=
 =?utf-8?B?NHN1NjdrNjk0ZzB1aTB4OW5rS3pjVEtVOVV5akdhYTJJT1FPYU5DVVQyL0Qr?=
 =?utf-8?B?QXN6dDBRb2xBL2dKNXlsc3dTek5sa2lYZEZZQS9vditaeWF4RTBCNWVSN0RN?=
 =?utf-8?B?L21QclJPTXRCSkNDM3ExcVRQZWhSN3VnNWpGem1kMUt3SjBnZmdWNHUyaVpx?=
 =?utf-8?B?NTVIWEt2ZlJhVGdiVzZwZDV1eHphMlh2UWpxSi9lYzBOSS9sd1ZidytLdE1y?=
 =?utf-8?B?NWNrb1IxNFF0Rkl5UlVmbm9YOStEY0RGVDdKWW5QM2MyR3ErdTBvd2YvclVw?=
 =?utf-8?B?cGplNVVHWUxzaklnblNJajloaVN1cEx0Z2xlZHV1UlpIQ09uSnhUcERYcVFQ?=
 =?utf-8?B?MXcrSU4xNlhWR1J0OHg5V3pNTmlWazYyV2JvdFRGM3h3YlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlwZTBOMkxpTk9mUUE1RFZncGg5a2RIanBrTE5vTjJvQnZQRTd3bkRKbkQ0?=
 =?utf-8?B?a1paM0JzUDFBWTl2TnZWTjVaV2ZHbDc4Mldvek5oY0k5RVVLcFU0Mmx5RjF3?=
 =?utf-8?B?bU5qM21zMmpKZ3E3dE9LcHFWVEU5NkNiWGVEb1hnS1pxUG9nUnRrN3h3Zzlw?=
 =?utf-8?B?TnhUYlV3ZDVsbHV1d21NcjZwSjlZdkc5dGcwdDV4NU9ia2NKS1JXenh0b21J?=
 =?utf-8?B?dC9Rc3RVLzFoSXFRYXgrbzNHaDJXQUNLaUM3SHl4QlczU25kcHJiKy96eXZt?=
 =?utf-8?B?TVlWVDlNYUNHdlZUcnZ0TnJlejRMeEQ3ODlTK0F6OWZyMWtoa1BPcHM5TTdj?=
 =?utf-8?B?a0kxZU5yL25xcVdIZ1RLVkppRUN5NHhCM2NpNXlncUs1dXg5Z2k5VS8ydGhP?=
 =?utf-8?B?VWpvYUFnUmVieVVjWXpnMTFvRE1TYVQ0TUloemplK1R0R2xtbUhQaExiYWRX?=
 =?utf-8?B?ZE1SanRzeG5lMEphTU5yYWNuT3ZKQjZsL1RobXdWbjYrWjU0TnNVQ0ZWTm8z?=
 =?utf-8?B?SGJTSWVSQjFoVzZhTmlMMWh2aUtGZng2ejFhQVpGdUNCMUhtR3p2bmcxeFBr?=
 =?utf-8?B?NEpxVHd2MUtIcEJYYWJKL0g1cWYrUW04SHI5TmFZaUsrSGxZQ3dBUGhjb3Nj?=
 =?utf-8?B?blNiaDlrcWZnUXJnejQ5UGFzTnd4VVE0N253b3FTenFnbXcwanlOV1NMNjJp?=
 =?utf-8?B?YWZldzFZdnpEaDdkaHM5U1lDcmVvNFMwWVlVbVZvbnNTZnBmSTdsSjBmQVFN?=
 =?utf-8?B?cVR6NXRsUU1vNWIreDhaeE5PUzY4MnNGQXc2QmkvYi9KejRISVdoTnlKOUJy?=
 =?utf-8?B?eVRaQW9xWnl3NmtLQTd0RW5VVWpnemJYYUVxcTZpUFV1TmQvdnFHQkNHWEtH?=
 =?utf-8?B?ajBpUkorNEljMzRPZ3R2VnNibUNPQksxWmdIY0FIeDZtTGgrWXQ0VERIOUhO?=
 =?utf-8?B?YWdyMzlXdys4NWlFNExsSWo5bWY1cHBTRFRsQXAxNnR1TitBaldLbkZYRUJV?=
 =?utf-8?B?eWNZT3BiZnV5ZytSVzNINTVBQ2Z2cS8yNGZ3MHB3REphRnFqaUZZNkJHNlp1?=
 =?utf-8?B?dEc0OE9Wb2hBWGFRUmFkQ2U1RmpSdVBQSW9OUEVLL1Q3djhGUUpIajY4cCta?=
 =?utf-8?B?b3B6TzhkOUlUczJSdVpJT0hYeWJ2MmpTYjBscS9LQjhsVzYzWHRTUnpmK01F?=
 =?utf-8?B?ZGYyWWtpNFl6RG5NWXhMK1I3WWdDSzR1RkVkRkZ4eFVWaDdSYTZmQ0NMbEV5?=
 =?utf-8?B?SHdvSGNya01BbTFRVE1BeGNNeEduVmoyTCszaEFlVGF4YWVWZllmVlZOZHBV?=
 =?utf-8?B?cW5DbW5WLytYNlBzckh0anEwRXlaS3BCc3hPV0pjSkVlc1pkODRmNnZySEl3?=
 =?utf-8?B?ekRJKzVyTkZkTWpJWHVuUk1EN2dvOGdvR0VXMVpDN0FtUXlNS3U0cElGZ0NK?=
 =?utf-8?B?TnJCQVI2WnVNbVd3QU1UUVhYWGFCRzArTUhiaVJwazVQQUxTcTJ5ekE0K09w?=
 =?utf-8?B?Q010eVBxSTdENWQ1ZWJiSHBnTXdMQVRxWFl2dXd6bk9tVkQ2UjN5TnZMSmYz?=
 =?utf-8?B?ZFNQc2hBRnpYNTJsVHM4U2RWS0hFd2dYcnpaWXZBemEwdjlXSy9zWkErLy93?=
 =?utf-8?B?WlN4ZXpLVWdnRE5kZ2U3NXFFUVBiQnNyNkVqRHlTZFVvWmFYUUg4N2pIZjBF?=
 =?utf-8?B?WXFyTUl6WDFOd3lWZHRsSWNFWXlBZUdSYkw3K0dKQVFoeHVCRTZheCtFY2Rp?=
 =?utf-8?B?L2hJZ0xOMEJ1Y09yRGlpN1A4ZnNtclYzblA5Y1d6TnEzb3dvVjVBUktTR01N?=
 =?utf-8?B?aWpXcUtJbjZkM0x6eCtubm5Rc1NoQjBvMk9kbW1vS2VOMzM1K2dYY0thcFpQ?=
 =?utf-8?B?V0hRWEh3RWFuQnNrMXlQMzU3RjlzZ1lDL3JSbjBkZlY2bUtqRlNaZHY0dGhl?=
 =?utf-8?B?MDVGSnlHV2RDcCs0RVFneXJ4b2d1Ymt0MmhOVlhJWmpTd2hSMHNsc081ZW0r?=
 =?utf-8?B?ZzNNN3FNUzZSVjFVd2RIRGsyTWdXMkFkREUwZndPcXEyaS9SRjVwS1I4cmZM?=
 =?utf-8?B?OXVjNkdRZE1ZaHJKVG02U3NGRzVLUktHNXU0VHY0SkRMSHJ2SVZtaWVHNHpH?=
 =?utf-8?B?aEF4dnc1SVZ3V2luZE8zOG9xTzlUU2d1elFJVXRmdkNhTE1ZcThzVmM5dVd2?=
 =?utf-8?B?UmZnMWpGek9KYXdXNEpTWHl3QlFHVmtrL2hEelozL3pKNG1nSFpuU0RteWc4?=
 =?utf-8?B?a2pUQ2IxQjA2SU03WU41NXZKMVN6cUpqdGF0bmsyTUZ3Qkp2THczZGl0VU9Z?=
 =?utf-8?B?aTRGR1llS0EvaERlVU8yRlh0L2szMFRXYXpCTGg4b0I2YnVnbGJnQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bee536-c221-411f-7583-08de52ad688a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:09:47.0946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5BVj3ZunM6OOAbdXzAPtvMyuAWuZnHIvyaxAD/fNvukE2nd3Y12CK07NlZ0f+vbnsMkTnWRindFjlF93C2QlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7512

On Tue Jan 13, 2026 at 1:39 PM GMT, Tamir Duberstein wrote:
> On Tue, Jan 13, 2026 at 8:11=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>>
>> From: Gary Guo <gary@garyguo.net>
>>
>> Currently, we generate `HAS_` constants as long as the definition exists=
 in
>> the source, regardless if it is cfg-ed out or not.
>>
>> Currently, uses of `#[cfg]` present in both trait and impl, so it is not=
 a
>> problem; however if only the impl side uses `#[cfg]` then `HAS_` constan=
ts
>> will incorrectly be true while it shouldnt't.
>>
>> With `syn` support, we can now implement `#[cfg]` handling properly by
>> propagating the `#[cfg]` attributes to the constants.
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/macros/helpers.rs |  6 ++++++
>>  rust/macros/vtable.rs  | 13 ++++---------
>>  2 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
>> index adfa60d8f42d8..11117b4c95d25 100644
>> --- a/rust/macros/helpers.rs
>> +++ b/rust/macros/helpers.rs
>> @@ -7,6 +7,7 @@
>>          Parse,
>>          ParseStream, //
>>      },
>> +    Attribute,
>>      Error,
>>      LitStr,
>>      Result, //
>> @@ -53,3 +54,8 @@ pub(crate) fn file() -> String {
>>          proc_macro::Span::call_site().file()
>>      }
>>  }
>> +
>> +/// Obtain all `#[cfg]` attributes.
>> +pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<Ite=
m =3D Attribute> + '_ {
>> +    attr.iter().filter(|a| a.path().is_ident("cfg")).cloned()
>> +}
>
> There's also no need to clone; `ToTokens::to_tokens` takes `&self`.
>
> https://docs.rs/quote/latest/quote/trait.ToTokens.html#tymethod.to_tokens

Indeed. In that case I feel like the line is short enough and we can just i=
nline
these and skip the helper function?

Best,
Gary
