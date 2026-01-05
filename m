Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020141.outbound.protection.outlook.com [52.101.196.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D743147;
	Mon,  5 Jan 2026 02:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579484; cv=fail; b=Em/Ib9RlgysDLjx3zhf86x+u9FFfCA5on99yKOOGEEzOtffVuQHQ9kIeXtOBvLPYX6JHSb5V2AuvYPpjV/vSKxmkBnYwewCtdSTZfcPZz6+eW9z4P8WptaPRrJLZ9yyNJ1puPOXgzPm3yd/73YbqKDpr2qJl7Kzy1O8uVd7hfEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579484; c=relaxed/simple;
	bh=Dfy7bklh913cqiKxm5/oQHcv1ZWjVXD0KQC2QiWOPxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RdbsthDPoUDRlSDludnbnlC/gjskA9DBWTv2/Yq9eYmb3ekUNvGTKDubHzRRIVQpJ19pPaLdJz2F6lytNti0f0a01uV/r574c2+CAngLeyln44BCq86yTTSHyTNxKkS2wJLyZsu9P+TZwDNZWaSjlyTVkIuwcgyHyJctLuQ34nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WRPJKRtw; arc=fail smtp.client-ip=52.101.196.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WRPJKRtw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pj1DMrQs0ISX4li9/Y3FkwOmgN+g7u6lkSyQCcI2LivxyrsEIKuL8bPHDxS5lkFtsFTVTmS3zQASzXABAApQVSeXZlaDG0pv8YNOUXkyo8APbvFvsGI1uinfSs7sm8hg2PSlMSGj0xFyY4dyRvMNc1XWMBk0Xe4S+X4+hesG6PoRi8AMBGly9Daa3BJZWxv6SdhJH/s78kEL6gyREPBc9KqC57mWbsTHJlweYotqtuvcM+SY1AGWcTUN3YhpLCVQGsdiPkZHI6hF2WOPpw4ZN7MQea4QVAdzn61R+GIklIqq3QCtp2scq25rL5PooqN/icxmGEqhHtosLzUEUY5Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zYslCYSHOOs+mqp3FCL+RL3MiRNNoROKb3mVru9wuM=;
 b=bm1aqbQBd0WkWRz4K3T3aH+vXLx9Z56Xl0h5aa16JYFo9fZVJljsUWE+31Uu/VvyQFqRrLj4b2+DoL1XOxt5KiiOGL8tBNImvv1sbzKsdDbM1vou7SDrvU3PbL3XCKYHMyG2aM0qnddyiKtsc+KKz5vV0sNSApCXWPtGGTyuzvFzFAhQjDFB6yI1MkGT4jukeiEBmicsuiG2RH9XryUFFGpM1x9Y06Ff/H5JfVQyv1MaxQCxKCLoT4Xm1JhbO98oFizpMEWLiNnXvIq9RhMM0V5erpKIanowHBU/cJ0dQvmDotBdPgdddLy/kP9GZFNZabnhHwkwXJl2jjbbQAQ0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zYslCYSHOOs+mqp3FCL+RL3MiRNNoROKb3mVru9wuM=;
 b=WRPJKRtwF1XtrhJjExuiB9ukfXn0V6lAXneprkR51lbC4gmy18sB8WtXnWV+h/vydoyD4N8C8ODEK9rYVFr+tJ3y+ualXWXaOAkZ2M8HvCtuxrfgEhTxwgRIGtSTneiuL5HvW1niwL1+VcPDcTXGTTJHzhTVC29VH5LQKyO7QZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7647.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 02:17:58 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 02:17:58 +0000
Date: Mon, 5 Jan 2026 02:17:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] rust: macros: convert `#[vtable]` macro to use
 `syn`
Message-ID: <20260105021756.5df32974.gary@garyguo.net>
In-Reply-To: <CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
References: <20251211185805.2835633-1-gary@kernel.org>
	<20251211185805.2835633-4-gary@kernel.org>
	<CAJ-ks9mQXP1mAYOseoUo0jbKD0FrhKOSW7ifgOUKzfrTM4WYeA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 05cf3cc7-cb51-47b7-a050-08de4c00a506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHdUQW1ORElkWjJ0aU9VcVNNbDhHYkwzSm4ybHovZzh3NW9TZjBSQmtCZ2FJ?=
 =?utf-8?B?WlR5d1BteEgxSjl2MXhGRDNYemE2TGVaNTI4Q2VaZWd3Tmd6bWVMbVNSeUEw?=
 =?utf-8?B?OUV2RVg5TTQwcWZob1VyQ2I5d1JiQ29tVlEzK0Z1My9qZlZ5Z29xZElHWTRy?=
 =?utf-8?B?bkx0WERQSlBTdHNDWVFGS2svMjlHejIyUmRpOEl4WnB2K2JycmRHclBhUGJ4?=
 =?utf-8?B?Y0g5WjdSTE01TTFqK2dYeEJ5RWF5NFhHcTBxbjFPYTd3UXEzcnozMENrMWlC?=
 =?utf-8?B?UDBLUmtQUTBBSmF3Z0dMY0FHcEE5WnhJU1JROW52Tk55YldBbHJNSU5iUGEr?=
 =?utf-8?B?TDVvWFkzRHNFWkNVd09udytpM2VvUVp3SzRGWGJ5K2FvS2JlQnNVTHZ3WmZw?=
 =?utf-8?B?NmtBMjVpclFSNUFWc0txdC92dnhUc1pKWmxFMEE3L0ZYNGZqYkVvZWEvQzNn?=
 =?utf-8?B?a2htYjNQUXBoczUzRTUveGxwNUpyeEgvVEtTaUtHYTZ4d3VVQ1RaNzhYVUpH?=
 =?utf-8?B?b0EyQVZuM1lTMjNIVmxxMGQ3NVdUVE1QbnZtNGJTbUkrZXpxTmJKZEhlb1VJ?=
 =?utf-8?B?OUNuUW9lZmF2dEN6djN1bHl2M2N0WEVQUUZjQUN3MktEN29YMEhObFErTUs0?=
 =?utf-8?B?M1hrR0wvMytjTW90OEpiMExYZU9lc0JPNkNmVkhJVkNYRWdGeHFTWUxhNENs?=
 =?utf-8?B?S2s5RWtFRUQyNXRZODlBNWh0ZmE3MWFhcmloU0Yva2pDWEU1dnIvaWk1UGxj?=
 =?utf-8?B?YTNsTERFWWRlU2JPRzVINU8rVE1zQ1FBdVJ5Q0tKUUtBYkltSEdaaFhsV2Ns?=
 =?utf-8?B?WlMxRkIrWmdKZ2RPay9UL0MvOUl4S09Ia1NqRTlpNVdTblMrOHVvb1E1eWVi?=
 =?utf-8?B?djRxWmtoYTM0RXVneitEQUI4aDYwdXBFRllHMngrSy9kNzRMaU5aTHRnbThX?=
 =?utf-8?B?Zmo1ZEtlRXAwcGNQYjJoNXc3RHlBM3pETVF6ZDFnSk8rdjdydXI3ckd1Nnlw?=
 =?utf-8?B?VXA0Y0hsd2NPK3lCd29YVHJqa2plcHVuTWxhWHdLMDZWcHZiYUF1ZUZyMEY3?=
 =?utf-8?B?YjBjeDhMSlgwTSsrbWxCUGxNMExjSmpjdC9qZktvRkkwODE1V25xZFhONWFv?=
 =?utf-8?B?eFp6dDU2UWhvVkpzM3hFZ3BIa2VaZGNnR3g3NEVncmlaR1d1MVQybjRyYldQ?=
 =?utf-8?B?dnYvWlE1aE81V2Q1STdUYlJxOU9HdnB6VmlYcEFLVnI1V1JBVG5EOUkzUFBB?=
 =?utf-8?B?V1pYN3ByUTNtNE9JZTAwdGlMOGpObDJuNXhlZ2NqNHZTZVhvL0FjKzNoa2Rx?=
 =?utf-8?B?YVo1ako0dnlRNm55dzB1anZvVkxDeXhzNXFSSzNWZHJ3RW1zcGxuNndBdXhk?=
 =?utf-8?B?bjlZRENtdlF6UU1UTXNwNjBNRVVzaDhpRWF5VzdoeWg2SUVZNVVaT0l4OFdB?=
 =?utf-8?B?ZDRTMHFzR2pFOEhhMUZJVGF1MzB4V0VUeDYwbVcwbjJyV0kvYzFDbmlhMDRa?=
 =?utf-8?B?ZDFrZXFjbTltN0x0K2VGK05xS3ZkaGhlSjQyWlllcERqbjNYVHUzWlV4L25G?=
 =?utf-8?B?cFJtZklnbW5BWDZMc1lBRm9GWEJvaGg2Z0JRYW1YUFE2KytIc3k3L0lkbDhU?=
 =?utf-8?B?N2dzL1EvekVLOWViRVgzdXZ6SnNyTmQ5a1NKMWNTTDZtUy9QbklnVXFxSVl5?=
 =?utf-8?B?UjFIdThyVnFOblhmMlU3dEorQWczbVMvMnJiZ3JxWHowTmZ4cjN2NUMvckFF?=
 =?utf-8?B?MmJtM1V5bHhrSFlOOGl1UTRTMWhmRTAybGhMcVlTVHM1Z2d2ZHdMcytZdWxF?=
 =?utf-8?B?SXRtbDVvdkNtOVpyY3pHVnNEWWlsOVNJdk5yQTVXRFR3M1Avcm9FajR1YkJs?=
 =?utf-8?B?bmxBaE1udFlMRXVkaHY0TlUyZWZqSkpKTjZRTzAzaVRnR08yNkJUejhWL0tD?=
 =?utf-8?B?dGhoTTZRbVZhWUtMMWdwL0lucHZ2blpleVdmSjdQekZEbnRtZmVPM2tYVWxu?=
 =?utf-8?B?Y1FuNEJtSEpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFVMWGFNN29BSDR4aS9hUVNsczIxN3ozOEVPQUU3c2xWNGRQZ1ZqbmhlbDg0?=
 =?utf-8?B?NlJ5K3F1S0xmODF3VGM5bDV0QzdhK3NuclRteGtnQzRHYjJ3Y0RPUlEzeTZ2?=
 =?utf-8?B?aExYeWsrTWx3bjhJUHBuS3RUR0dob0wxMWpteGdUc2FIWFphalJJMDJtYnVq?=
 =?utf-8?B?VlZmSVVkVWxzTS9YbnBHMTAyQlpqdE5RMmRWQkJGTWdsUC9jRk5OeWcwMC9w?=
 =?utf-8?B?Y2YyUGdENmtIdXdSY0hvNkNIaFR4RmpFeFBDRE02UXFrYVpCTVM5MWU1VWFp?=
 =?utf-8?B?UXVGd1FrV1JScE9qalowMlRJS3hXVFo3NHRQRGN1d21VTTU0OG1TSVA2K3o0?=
 =?utf-8?B?RkpuS2hxSm5IQXU2WEhnUm4rbVJvaUd3MGhKVHppdnlmalpkb0FISXNpRE1F?=
 =?utf-8?B?NENCVnNpK2YwNjN4SjV5U1A4VWJHelFlcHFUMS9iK01mb0M0dFQ2dnhwVjJi?=
 =?utf-8?B?MHRjTG81NExkVVNmMWkrREpqc1VJVlNQQm5PNzhVMytVL21rTTAzMW9abmlT?=
 =?utf-8?B?cm9rQjIzZ1Rxd2t4ZTh1QkZUYVVndmhQTGJwSWpBYzZpOHlQZFZXdHBiREtW?=
 =?utf-8?B?VE5TbmJmL0R5cmlFRVNheVZUUDNSaG1Cc2M5TWRJZUNRbXRNdzN2aHNpVXhV?=
 =?utf-8?B?YjNDWE5hTTJWZ2tJQ0RlL2g2Z21scytNTmlMQU9SV3VJVEdKeTVNbHlTVEdv?=
 =?utf-8?B?eEdua1NWQjBYNkdBaFFROG1ZZ3RWcmNlR2cwY2ExSkhNTkRKSURjdFNiYzh4?=
 =?utf-8?B?b05jWXpLUGpZUlppMkhpdDdjU0NDNmtGTXBvazFnTzMxZkg0Nk1qWTAyZmZX?=
 =?utf-8?B?UUhOS1NzNHFPTVE4aXAwam1wdUx2SzczK2xQcndLNmFUck53cGVCMDZFRXpV?=
 =?utf-8?B?L2J1ZkVrb3NtOTFIZm05TUJONWdoSWVHSDBkVDE2citpNVlIc0Q2OUdpL0Qr?=
 =?utf-8?B?Ti83bWlCenQ2eTZDWGJGNUZYMS9HUFJMNnhVd1dkNVdlR0FTOGhXN3h3RjZn?=
 =?utf-8?B?ZTJPNEdPSC81RFdIdmdvek5WOTZ6amgwNnVjNHBsWVl1d1A1M3d2U1l0czlr?=
 =?utf-8?B?SDMwbHErMGQ4ZHVLTGpvckpSRWRxRUVrR0JZbzZ1WWpjeVAzWHJQSGFQUWtj?=
 =?utf-8?B?R3BTcmptMzRIcnlEaWN1byt0c3F0aGxsZitDTm9UVFBScWVuVCs0OGZ6bjFE?=
 =?utf-8?B?Y2Y4c2lOelorcWZDbTJicnViTDZoMVZ0UlNQb0lYaUU3WHd3L1VyTk9NOEtR?=
 =?utf-8?B?Y1lzY0laZHk5UGk0WVNHa0NrOVNhRGh0V1NQeXh6RVFvSmQxR2pkZVFJTW5u?=
 =?utf-8?B?Y3daaVBHbkdVU01lSlltZmRWb0MzYlpKZHAweGNDL21MN3Nxb05lMnQ2VnJS?=
 =?utf-8?B?UlhibldpOG5PYncwRlJvYnVlVzE1elRIdXdrV3FsbEhscmRCZFlWajBicENj?=
 =?utf-8?B?ZVVGQnJrcEJrczBhdy9Xa1RKbG40MWdkeWVxOHllVEZncjQ3TGVpdjQ0MEgx?=
 =?utf-8?B?Yld1Y1hXbnhlN3hMTUJ5Uk1wa3N5RUxieFNlbXVMU1M4SFpGMGRGdGp6MGtt?=
 =?utf-8?B?VlFpandaTWdLWERLbnV3a2JGWk5TcG00NFVST3lxV05GRURRNzNUbzNtKzJH?=
 =?utf-8?B?aTNUUmcvbEZLSktNWWVIWVZSaXJ4YkNrc05lMHZHYm9ST3RPcUl1dFNEbmhs?=
 =?utf-8?B?K20vbDdUVi9uMlk2NFRCbkZVYk1zWUdmZTFCYWxlKzFkVUZxSGtmTXlrdFRM?=
 =?utf-8?B?ejEyVGlEbk1lTkROMmJWc04rNERxc2ZrYzQ4N3VYQ0VocCttMkpHbTN2VVlE?=
 =?utf-8?B?dUkzTUw2eEZ3RnhLbG9IZU0reURFQWZjV1RjQU13Q2d4WlkybUthSXZkc1ZG?=
 =?utf-8?B?U3N2bzJrZFNtMHJBR1lDUndOczRLd25zdWtSSG94T0svWWdKMzB0RUlhVjd3?=
 =?utf-8?B?bW1IamtEUXYzaDdST29ZNEQzd2xmV1g3dXVSdmJCVVdkbGpTbTYxQ3JNTW9i?=
 =?utf-8?B?by9tYXBObitJWmF1Rm5MOFl2cFNxSjVpWERzTXF6ek9QT0dTSXh1ZVR6RXY4?=
 =?utf-8?B?REJZc3RvMFpxMDFIQzA0dGNxRDlSWFhWYzhzQnM3cHc3U2NHQWdZV3ByRitU?=
 =?utf-8?B?WVBkY0pIUnRyMk9GWGFNOTNDWm9oNjl6UFliR3pPdWZlOFREQ2hHYWM3M1RC?=
 =?utf-8?B?QktpVVByaWdnNkl1M29QdVRoVVMvY0lpaU10MXJRQnNPOGs1TmlTZ0dWTTZR?=
 =?utf-8?B?NjV3MVBPQkxEdXY2QzVORDQ5VzEvaHFmcFJLZUk4R3lISjNIb1BydC9EblNO?=
 =?utf-8?B?d3h2U3hTbUtJVUFlVGh5MTEvZUl4ZHYrQ0VSK1JMQnpKc0IrdG81d0ZrQUhJ?=
 =?utf-8?Q?BFqh9AFsOfBapIlsaXSUxtcyDCmf/gzkTFxmS?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cf3cc7-cb51-47b7-a050-08de4c00a506
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 02:17:58.6766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORn7gev4nUkc06y/Ab9qVDKO9pM08LqoiM9gKLJdXplOHKLMNN25hMo/lCJgCyWOuCp0ESB88ETBynkGXvGbYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7647

On Sun, 4 Jan 2026 18:44:43 -0500
Tamir Duberstein <tamird@gmail.com> wrote:

> On Thu, Dec 11, 2025 at 2:29=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > `#[vtable]` is converted to use syn. This is more robust than the
> > previous heuristic-based searching of defined methods and functions.
> >
> > When doing so, the trait and impl are split into two code paths as the
> > types are distinct when parsed by `syn`.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net> =20
>=20
> Logic looks correct, but the duplication between handle_trait and
> handle_impl is unfortunate. I golfed on this a bit, see if you like
> it: https://github.com/tamird/linux/commit/8354c5a48769f5e1e52963d19ca57c=
31e5926b08.

I very much prefer the code to be separate. The trait and impl *should*
be different. It's just that they *look* similar.

Defining

	const HAS_FOO: bool =3D false;

in trait is defining a new contract while providing *default* value,
while

	const HAS_FOO: bool =3D true;

is implementing such contract with a specific value. They look the
same but I think the way `syn` treats them differently is justified.

I think the fact that existing code has a boolean and do different
things based on it is a good enough supporting reason to handle
different code path.

For some new `vtable` features that I am working on would require quite
different impl between the two.

Best,
Gary
