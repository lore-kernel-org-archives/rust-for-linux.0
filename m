Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020124.outbound.protection.outlook.com [52.101.196.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6FF3770B
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696115; cv=fail; b=Vh9MFbfVMCHr3ezK0OB2K3mAUgruH6+iWBi3TKCaqQJT2WQDHFu6K61u3gMcN5y90YF3qt96dVXALQSK8+NkM/AqGXL4ln/92KVF7uOt75bNQ/Q0mBg6rRUQ9EqNsZZdQ4NrNEkQDDJ2I0XkoSzy4LYYPAckx3dZvIvJVRoh9n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696115; c=relaxed/simple;
	bh=4QHQm6pjpYwIMw3wI0xJ77uR9wO8WPr4whCPTzU1rjA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cyyi5xrSlGpmTjhJbQxnY5rRkpg9LqcGP4veHZrajkfDa/wdM7g4LFJVEPEmuVTymnHloCqKu4sPG3lLpZFEE2Nc9oRlhyczADXv9MA+S3zzCMoSUz7ZIA5LbbCUeFSswPSktkfF0H/33G0fsnYM6J6SLUFXhu0nw4VCyVAzJvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=cbrnawEd; arc=fail smtp.client-ip=52.101.196.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="cbrnawEd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWHSVALPqpqTsKKQUaHEAgOGISRoxMSrFNVZIBZ//xGTMsVEP2OMlMEz5sOJjOBKl5J0eq/E8bfk5J102FeCdORSNtfdcGvnGo90yyObJsUmqYNLlv5+pPQqQGpDFTYHs6/+AIPq2639MD9w2TdrRFLNvWAe1uTdKn8QKHAfxNhn6jZMClF/wq5Ck+A0WZXzimy9p3zPLilrLnWc92xmZe02URGUs1ByZxHLzBuAxopFQXCCc85KZQ0hWZN98bueYJKzcXyRSaPQsP4Cb3rrcAZsJg0zO1BmXmXSzJTYKe7v/ClAO1N2llGW//oSzt1WEfO4G6GAzg4QbWrN2lbTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H805vefgChcIUWvIfrpTCpzhQHLkNIgtCcz4GlMA09k=;
 b=sA2fHuSOEC5g4LaougZF5WSBxPWHZvdXiGzhuMUEsJJwGpv7EisMmxe2o67WoJrOTeXeH6rvV8kVwB3kYxl5x9HuADMiR05I8MVCSoMvaW6trnoW4SxRaLfuDJ0REYvJz5ADTpAWFAyLKmo6wYa5XbKDBwJewmw/7esIvnAda7HCQhjH+7kEyzKw1HlZYjIv6Z7N3NPbqVlZu3aCOQb+qWDbJFEKXpSyh4DV/kEdKjUo0qHuxYwu9xdSVN8Ioc8mUALiN48L5sYCVqTM2ViI4oca3KAVWwBKu3mHoOkWfop/O8P2Iqo+Z3FIODNax9+Ih1V2NAcN2ZEmsGxJRihIHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H805vefgChcIUWvIfrpTCpzhQHLkNIgtCcz4GlMA09k=;
 b=cbrnawEdDRC+MoH4oE5u7wyT5hSSukcrm8fYFnNgq7Uac38wBNBSdg2C7rpSFet9/2CSAo82H0BQ9mSnlphCx1LmZoFlwF8X0bFAKZb40Ur4XmnGuUQjH03ivoH6prBDrIw5bFWu7vuSNLZV3LCdd6n3rOq+ZEiLfuFZwGv9kJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2181.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:15:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 14:15:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 14:15:10 +0000
Message-Id: <DG14WXLRULYY.268U7911TMRLE@garyguo.net>
Cc: <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>, <gary@garyguo.net>,
 <lossin@kernel.org>, <mark.rutland@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@aliasing.net>, <boqun@kernel.org>,
 <ojeda@kernel.org>, <peterz@infradead.org>, <will@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260129122622.3896144-1-tomo@aliasing.net>
 <20260129122622.3896144-2-tomo@aliasing.net>
In-Reply-To: <20260129122622.3896144-2-tomo@aliasing.net>
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2181:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d232cf0-aa36-4e74-a39b-08de5f40d00e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHN2MDA0V3BQMVVEOGErVlMrSGhZQVRaaGUrcllZbVF0czJvbUhzMk9wTVUz?=
 =?utf-8?B?c0wzK3JwdHE2VVhBQ2x5T1p1TUNVKzRld21YTDNMcyt2Qm9MUmNPOVRqT2tn?=
 =?utf-8?B?Zk9CS3BpUGdBdE5qeDN2bG9OSEdSV3VOQmsyZStqa3cvTUk3QnRwTU1WRTli?=
 =?utf-8?B?RDBDSC90V3AwT0k5V3VodDNtTnBMSzFRd2hsa2dra0JYM09TdGNJOHhPa1Vm?=
 =?utf-8?B?MlY2LysycWtNOVNzcVF1Yk50aFQ5UXNTdGNhNXBQclFvMnRGWHpyTG5LUy9G?=
 =?utf-8?B?dlNXcm9MZ2FUTWlzNGNYMHc2RG12bk5kYW1PS20wblR3SGt6dWdHYXhLNFEz?=
 =?utf-8?B?VmUvTVlYRk1ZbENKak4yYm5vMWZmb2I4Ump2QVVJY1MxR2Y5bytqdDRCMDhI?=
 =?utf-8?B?ZjlMbzVONkxsWFp2YkY3SncwWGJ5NmpJU1c0NzJoZDJZOXF2NUhaMjFUc3BW?=
 =?utf-8?B?eGREOWdFSUFGS0pwamlXWDJaKzMrRUJnaTZraFZyc3lTVEZFQ1dPZFUyQVRO?=
 =?utf-8?B?UUVTY1dROHJYdnFncEhWaFRodjlGS29qMjE3QzVVcjVrNC9vSGEybFhTekM4?=
 =?utf-8?B?SXBYN0Ztb0JHeDl3Nk12bzRkeW1OeWFJOWh5RU1EZDhENXJRUEw4TTJxYjRE?=
 =?utf-8?B?ZE03akJ1ZjRVYXdNSnhXaXNDSHB6TzhBSHlyVzRoUjBFZkwxd2JIOVlWTEdQ?=
 =?utf-8?B?T0ZRS1lMemp0NUdLNlVxeHAvNzF6VjFoSjNNWTduMElMdFFwUDdQK0xrVkU1?=
 =?utf-8?B?Y2J1SFVsRlZnQWVZOFIrYmxCVGhPNXpsalFTS2NIb1VoRUdobGdpRThqUXRy?=
 =?utf-8?B?dndBeFZxTkRaM2ZDMUxEQW80SGZXemJyNG56ZjhuT0FWQ2FoTW53b1J1OXJN?=
 =?utf-8?B?Z0QvdWVUaHBua29DeWxSRGM2SmduWTQ3L2ZkVEsyaUFiV1ZuaVdZdURyNzRS?=
 =?utf-8?B?SGxDeFMzTzQ4ZnJzblRvZFp1VEx3bERKakJ0VE9qV2JXWU92K0ZZUmtrd1da?=
 =?utf-8?B?ekxZOFkxOXdMOGhYeTd6RGN4UC9PTHRJSVJNL0RZMGF3K0YyYTNuNTVJZmZL?=
 =?utf-8?B?Uk5wUG12Y0hYVlFuUGJObmVHQ1ArODhLSUxXb2k5d3FVT1J4MTNma0hCcStD?=
 =?utf-8?B?OVRZZjRxeElicXdleUViOEhaaklReUxpMW5qT2JOVEZtczlPL2FjV1dyOVZt?=
 =?utf-8?B?c1cvNUxwU3N4NzE0QkJIMjZyNUEyS2lwL1I5ZWx4RmFHM1VSMTNYQ3VBWE9u?=
 =?utf-8?B?L0JxWHF2dnRoV2xmaWk1L0IxVHpwL1htT0NxUFhxOUwyU28zQ1NXblkyNEZM?=
 =?utf-8?B?eVAwQUNnUWpTZHd0K29TU0dRMWl5eXJnd0FCTXhXYXZERjVWTGNMSnBIcXFt?=
 =?utf-8?B?c1lxU1VMaHNnZWQxWW1RL09DYm9UUHo4WXJRbGJGaXluSmdXZnZHZDJsZkFZ?=
 =?utf-8?B?czNaRk9iaWQrRnFLVTVQZjJCZkR1TWpCZDBaaUcxc3hkYnlSK0RXZzF3SWV2?=
 =?utf-8?B?VDFuMnkzMUg2SHZkaXdLdWNkSWpsb0RMcDRMYmVKa2hYZlRVcEFYRnpqK3Rx?=
 =?utf-8?B?Y0ZqcU5uMVNsNXpTWEN4SG1SbWN3b1VhcGowK3p2c3FhQU9vWTNXVWc5V0VP?=
 =?utf-8?B?TFRXSlU5bTM3dFNNbXhsWEptdFBlVW8vbnA2L2xTQ2dia04yVUp0Wkp3OW1B?=
 =?utf-8?B?dGRiZi8rOVNOV1N1L3RMc0UxVWhZZ1lWQzNXVGNMdFpEdWFiQlFSZFhyRmQ5?=
 =?utf-8?B?ekY5NEhQYUxHU0kwdjZPNVV2LzlENUVaM1ZBQ21VK1NhTUVWTmpUL0paeU5Q?=
 =?utf-8?B?OWVzT3k2c1JJZkVsc1dTU2R4dWQ5ampKWWkxNkpFTDVaRmRVWjRsZWlzM0Vo?=
 =?utf-8?B?TmtUbjFOZjQvRVNtSlFRZHJJRGdXKzM3NHV4em9uOERUQXliYkRQL2FWV3RJ?=
 =?utf-8?B?MERmQVVuTWp2RTVpM3V4QUxkcElvUmloVVo0Y0hIMGdhc0hoWVc2WWYyS2dr?=
 =?utf-8?B?S3dnYXJoMElzM2JneEUzTFFUY3NXUXJNN1lKNnl2T0JCWllRQytHMGdITWY4?=
 =?utf-8?B?dnVncEFkSGorRHN3L28vUG9FU2Zua1hvZGwyQk1KVFBFUTNiK0ZRdWs0SC8w?=
 =?utf-8?Q?IaKY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NllIbzFjTmJpTTcxNHluQVF4YnY3eDExalJOQzMvb0JtR3d2N1FqdTBzVzE5?=
 =?utf-8?B?OGkxMlZsdEQrTXpjeGo5MDhJYUtXRElQSXdMSVVybmcrSTFDRC9KUzlPaGpR?=
 =?utf-8?B?emF3c3FWTkRsbW9jcFo4cGhBUXRUSFBGTHUxZVh2aTluMm9Zd20xWjdlWHFr?=
 =?utf-8?B?azQ5Wi9OdWlIMWw1Sm1VWmQwNEhzdnJMWmsvNEY3akJOdUhWeEYzQ2VLRmRM?=
 =?utf-8?B?VlFMNXNxamh0ckE5WHRPb1ZGYWNHWWhKMVdER3JXdFo5U1k1TGxwUWJUMWtL?=
 =?utf-8?B?cDlKMjFZYTFNeVU1UVFQN2Jic2g1V0s5bW9DT3lSNDFzc3JuMjVFbUR1cUlv?=
 =?utf-8?B?TzRLVTljSXoxUVpUWkJ5R2FuRTFmL0ZQTC9NNkVoS0xDYVNJRDRxUVNNMFBZ?=
 =?utf-8?B?cFJ3dHlxb0ZpckhjL2VweEFJZlRleWFkSWdrOWlLK2N3QndQeUdkdGhhdlpw?=
 =?utf-8?B?WkZkSTlnWUJ6dXhmMHZlUmhQRnFGNzVxZjR2QlVCQVhHb2pRblo3OFhBdHZi?=
 =?utf-8?B?bFlYTUJWSzRvdm1nWHQwdFRWeURRK3dqZnlZOUI0cDRjMVdSWkhJaU9aWGZn?=
 =?utf-8?B?RTVubGVwWnhLT1JXclZLeTM0K241ekhDTm1WMEptRmdYRG8vVVBOY202TlYw?=
 =?utf-8?B?dTZ4U091ei9wOWJTYW9DWFk0TzN1RFd6bzNvNFUwN0YxQzFSd2xSQmxJYzFX?=
 =?utf-8?B?NDlKY00zZCtmYlB1czhjdFRGQVhldVptY21Ra1dGamNoTGJVWUF1dHFlc3Vq?=
 =?utf-8?B?TDM5azBFbVRzRWQxalFadWhrQ1p3ODlSRkhUWHV5UE5MMDUxcE9NK2NKWEkz?=
 =?utf-8?B?Mm9rblZWSlpzbTF6MDhXQ2h0WEoxSmFrMjRLb0psa3ViS0FoQW1rdFFaYXlk?=
 =?utf-8?B?WnpCVHp4RlNGM3hFWXFNL0hVVXpzWnFId0lOYmQ5eWhhM2VnNk1KSzVwUktp?=
 =?utf-8?B?V1drOVVheW9hVmlIYzRySkpMdU9Hc0dyWnBSaVhHZWhhcC8xTFM1aFI4bURt?=
 =?utf-8?B?SmJ5UzQrR1ZGY1hLOEgzYktjZ0k2Vmkydlc5L0E5N1VSU25NcGU0TVZjWDR4?=
 =?utf-8?B?VncrUW56NzVxazF5SUNKU0NPMzE1eDBFeFJFRTZIRGd4b2hrWEpmQWhqN2ZL?=
 =?utf-8?B?MzR2MWxDVlNxdTAvSlNNb2xsbEVxdnB2R2J5TUltdFovT3pIV2w2aDFvR2xs?=
 =?utf-8?B?bWd6MzdTM3habVJDcS9oSUJSNThBVzdCWWpKUlF3Tk1tVVY2Vitaa2tkZmtK?=
 =?utf-8?B?Y3VvUGZ0dkg5b2ZCTEREQ0lBelI4aEN2QkVNNE0waDBVUWZzWXVpZXJLMDZ5?=
 =?utf-8?B?MlVwNTVJeWF3ZnlCRVl2aHVzbU55SUxSQmpGZXo0b3R6OXFNRzQyM3o0RDFQ?=
 =?utf-8?B?eVlWZXp3WWIxeFNqOHRNaFlmKzR2TW4xOHB1NkpmUEJ5QUpiMG8vUUJtY2c0?=
 =?utf-8?B?NjE0WTEzdWVOcFhXcDhEVlFoRmNjWi9ZQzMzK1UxZ0tJTDhFRGFOc2VHbEhR?=
 =?utf-8?B?MkFvU2FYVkZkNVdlelBiK2IwYmRJREFhWmdaWm52TnpQYjFCRFk0bFZ0Q1JE?=
 =?utf-8?B?WEE1cHdMamF3aW5LdHE4Sk5LT2ZaTnh2WXJ0VXlMc3EwQ3cxY2ZQZXpYVUdx?=
 =?utf-8?B?dG10S3hBOUlxbTNtbkJldXRadE5ucGhBcDlqSnhSUVBPUWVvNUp1cmhiWjZk?=
 =?utf-8?B?Y25vb2JDN2FyWGhjdlZLMUw1MFpqd0RuN3RGSGhtb29NNlJYWGUrbnVXdGFm?=
 =?utf-8?B?YVhJZTlCMVFFNUdJQlJFRjhJODVIb3hKNmZJZVBmV1dsSm5nYU8vSXdZQlF2?=
 =?utf-8?B?cmRhR0ZNQnlBMWtlMG1OclJTRTFFeXpoL1JUOHM2SFI4WGVUcUtxU1JoMVFB?=
 =?utf-8?B?UzZKTVZBbUF6TW9QN2w0SlRRQVNZa3FsTWVEUkFmcUF4dUV4VGJwdjJtMzZ4?=
 =?utf-8?B?TUxnKzdZazVKV2RST29MMEVhbGlpRTNzandtbXFycndxNWVnY2FrNno3Yktr?=
 =?utf-8?B?YXJIREw0SnFFbEFNR1pTQjhkRm5qQy82dFBITUdhSTZWTis5L3g4dVdtNDRE?=
 =?utf-8?B?QTViSHdWR2JiTE4yRnVkLys1RlF3WHovVk8xak9rYWZvM2d1cWFwNTlvem9K?=
 =?utf-8?B?d0ZVMDNPcWEyaXJUWXU3SlY3N1oxb3l4QzVJYWtOclFvVlp2R3ViL3ZRc2d3?=
 =?utf-8?B?c2xIZnhuR25SZ1lCNUFaaUJrK2lHQzI3VktZN1Q3azNJOURzZnJFN2Q3ZWFq?=
 =?utf-8?B?UGFjVS9heXNHS2pkaGp4SDh5Uk5HNUdJNjZFalcrL1VncDR0TGJZSVhNZTd5?=
 =?utf-8?Q?T28DUQXjbDiFZ0HTlU?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d232cf0-aa36-4e74-a39b-08de5f40d00e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:15:10.7269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZUHpRz6Kl+YXFptrrMc3exu/ZB7xgO+4ov36jjzULyaerNaI/qdAZgPgbjYbx17WnfdGY15UKLgf1zPWvjq2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2181

On Thu Jan 29, 2026 at 12:26 PM GMT, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add AtomicFlag type for boolean flags.
>
> Document when AtomicFlag is generally preferable to Atomic<bool>: in
> particular, when RMW operations such as xchg()/cmpxchg() may be used
> and minimizing memory usage is not the top priority. On some
> architectures without byte-sized RMW instructions, Atomic<bool> can be
> slower for RMW operations.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Hi Fujita,

Thanks for the patch. I think this looks nice, so from design point of view=
:

Reviewed-by: Gary Guo <gary@garyguo.net>

However, Boqun reported that the codegen of `.bool_field` may involve a bit
masking instruction.

Best,
Gary

> ---
>  rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>  2 files changed, 142 insertions(+)
>
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 4aebeacb961a..bfc393d98aa9 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -560,3 +560,128 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>=
(&self, v: Rhs, _: Ordering)
>          unsafe { from_repr(ret) }
>      }
>  }
> +
> +#[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> +#[repr(C)]
> +#[derive(Clone, Copy)]
> +struct Flag {
> +    bool_field: bool,
> +}
> +
> +/// # Invariants
> +///
> +/// `padding` must be all zeroes.
> +#[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
> +#[repr(C, align(4))]
> +#[derive(Clone, Copy)]
> +struct Flag {
> +    #[cfg(target_endian =3D "big")]
> +    padding: [u8; 3],
> +    bool_field: bool,
> +    #[cfg(target_endian =3D "little")]
> +    padding: [u8; 3],
> +}
> +
> +impl Flag {
> +    #[inline(always)]
> +    const fn new(b: bool) -> Self {
> +        // INVARIANT: `padding` is all zeroes.
> +        Self {
> +            bool_field: b,
> +            #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_=
ARM64)))]
> +            padding: [0; 3],
> +        }
> +    }
> +}
> +
> +// SAFETY: `Flag` and `Repr` have the same size and alignment, and `Flag=
` is round-trip
> +// transmutable to the selected representation (`i8` or `i32`).
> +unsafe impl AtomicType for Flag {
> +    #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
> +    type Repr =3D i8;
> +    #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))=
]
> +    type Repr =3D i32;
> +}
> +
> +/// An atomic flag type intended to be backed by performance-optimal int=
eger type.
> +///
> +/// The backing integer type is an implementation detail; it may vary by=
 architecture and change
> +/// in the future.
> +///
> +/// [`AtomicFlag`] is generally preferable to [`Atomic<bool>`] when you =
need read-modify-write
> +/// (RMW) operations (e.g. [`Atomic::xchg()`]/[`Atomic::cmpxchg()`]) or =
when [`Atomic<bool>`] does
> +/// not save memory due to padding. On some architectures that do not su=
pport byte-sized atomic
> +/// RMW operations, RMW operations on [`Atomic<bool>`] are slower.
> +///
> +/// If you only use [`Atomic::load()`]/[`Atomic::store()`], [`Atomic<boo=
l>`] is fine.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::atomic::{AtomicFlag, Relaxed};
> +///
> +/// let flag =3D AtomicFlag::new(false);
> +/// assert_eq!(false, flag.load(Relaxed));
> +/// flag.store(true, Relaxed);
> +/// assert_eq!(true, flag.load(Relaxed));
> +/// ```
> +pub struct AtomicFlag(Atomic<Flag>);
> +
> +impl AtomicFlag {
> +    /// Creates a new atomic flag.
> +    #[inline(always)]
> +    pub const fn new(b: bool) -> Self {
> +        Self(Atomic::new(Flag::new(b)))
> +    }
> +
> +    /// Returns a mutable reference to the underlying flag as a [`bool`]=
.
> +    ///
> +    /// This is safe because the mutable reference of the atomic flag gu=
arantees exclusive access.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::sync::atomic::{AtomicFlag, Relaxed};
> +    ///
> +    /// let mut atomic_flag =3D AtomicFlag::new(false);
> +    /// assert_eq!(false, atomic_flag.load(Relaxed));
> +    /// *atomic_flag.get_mut() =3D true;
> +    /// assert_eq!(true, atomic_flag.load(Relaxed));
> +    /// ```
> +    #[inline(always)]
> +    pub fn get_mut(&mut self) -> &mut bool {
> +        &mut self.0.get_mut().bool_field
> +    }
> +
> +    /// Loads the value from the atomic flag.
> +    #[inline(always)]
> +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering=
) -> bool {
> +        self.0.load(o).bool_field
> +    }
> +
> +    /// Stores a value to the atomic flag.
> +    #[inline(always)]
> +    pub fn store<Ordering: ordering::ReleaseOrRelaxed>(&self, v: bool, o=
: Ordering) {
> +        self.0.store(Flag::new(v), o);
> +    }
> +
> +    /// Stores a value to the atomic flag and returns the previous value=
.
> +    #[inline(always)]
> +    pub fn xchg<Ordering: ordering::Ordering>(&self, new: bool, o: Order=
ing) -> bool {
> +        self.0.xchg(Flag::new(new), o).bool_field
> +    }
> +
> +    /// Store a value to the atomic flag if the current value is equal t=
o `old`.
> +    #[inline(always)]
> +    pub fn cmpxchg<Ordering: ordering::Ordering>(
> +        &self,
> +        old: bool,
> +        new: bool,
> +        o: Ordering,
> +    ) -> Result<bool, bool> {
> +        match self.0.cmpxchg(Flag::new(old), Flag::new(new), o) {
> +            Ok(_) =3D> Ok(old),
> +            Err(f) =3D> Err(f.bool_field),
> +        }
> +    }
> +}
> diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atom=
ic/predefine.rs
> index 42067c6a266c..d14e10544dcf 100644
> --- a/rust/kernel/sync/atomic/predefine.rs
> +++ b/rust/kernel/sync/atomic/predefine.rs
> @@ -215,4 +215,21 @@ fn atomic_bool_tests() {
>          assert_eq!(false, x.load(Relaxed));
>          assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
>      }
> +
> +    #[test]
> +    fn atomic_flag_tests() {
> +        let mut flag =3D AtomicFlag::new(false);
> +
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() =3D true;
> +        assert_eq!(true, flag.load(Relaxed));
> +
> +        assert_eq!(true, flag.xchg(false, Relaxed));
> +        assert_eq!(false, flag.load(Relaxed));
> +
> +        *flag.get_mut() =3D true;
> +        assert_eq!(Ok(true), flag.cmpxchg(true, false, Full));
> +        assert_eq!(false, flag.load(Relaxed));
> +    }
>  }

