Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022137.outbound.protection.outlook.com [52.101.96.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16303DA7C5;
	Tue, 20 Jan 2026 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916626; cv=fail; b=neyyecQLu8zAaVuUtdrKk1JAQi7lPhMwTVcU7n46RlVfsAmwvkUBNtTzknd0wjGeFGixU/jtiaB7R2Sdb9miIMa1Xy0jQdeAD2K5ht6QwhlUaAXAM9YkxYroQtx26fGXFILRZVyMWnMvy/JXlBIWqULmbE91Oa2NSNIVf9It1nM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916626; c=relaxed/simple;
	bh=YF2Eve+Nwoq0y/YBnMWY5+no22BOd1XFZZ95v3sQ1/I=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ne85gVtzNBgBY5LXujopKuYn1uO+sYArRiw9LN95G6HjMav6/HssfVSb6UV8L3K3x93WGxTH0tcN0gkBUKyUctEwg0BrMLHdPwyOEOd0n8TDhiLC0svGMWDB7eaoF9zF9594h9MNOg0sDtFOjn0upBt0tly0+r0qisc27SJDtoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=uFXwrvoz; arc=fail smtp.client-ip=52.101.96.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="uFXwrvoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPSTQ6pRn/+4zWM6baO4sfx8xb1PzmBnbbzpIZEDIo7psV/BuMY7p7go76QIA+r+7xUygMO9iONLdmEDd2sMysil7Fk3aMp2uW9gb5VXujJo/lx+R8Oc4w4ykbqqtDy0C82GhUkiVqloZmCwLw/vBlMmPEE3bBqXtN0aVbUDOEXzboHeizahUTtr4EQoL6EhuvGn9MF/+yR7Wjq01rs9VF5NORzVR49YmUQWuopfMwEtYg6rFrOth/kAm0V7SjcHd1mk5k+QO1wYhInkoWR1wW6DQ+D946cmU9j/Jmp87MaM9AoUk3nxdW6KCTLTzLH2lDZjt3iX2izk8ThW8U0Owg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SETILOyVw4wNxvuwMNEr+8vQdzXBhfrBAQuAsr6bf1U=;
 b=NVtxsv9JfxrJoUA4ZHEWhDSc0QId7Wl3+S2CqsCN8khM+QGOPT6lff4SS7kjw+j/SbXPYxCOGFkuhVZsYwhp4m+wpnJ2v2uugZKM58mBIBi7TxAPMEAwAvqpKqYfYboNtHlltFvMPB/vcBMS1ES8mm9n2BfnwS2PnjzRX2e25PfG3w1ig3YTj/mZsBJrx8qidXHo1s4JGi4lNYUVvAPh7J//5Dn2m2RJVV8UCw9Xitaj8X9NwbLMDoo0X9oDeZL95QXm3Dp04ENXWebgV/b/nN4OozFjrQea3mX2S80W1dwiflf9OnS60amjI6JOYT3nOPxpHlsMEenImkNW67UNpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SETILOyVw4wNxvuwMNEr+8vQdzXBhfrBAQuAsr6bf1U=;
 b=uFXwrvozXbvKhS9lOTxBU2V/wQeNdMYWkZv09wQE7LHnGQh7DZwDkNjirMr6V1/LJ3SHbIaZVWntEtuoExP4ixLkIUxMxKUrCWB4J3jEazxoMq410fqP+yDiagtt6BR6zy5Qt5W1u9JDjzXOnvpt1MQv1K/7/XJTx7z1OmQjhnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5478.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 13:43:39 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.012; Tue, 20 Jan 2026
 13:43:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 13:43:38 +0000
Message-Id: <DFTGLWA024Q8.2J7FPJPVL6RA5@garyguo.net>
Subject: Re: [PATCH v1] rust: hrtimer: Restrict expires() to safe contexts
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <ojeda@kernel.org>
Cc: <aliceryhl@google.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>, <dakr@kernel.org>,
 <frederic@kernel.org>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tglx@linutronix.de>,
 <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <M2M7QTmzyv0cuTcfmp8k-pHEgTa6pOlfONQW596m3-nM_3-fQoakLTxJy7SthiIlT_5I-07GG9On36gsydLT7g==@protonmail.internalid> <20260110115838.3109895-1-fujita.tomonori@gmail.com> <877btdpyz2.fsf@t14s.mail-host-address-is-not-set> <pDwjG06OA4rlC4rEeo6eo5jUcleIUV5jT_SGHgMmJumfm1YpZU6tXdsLV6UgaSBTvJFSVmPCgTju09jyU7Ih0Q==@protonmail.internalid> <DFSL81HEHYU6.8E3YYOXNV5C9@garyguo.net> <874iohptem.fsf@t14s.mail-host-address-is-not-set> <UWfowIYPYvjnylDlpyIzDvlnBLndFcpoYhkhjPT9aG7ynMqREHY8uigXm16cP6991vx-bEEAVgAVkA9lSGEK1Q==@protonmail.internalid> <DFSO4J9WM5BX.1H0OSQEII0KRB@garyguo.net> <871pjkpuaf.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <871pjkpuaf.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0457.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 20526d34-41d0-4fb5-57ea-08de5829eb20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVFpSUpDY09tWk9WZXpSMU1uZ1NSRXZjZ05LKzMrT3REVFM4WWNEVHJWTUhl?=
 =?utf-8?B?WnNlVEs1c0RPL1ZKb2FOQXNHenBvOFpwSjErMHVDeFFrWFB4a1I4djBHNFFB?=
 =?utf-8?B?a3pYUkRSU1lYL09CazBIeUxMTm9HVnZHRDVEdmpvdmtFYnRINi9lTFBqU3Jj?=
 =?utf-8?B?SkNmWGtpMWswUm9iZExXRUF1cExtRHI0Y1RHbWFTSFFNcVM5a2ZsNTYrWW4w?=
 =?utf-8?B?dWFzUkZKUlp2VU9TY1FyVWRZaGhneFkxc3hEUTB3WmhNTmFEMExRZzBzT2xo?=
 =?utf-8?B?T3MrWkdSQk8wbFowUXZUcUlhWkFDRUljVDdiK2NCWjlyZ2YwUFNmdjJmbXFV?=
 =?utf-8?B?eGs3SXlpcnhqNERNZEM3Vlp2YVZBa3VKSkYvbmJtZzJkK2UwSURscU50ZlE0?=
 =?utf-8?B?ZEwzcFBjV1JiVFdONVhhZEhnMCtvcUpaemJnSFlySU5CZUtZTC9wdjlBdm5Z?=
 =?utf-8?B?N3lzSzA0Q0FTOVhFM0NyT2ovVUhZVVlqU1RjcWRNYnpxcmw4NlM4L3ZCWi95?=
 =?utf-8?B?WjJXdHBIWWdnWENsd3FYQ2tkUVlSUHpDNmFFTWZ1STcwa2tnTG01cmxkTGpl?=
 =?utf-8?B?S1JsNEladmcwTmpmdHAyRmRjUzc1eVY1b1lhRXVxSHVMRnRobnZTZmtYMW5h?=
 =?utf-8?B?amlhUFFmdGhWSElkN0hCdzJHZFlGakpSeUs5T3loMTYrNS9GNzVUQ3pnNzFI?=
 =?utf-8?B?R2hCOXlJMi9qcm5TdUIvV3BDbG81Ky8rdWRpVHFhbEJId0ZUbHR3SFJubjN1?=
 =?utf-8?B?S3JxZkNHMmF0ZXBPbnNvUVVJRUYwSFh0UjNLTnB2SE5Vd2VOUnlEREJWTGZi?=
 =?utf-8?B?ZUkzNElVS1RQcXB4M0ljTzE5WTBDaDk0VE03bHgyaFAvV3plZE5xMm5lVjN6?=
 =?utf-8?B?UUFnWkZGUW1xeUhvWURkWUZKNHZQbTBjeXk3a3Jud0g3a0gzOW5WZVNyTXdt?=
 =?utf-8?B?NkNncDlLOHRjUXJiWXRPdUlwcDBJR2lrWFVNanJmZVlNZmJNZUJDTStFaldL?=
 =?utf-8?B?RjkveHJFWDJGbzNBdXNGSVhFMVpRMS9mZWtLQWlUeTA4dDRZZ1dSbDBJR0Fn?=
 =?utf-8?B?Tnc3OUI2azNRL0IxWnd4d3BNb2hCdmNLdExyL01NVU91L1lPZGF0RVVqbnRs?=
 =?utf-8?B?MXB2dHBRcThpeUZDSDEvY2t1c21FZnpQeWMxcFNXd3J2aDJKQ2FUR0ZFOGJQ?=
 =?utf-8?B?cXltSG9jNVcwUGZ5STZoYlNWeEh6cTJBTDd1OXV1VGZHNEY4eStLLzFGUHVC?=
 =?utf-8?B?c2FuK2hnRTVKTGNBMVVlb2lvWWxBMWVzTGZ3L1ZrMnE5dFV5c1QySHhPeFpx?=
 =?utf-8?B?NHZ1OWhleFdacDBiSFo3MFpBVFZyTmo0MXNBUVp2WmRsazV6Zm93M0JUc1Bh?=
 =?utf-8?B?TGxUbGR1MnJNQVpHTHNzZldUakY5U056ai9KK0lGaElyQmR3US9wV28rTkly?=
 =?utf-8?B?b1FMSUp5TFQxVjNna2JPWkErbzVrVXJVL3BCLzNsQzMrZG9pbS8waEVHeTcx?=
 =?utf-8?B?RGtlbVlpbXVWTE1qYzVkV0FZekIyaU81ZnJNQ3hmZkgyaTJFNVQxaC9meGpI?=
 =?utf-8?B?UlU0dEtZN1VvVWV6bExsMTVMZm1NNmFmdEV5ZFhMWW1uL3ZGeEZyMmUrUXhB?=
 =?utf-8?B?Z1VCQUNMem9MdlFEQlBXTy9jbFhEejZKTzhaSFB3TVlqR0U2dmZDeFJBcURT?=
 =?utf-8?B?SDRXR1VVbzA5NVdXTkRodSt5QXlkbmF1T1lKTGFGUExoMlpmRXd1YWNhek4y?=
 =?utf-8?B?TXUrTFFzZlJKWWN1ZTdQTU52T0pVRVJSQjZIY013T1RNdlBmQjkvWDNjZUpl?=
 =?utf-8?B?RGo0ZGlRYlovOTVqbG5ERWwxc21ETkRsY3lKNnpFQkNmNXpXYnJ3Y2xPLzBh?=
 =?utf-8?B?YUZkQXM4Yno5Y2c3ZXBhb3lLcWVFeUQzTWlmYnBORDFJZnUyaUVkRFVFWldL?=
 =?utf-8?B?VjdDTjdtSXZ2eVAxb3NLZXRuQUVUOGs0NGtKQzRHTUI5SHVSWFoydnlGMm9n?=
 =?utf-8?B?SDJRSngwMm1qUW1nakp0eEI1RUhWcTRRdExNT3B6c3BwSklDTC9GbFR5U24r?=
 =?utf-8?B?b1Z0c1pEZTlzc0NUVHFYZTVaQytiMFBYRXBOdzVHcVd5UWpQWjFESjhhSlU3?=
 =?utf-8?Q?PEZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RitnNkd5aCt0c1lFTHZmQy9zS0FLZWFRV1E0RHVYTXRlQ3dzNjFCdFJoMEZY?=
 =?utf-8?B?Rm1LS3hYS2h3VnI0azFSN3Q2aldIK2xVZkUrcFFiTzhtTmQ4Q0RFUmJ2eDlF?=
 =?utf-8?B?N1hESDMwQW9Oc1A1ZjljYmZmcUp6eHZzV0VraG5lWlhTR3czcGs1cVo0NGUv?=
 =?utf-8?B?WTdtR04xL0FlakhDcUN2WFJFc1V5QlVwbG1nMDRrWXRlSmdLeHFhVHVsQldU?=
 =?utf-8?B?S2JNL21Xd1ZwL2hpQkNVTXUra0N4NWpVRGVsc3pocGN4N2wreEVmd1FPdklo?=
 =?utf-8?B?UVIwb25TOEhlN01uYjV6S3hDeDJidlpkRjQrQXNESmhYVnRlSkhCMUdhcmg4?=
 =?utf-8?B?S2hIUHlsNCtCV0FXbCtFanNvaVVNa2VqcW16cnkwRVNUNE1NNmlkQTdjajU5?=
 =?utf-8?B?RlhCWi81S3AvMmtvU3c5dFRIZEkwNVVRYkdmZHVYckY5RWVWUy9iTENyTUVX?=
 =?utf-8?B?ZDFvdWhhUk44QThocHJ5ZGpYdy9VbTAxTDNzS1VXWTNmSXFXeGxuOG5XaDlZ?=
 =?utf-8?B?b1BodkpqUHQxQUZCNkczR3JJUnp6QTROSUdEMm9KM21uSENZRDlsM1VrM2Fv?=
 =?utf-8?B?OElmbHZuM1NDdThtZVloUGxHd2hIWm53YTlBVlczYkFYSXJqdVlZeGoveEJ0?=
 =?utf-8?B?NWRNVHRxTEx1MU1Xc2tUTnp3MGlEL1ltaHBVOHZDWjUrRFJReTdTbzVtdGU2?=
 =?utf-8?B?WXNMbWVEclpGU2dHNXdDT1kwdmhaTzg3ZzRLb3d3ZHdDei9abVZpRjVHVmZ2?=
 =?utf-8?B?N2pmMUtkeVhUUDBrVkJCVm9vN3luNEd0VCs4OGE1UUNHT1BHNGh1K3VYZXBy?=
 =?utf-8?B?dTVlcnZOSFA5VldwR1M4cTNWU1dCcnNBdEVXdXg1SlluanZ0Y1VSbWRpY1ht?=
 =?utf-8?B?TEVlUm92QXo4aTlSaEJhYUJybWxUUnE0SFhTVE5qaVN2ZjRWYk9MYUZ1MWlw?=
 =?utf-8?B?d1owTThOekd2V0xITVE4Z0VrRlBJb1ArbDNyZGFPTnhyL0xlM1RrMHdLZHds?=
 =?utf-8?B?dnp4KzNOQWVkOWNaRzdVVDViK1NmKzlSbCtjTkRPY2xWMmZTLzlvbjQvWVRw?=
 =?utf-8?B?QU1IVHV2WlpiVll3NE5rT0MwOWc3OXorY242ZWxaM1dENjRJMm01bHA5cTVG?=
 =?utf-8?B?ZmJoczUxenpWVng5cFVzM1dWYyt1aFJTS1hPRFg3cnRpRHlwOUd5RXBYVWMw?=
 =?utf-8?B?SnBNLy9ZQmozV0t4YUJTdGxXV1hnaW1Zekw4QXQwMDIyaVVMcCtERDFCRlFw?=
 =?utf-8?B?WkMvSlg2em5HeDFPVFFlaE54RFBxY0tsVURKTmY1Q1VTU2NIM1NBZ3c1T0Y4?=
 =?utf-8?B?Y1QwdVZWLzBncUdFTnZ2bEhPYlhKMEVGaE1NVHdGNWlsbzh4Tk9VUVd3SVp5?=
 =?utf-8?B?TFVGcGFJMjY1aFZQK0tTS3hoaXhZRkZlWFE3NnA3TXVsVWNZc25PcWZscENo?=
 =?utf-8?B?USs5b1JwTWVSMFFKelh5MHJzQXc0MEtLNk5iTzYwb0NONkdYam96YVBQNk4v?=
 =?utf-8?B?dzV4eFBRZGt3M0V3REIxQkhpY1JucllNL2UyWXFUcVNNVmlaNGdHL3padzdu?=
 =?utf-8?B?bW13MW1uY0hiOU43QUFpMTVzL0Q2UUV6UEVoMEZvbWxhMnRmWldqbW52dzRY?=
 =?utf-8?B?Yis3aCtCZmgzL3FsWE9MRFcvWEU2ZVN1Z29CZi80c2V3SVd3Y3cycSszNStB?=
 =?utf-8?B?QWRDR0VBUVhydWdQdkVDaTVHWTFTWXFMMi9ST3NNZy9MamYrWUk3YWRFMmNp?=
 =?utf-8?B?eWNFWUZOWEtIeEhWd0FKZWFkek9mUHh0R1VJQmZWRC9iMnRqeWk0UE1pUktS?=
 =?utf-8?B?cWR3TG5BNDI0aWNTVkVOclVJbGlLbnpXMWtNOXlIMm1YZ0lnbWtzTGdVbnhm?=
 =?utf-8?B?ekplZzF1S3VVcUYyaU5TZUY2aFp4MnRNa1Q5eFQ5emJ3MElwdnlZTW51cFl3?=
 =?utf-8?B?NHUzdDJNcWlVbU5vdnRUV0swY3pZcVZHbVcyWVhrZWd5cDczK1lxWXVaTnZ2?=
 =?utf-8?B?Nzdoc3lHc2pSODZBSXpmWWZzMmdxM2ZWeU9PNk94eU40ejFSTkl1Rk90U2M0?=
 =?utf-8?B?UTlBWm9XSkwrU0djMnI2Z2RUWDFVakRlUzNST2JXMzg0MjhnVEhWdUp3SStx?=
 =?utf-8?B?dUNLWElEWGNxOE9kT3R0TVk3RFBKU3BLcHYvS3lwOFFBN1RXVlBpKzllRFRZ?=
 =?utf-8?B?Q0tDZ0psOXUxYjZHMG9DOUczaUlGZHJET1cvNWZURHpYcjRXTmtYQUFWWUhl?=
 =?utf-8?B?UlBabjIyNTFXSDdEcFdKNjNsNklic1M4cWRzbncvK3dSLzRTdUgxZkFlQjl2?=
 =?utf-8?B?a2xtaHpUWlVteGIwTURteTVPaTkyR0Fnd2wvaVdMQUpWZUZ4bTA0QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 20526d34-41d0-4fb5-57ea-08de5829eb20
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 13:43:39.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: au9ut4wWkYdqhlEFzBOpvi0Vw7o45aL7+Pw2e+S/nqINuK5UP2MKluiC3q42X8mRFve7X/sNUtAyM8zBuX7BnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5478

On Tue Jan 20, 2026 at 8:23 AM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>>>>>
>>>>> Also, we got some new docs for `read_volatile` that allow us to read
>>>>> memory outside Rust of any allocation that are not "valid for read" [=
1],
>>>>> meaning racy reads are OK as far as I understand. So the original
>>>>> implementation might actually be OK, although the number might not be
>>>>> correct always.
>>>>
>>>> The wording is for MMIO and should not be relied on if the accessed me=
mory is
>>>> C memory. Also, `HrTimer` is going to be a Rust allocation.
>>>
>>> Why do you think the wording is only valid for MMIO accesses?
>>
>> Because it is intent for this paragraph, and is mentioned in the text. T=
his
>> specific text is introduced to allow hardware MMIO access and the need t=
o be
>> able to access otherwise always-invalid pointers, such as pointers to 0 =
and end
>> of address space.
>
> The text does not say "only valid for MMIO locations", it says "intended
> for". It also would make no sense if it did, because MMIO locations are
> not special in that sense.
>
> <...>
>
> As long as we are not ever making a reference pointing within the
> allocation or doing non-volatile operations on it, it we should be able
> to consider the region as a non-rust allocation, right? If not, why not?

The important thing is that it is something that is never handled at all by
non-volatile means throughout the lifetime of the object. MMIO is speical i=
n
this regard.

So for example, if you put it on the stack, then it is already within the
purview of the AM. You might be able to argue the otherwise if the thing is
created using pin_init and then you never initialize the memory in the firs=
t
place (which is not the case if you just use `Opauqe::uninit` by the way,
because there's a move, you'd need to use `ffi_init` and then do nothing in=
 the
callback).

So yes, you can probably get what you want if this is behind a `Opaque` and=
 you
never creates reference to the internal value or touch the memory in other
means. But this is all very sketchy, and I would just say "don't rely on th=
is
behaviour unless you're doing MMIO". Use LKMM for anything else.

>
> I am aware that this does not apply for the expires field, I'm just
> asking for the sake of clarification.
>
>>
>>>
>>>>
>>>> Even if we don't treat it Rust allocation, it's also only "fine" in a =
sense that
>>>> you don't get UB for doing it. But the value you read can still be com=
pletely
>>>> meaningless if the updater is not atomic (it would be valid compiler
>>>> implementation to, say, turn a non-atomic write into a write of a garb=
age value
>>>> and then an overwrite of the actual data).
>>>
>>> This is exactly the behavior I expect. In case of concurrent writes, th=
e
>>> value might be garbage, but in the absence of concurrent writes, the
>>> value will be correct.
>>>
>>>> I think the usage you quoted is just wrong, as on 32-bit platforms thi=
s could
>>>> well read a teared value.
>>>
>>> Referring to the C code above, it seems like what people in C land will
>>> do is read the value until it seems to be stable yolo ahead with that
>>> value.
>>
>> It is non-obvious to me on why this code is correct. The updater seems t=
o do a
>> hrtimer_forward_now and then call into drivers to update the vblank coun=
t. So
>> in this sequence:
>>
>>     CPU1                 CPU2
>>                          first drm_crtc_vblank_count_and_time
>>     hrtimer triggered
>>     hrtimer_forward_now  READ_ONCE(expires) <- racy read
>>                          second drm_crtc_vblank_count_and_time
>>     store_vblank
>>
>> you will get a teared read of garbage value while the vblank count is st=
able.
>
> Right, that is interesting. And it will not help them to flip the
> operations on `expires` and `count`. I guess they need to update `count`
> twice to make it sound, effectively implementing a seqlock.

Alternatively just update `expires` field to be `atomic64_t` and use 64-bit
atomic ops always. But it then it means locks on 32-bit systems without 64-=
bit
atomics.

But anyway I think this explains why I would encourage to use LKMM rather t=
han
just do a `read_volatile` (or READ_ONCE), because it is very unclear what
semantics you actually want.

Best,
Gary
