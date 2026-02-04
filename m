Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF533BBA2;
	Wed,  4 Feb 2026 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223834; cv=fail; b=g4lAPNVbDVR9iIZrO6Cc7+jcvE+8fUrxPgfjDkqisg0z/UQXSV6XDut9fsiReg8OK//ZcdqpcrbL0FdqkHzyVd8Cvyl4SKQjPuolm3AriZbYzHl0ujkNTJrC4h5YZqwbRtLZhU7wnFo5WKYRBuNMtdizq+qr0OfSF/9ANNwGFD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223834; c=relaxed/simple;
	bh=PjkOcnAMwO2BqZLfKHmTKy8MEJD3QE7qOOihLs/pols=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=dEHW/2pAyeNJfEgSANRt/lUieTJZfEhjV8g6ouGf5hJoyBgW26NajVcgWKZtLpqL/ELwy1ccJ3OucWE9O06V+zExfPLN6NdT8ZltUPKHu1+YXfIsxsv0PUtEXwP49OhQzMi1pZYzsPgKX7SBKK8twyU2dp2B5UBVuOjVjQmMD1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=YfWFunJ3; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="YfWFunJ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2dKirwiyMGtP+Nrv9YCCPRfTl9xSa12A/bTpYE0q5d24kL/O/hE8/rwNxtcKdWFP0nxlWKsCg8AugoiOGcM7n+Ii1W7UXUC6hveVES7o8VRRFACtZyyGw9S+0rPcMwMV6o7QzIxwoKN+SlqlSF3TpsBmqrmWkMLuDAPzeExuRkv+ebyER4KimWBNb32MzeXKnccTji88RMgAtaW1i8zubx6Hb5r9WSVg8Vfi+oaYX82GHFjKdgBrhUYpdgx/HfXp09ZwZ/BCf0aTJaTjQLjcfauwvht0MkM3tbwwUoKqf86uFZFq3H4VoGHX8FTGPpt94P+CuGVtf/jK/dYcRHfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjkOcnAMwO2BqZLfKHmTKy8MEJD3QE7qOOihLs/pols=;
 b=Z+v1ER4zoCbfwN3TVpTV56DyYbiECM9d27pe9jayyZkldKCp9s1IC0H864/Zjx+qjsZLAkjbi24BC8CeMJy3p7TrfrWWamCbZrjgtnNqoT1tA0N2uRwtfaZLlFkToblzeLaAAZmqccP2h1+UDSP203GbK58Qq59wABrKey8UANJDelfcj5Jnkxi1oVBbIDiFunJxSosFa19Z9EHHIrhq/uCOewRX25VfR8g94RRFNkJ27IQuqM64DZIIT3gwmD3ZuUDhqgS2klWzNf1I25WJK2dnmszmEC1f4Z4YOr9PhJz0dvLP8hn9rFDImqa40wI5WoeYb9HyNWSk6fyybnwVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjkOcnAMwO2BqZLfKHmTKy8MEJD3QE7qOOihLs/pols=;
 b=YfWFunJ3j7eC/fTw40tobHxZDKuaJ4JBTKNhwEkpD2+c+hBvcivpBxM7f4Js67f58OO/zw+Jj7A3ZDz6juxrurt48fd5YyhFFIfYYc19SbeG3FPINVPsfHoF1jp8nwHpzV/gxaMV17K1T7XXUYB2rrog5zOtAvKKv7kQUjk9Ry4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6776.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 16:50:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 16:50:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:50:30 +0000
Message-Id: <DG6BZ4R8RY9J.3VVG4I2AN6YQJ@garyguo.net>
To: "Marco Crivellari" <marco.crivellari@suse.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Tejun
 Heo" <tj@kernel.org>, "Lai Jiangshan" <jiangshanlai@gmail.com>, "Frederic
 Weisbecker" <frederic@kernel.org>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, "Michal Hocko" <mhocko@suse.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new
 system_dfl_wq
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com>
 <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
 <CAAofZF5pqsGvnCS5HbmQKT8b_ydEnycv2fWF=wbFkSgu+ds2gA@mail.gmail.com>
In-Reply-To: <CAAofZF5pqsGvnCS5HbmQKT8b_ydEnycv2fWF=wbFkSgu+ds2gA@mail.gmail.com>
X-ClientProxiedBy: LO0P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 9062b723-8110-4fed-e4e4-08de640d8197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUwwVkptS2E1QmplWmJMUThEa2IzcmNSRGFCSFR6d1VXaG9uQitFc3VyK2xO?=
 =?utf-8?B?NGJ3L094MDFoaHlNZDJ5ME9SSm5kUlNrU0Rub1hiOXJJRXZzbXJSVTFrZUE0?=
 =?utf-8?B?Y2dMMVRnRDhkTUFIMFRIQmpQbGxha1dkVmJXQ3l2NkxBdjhoYk4zTHR1SXY1?=
 =?utf-8?B?V1dHaW5MMGwwSjVFVW5id3pNR1pmMGM3RmVDOFlFVEVocWc4UzI5cWJ2bjg3?=
 =?utf-8?B?bjNEckNjNkw5OFpHaDEvMU1RVUs1dlpsNVJLdjQ2Z3RGVVlWVjZPTWtPU0lr?=
 =?utf-8?B?em9nUFJZa3JNVTZHRzRBa2tTeTNiNzlBa3EwWVhDRWhWSTBId1NXSzhwNmNK?=
 =?utf-8?B?ajVyMmU0MXdTZEkxUURJZXpsaGNTaUFYR0RBdStmVDZLRzdvVlh1cEtnZEcr?=
 =?utf-8?B?MlBnYzJIKzlnSXkyZHVXbklVRDl5Sk0wNUpudndITEdzdDNFL3I0NEtPY0Q1?=
 =?utf-8?B?OXgxUGovZGFON3RLTTV4WU1vOUV6Z3YzM0paYXJLT0g5NG5JTzdCb3oxaHg3?=
 =?utf-8?B?RVRDRzcyQm9RdlR5VE0zd2Fta0xZcHhSb3hIK05Ia2pRMlZrbE1QWEFUeGVK?=
 =?utf-8?B?bDQ2L0YwK2hmZlBoZ0pZYjBiclplVHRxYnZZWU1TaGJRVFluZ1dWcFhMNHI4?=
 =?utf-8?B?eWpLdmV5ZkFpT0VGVTlsa081RWpHZGlzNW1ZOE9JaklIeExSNXg5ekEzZG1S?=
 =?utf-8?B?ODV3UE9vbHlhRTBYWTBoL1c4bktNMkExVkdHZUNjby9UdUxBNklaT0FzY1F3?=
 =?utf-8?B?NkZlc2t3MklpdmhSUVBRcXBKUmV1QWkvZ1hRRFpZTFZhVjdjNUVEaG14WlZI?=
 =?utf-8?B?Q3N0ZFFlTFhBWjN0SzFOVEErZjlpZ0tXWTZCRXVkaHZhSG94NkxpeXJwd2Fu?=
 =?utf-8?B?MXZxdDFQOXJkRG5rY1hVUTRjRXliWStDaDg0UlpyTGpUUUsrMVhwN0RzMTNJ?=
 =?utf-8?B?cDQ4QUh1WmRlK3U1cUZvbWI2MWo5d0ozOFdHTUFVMitQM3FCK0pBZ3dHdHdl?=
 =?utf-8?B?U2FuOXpjYXJyQmdrUzAvTGg2U2NaUXk1ZmhvMFFFNXo2VFMySlc5TVphRVZD?=
 =?utf-8?B?cjlYckhCUENPMURKU1JMV29iK0QzSWRPMk42MkF4T0Zyb2hjS0FMSU9wVWNp?=
 =?utf-8?B?SUhqdzdIeWdDS3RPWDNRRnQ5OHJad1Q5RW9xaWpqeXh2TWxNazcvWEdaT1Vi?=
 =?utf-8?B?NjFiUXFqYVFSUHhuTWFiNDVEZytWbjZrUklMVDhhKy9JZHJ4YnlMczhXR0pR?=
 =?utf-8?B?UHFQVUJIUC82aU1LU0dlK1JVZlMvZVF3blVXRC9tdHFzcTNtODczMFdYa2ow?=
 =?utf-8?B?M3hjQS9ZdmNWazN6Qi9YajExSDJqWERFcS9yNXlqZnFTM29HT09jcDVwV1pT?=
 =?utf-8?B?R21YV3J2c0o0TVJ0R2xBVm9saGJJMnh1LzcrZS93WVFHTm1kdDZhQ1JvdFdL?=
 =?utf-8?B?Q3Y4QkJ3VkxCVHlIZ0VUMnlOWkh2YXdEL08yQkdFei92VGd2YXVWdnFaVUJY?=
 =?utf-8?B?amtTUVNQWlNrck01Q2FGOVd2U3VGUXlIV3NMRTRXWERBd1hMMWFyUk9WaFli?=
 =?utf-8?B?UExTcTZwNzZnMENGcThCdzJQY0RRR3J2L091V0t5TkdMN3QzalZiMitWb1kx?=
 =?utf-8?B?cGY5T0hqWWh4MzRyM0txRk93N0pKWDVlSERVcE5OdE9yVDF3T2FkNkhKMkRq?=
 =?utf-8?B?YTYxdW85WWh4V1BiNndkdERaczZzMS9TQXNpTUdnOS9ERUFRWUpUY2hKR3FZ?=
 =?utf-8?B?d1lmLy9mcDhRWFFFTzBOZ0FmWi92UmM4YURCcmp5aEhjOXc1ZG8wUHFCVWZR?=
 =?utf-8?B?dzhodGd0Sy9EZXNvcEFmNEFXNkhxWTVvNDA1ZGIwZlRRVFVoTkVVM0dqanc4?=
 =?utf-8?B?VmxRMWl4eENUaStDRDJtMXN2Q3VtYUJZRFB3MU9lSE9YeWZPWGFzRG1yekJz?=
 =?utf-8?B?ZXdwWEtSNlAxSkRaZHdaYzNkREZjKzNoTmxjNTgxT0hWbmRUaGw5MEVDQUNj?=
 =?utf-8?B?MnNhL1VKV3R3aldJN2NJejR2SHQ4TEZFM1Z1VTJQR3hvcUk4L2hDK1RRcHVJ?=
 =?utf-8?B?MlJLVjZURmhKTkVJdmxielZXQVlZQUVyME5HR04zRWUwV3M4NHo1VFZxRWxV?=
 =?utf-8?Q?tHCM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STkzQm5IM1AyR2dRQWxoc2Y1OCtjVkJWVTR0Qlcyb1RIbmh3RmJWdmFFdkNC?=
 =?utf-8?B?d2NySTN2SHdUdXg0aHNmMk10OXR2M1BtaGJDK21LbTBKT1ZoQmpoTDROc2xF?=
 =?utf-8?B?eUVhRG4yR3pxNGwzQTVlNlNNbHFEdThDV2xhWmZBNVgzb2FJbW9YMG9yeUc0?=
 =?utf-8?B?b0MzTlRKZ2tIM2VqbHZkTDBCVmEvdmhDYjVEQnJLTHUvUnJvRmdrbkVCQ21W?=
 =?utf-8?B?OXhJSjhKWGZMUGVhbEZHcDVjTnQ0T3JBZTc2VkZLRVcrQW9jb1Q1b2hRSXQ5?=
 =?utf-8?B?WDBZbTRvOHRPMkcwVUFhWi93MVpLa2xQdGR6Sld4b05Jbkx3L1V0Sm14TE45?=
 =?utf-8?B?bTZKbEUzQk5talpWVkh4L3dwVUNMdWVGMG1EVGh4aTJxYzkyZ3loWGtmakRP?=
 =?utf-8?B?bUN6NDNVRjRXUHp6cjZGWnRvTTFqejJyZ1I4YSsybkluSWRObjdJMEJEekJH?=
 =?utf-8?B?WmNKamNkK3VvbXVnb3FiOWpDaWVKWFpyQjNPTlJWTHpqbEF0cFA1VU5NTlE0?=
 =?utf-8?B?Zk1XMEhrOHN5MVkwdXZZTFpXbHpMZG5rT0g4Z1hGUnd3MUM3YWZ6VG5XcnVZ?=
 =?utf-8?B?SEhXUVpvcmpsbVJ6KzlMMm8wSnVERUFlcFFXWXU0OVVUcE5aUHN5azg4Y3Ja?=
 =?utf-8?B?NnQxQXdUS2llRG5odmh0SVVCWGcxTUpLc2MxU3VhVFpyZWpCTnJzTDNNQysr?=
 =?utf-8?B?aWI5K2tCS1g2SlI1MVB1b3JiRlRuVzVoclJSUkoxcXNyT3owdHE2Y1NyLzNs?=
 =?utf-8?B?UGpVUmoxUlRmUzBzdUdraE1XQ2RzU0lua1haeFh0aVpERzJ0V0VEYVdhVXJQ?=
 =?utf-8?B?aGlSSm9GaHArbkhmY0xTQlhPM1RRbUtYTTM0MmVXaC9TRGdIa1Jna2o5dCsy?=
 =?utf-8?B?TitXVDRkVUVtUkVKOWluMFdjY3FEL0xQN2ptMVVkNTZWRk51NGJ6UlBOQVJI?=
 =?utf-8?B?T0JFNGt0cTJJWjhBWmZEeG8xRzQ1THFRQ2xqTTlRZGorTGorWlpuNGpKMUJF?=
 =?utf-8?B?SkdYdlIxUlpUV1VWOFIrQ1BCVElVVVhaN0czRnZnNU9sSjRia1VmcWdsUmZV?=
 =?utf-8?B?Z1ZMdWtTdkUwOEx6Mmp2Wkd5OXJCMUlqTUdTbGhtV21sY0VBY2xwODZtQUY4?=
 =?utf-8?B?Ri9TZU55VlBUSmROTDJrd2thOCtrRGNnOE93MER3L3h2N0pDajhSYmxXdUs1?=
 =?utf-8?B?U3NtcUZNK1I5MERpdHI5T1lZWnB2dndPd2FJdmF1S0Z4a3FzSGZ2aUJ2YXhO?=
 =?utf-8?B?RHRvWU5yU3ZQc3Y5UVpSelVhUHFza1R0eUdJRldSRmYzcEFyWGhUQ01meDM0?=
 =?utf-8?B?aEtLY1A2VkxJc0NHSkdxSW14S0FVNlh1RjA2UmFEYTN4bjU0cldWZU1pc3lt?=
 =?utf-8?B?bVBkVzJ3MHdxRWdVWUVNUW9la29KNmdWazlYYXdhS1VISHVUVEVqRjREM2hD?=
 =?utf-8?B?dHQ3RUM4ckNhaXdCUnhCT1BOVVlqSzQveUc3Ui9ZVG03WlJIV0tpRkhmU2ta?=
 =?utf-8?B?UXdGWWdaV2loamJ0NUdBMXhuK2xaRGlDNjRHbjhZWjM5MUtZZTRaYkhYVis3?=
 =?utf-8?B?UWNBbUFUZUlZY2ZvR2hlV1JzVlh0RFR2aENyRVh6cTMvMVg4Rmh2NGk2Q2hn?=
 =?utf-8?B?YjJVSzlueXN2cEk5UmluNnN3MndVeUtmeG1LVVRGSWhlZHpvaUZBQ1pYTEJH?=
 =?utf-8?B?cDRhbVRsRVAwTTdBSUNhWUFaNWo4eEw0cHp2MzVUQUZqempiRVorRmhyd0tt?=
 =?utf-8?B?Q0JuL2pINWJFN1IxT1JsdDNPZ3Q5Mk12bXd1R2VpWERWVDUvbENPTktRakpW?=
 =?utf-8?B?RVFJUHhhYnBDTTVmcUU3cUR5dzRORWdEZDgrRWZoZ2NDYi9FOTlOcVY3UE9Q?=
 =?utf-8?B?cTdhS09TaVRxTnpyUmxUOFArMlNaUE5CQ0x1K0lHT1doN3BxOGpISVNoL09X?=
 =?utf-8?B?NDkrV0V1Ymdxck9Bb3prRkZyelNxdGV1Ukx4dlBRVGl2VFhSY3M2cUdBUU5l?=
 =?utf-8?B?YUlWSVNrZFI0ZXZWeVVOdHgwL3NzYXM5Y3RkRkpnUnlERm9BWHVFaHZRRU9C?=
 =?utf-8?B?WnlienlsT1FZZ2VDR2t3Y3EycHFnNFBBYzJZV3ZDRHZQTDQrYmt2NlhLMXFy?=
 =?utf-8?B?bkl0M3czbjZMdmpicFl6OHNjenl1KzdBaGJNc1VaeHFEOFpDUmExVGZsNnhE?=
 =?utf-8?B?aUVVY2NteGZEa3RSWGNKRE1LZ0R3KzBJQzNXaGFlYklvamRCOHdjUTIrNldn?=
 =?utf-8?B?b1NiRE9hMG5ISzNNVC9FcU1QOGVvNTVYRmtLMzI5TVhGZTNOYTB1ZFlaQXh1?=
 =?utf-8?B?VFB4Qkd6MVFQMWozR1hwdlhJSG1mMmNtZXNJVEFWSmpGcWx4SmxsZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9062b723-8110-4fed-e4e4-08de640d8197
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:50:30.5669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqD1xLl8c/LPk4RsPvWkzo3LOYSWYDE6IULoanIuIHVULMgzH8qEB7YWxDTUdR6TZxFrbAbn7J8ecfyqOqhy+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6776

On Wed Feb 4, 2026 at 9:43 AM GMT, Marco Crivellari wrote:
> On Tue, Feb 3, 2026 at 4:53=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>> Hi Marco,
>>
>> The Rust change looks good to me.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Hi Gary,
>
> Thanks!
>
>> Is there any reason that we cannot migrate the user early by just return=
ing
>> `system_dfl_wq` inside `system_unbound`? (I guess the question also appl=
ies on
>> why system_unbound_wq cannot be the same pointer as system_dfl_wq).
>
> The 1st version was like you mentioned, both for system() and system_unbo=
und().
> It's one of the request made by Alice:
>
> https://lore.kernel.org/all/aL1lkN5WcWkwiq3S@google.com/
>
> To me it was ok to change with her suggestion. :-)
>
>> Also, I feel that `dfl` is not a very intuitive name. I searched the lis=
t and
>> the commit history for a while and cannot find the exact explaination on=
 what it
>> means? Does it mean "default" or something else?
>
> Yes, "dfl" means "default".
>
> There is a huge Workqueue API refactoring. We also noticed many subsystem
> used system_wq (the - now - old per-cpu workqueue) but many of them didn'=
t
> really benefit from per-cpu work.

Yeah, I appreciate the system -> system_percpu renaming which does make it =
clear
that this is percpu. However I think `system_unbound_wq` to `system_dfl_wq`=
 is
somewhat less clear?

What is a problem to leave this still being `system_unbound`? User would ne=
ed to
make a choice, and unless they know they want `percpu` it feels like natura=
l
that they're going to use the unbounded option.

Best,
Gary

>
> So the idea was, at first, to refactor of the workqueue name changing sys=
tem_wq
> to system_percpu_wq and system_unbound_wq to system_dfl_wq, to make
> clear this should be the default choice.
>
> If you want other details check this discussion:
>
> https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
>
> Thank you!

