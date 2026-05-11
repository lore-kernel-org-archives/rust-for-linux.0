Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020102.outbound.protection.outlook.com [52.101.195.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F0B3FF895;
	Mon, 11 May 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510075; cv=fail; b=dxIitDT1fN2aAo4SEUiwxXfwmD5G6/nKeyBR7VVvO+SrKaJcO6VDIvFieY0kSFdo9zqybqK05w8CUftizbEQy0IOmPPT4i8rzseWCw9JGZdgk8pfF9+hZtGcWtm6HatIbO6Ptd3g9p+cSc26SmA08JrHkdkpEP01YN8KkHtgWyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510075; c=relaxed/simple;
	bh=vgFDKQ1IR68/Bdr9QUqXTBo9VlFG5ZOCEniYVCt4TBU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=DXYxqz8kJ+caKxeVjwyqqkrvbxhFr1GYqmvNe5nSTjcoyriCX0RbgPDlIyz4gt4nA5t//AaN3L87y8KlLVlRa9gEz4qVvoLXIgeNxmncAYlTUu7ck8VvIi3WukvNLNHxb7DkPHaupfUkybA3D6H0M9vARtfzsK+Q/ZF77OdHE5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=t1xo+Pvs; arc=fail smtp.client-ip=52.101.195.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="t1xo+Pvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ney0PeTtdQAr5BN7qa7jJYzu5WmxofaZzZoMeRPKfUDZ8lXFthKRgctXejkNPupy3ODpZljUF7CIiXgahD+JMmqLOf0Un0w0cPNOrpJZFaGoj/280olHwx6SY0a63QxUqv+FeBbRAzZ3pFQRoCBscW8g5mB2GBiedqYfBdJylISohX+8QT0FFSuFNx/k70h0MEIGzZP3Ra2zdH6OgsMqrLqDBTiuY7LP2CeZsAg67+VD+GeNOp89mDClUan4ZiFCmbI/qffafpjl04xTXJddnwPRjbLHVTzJc+BRBH5YqIrcOcugYENiSAmYzLW/ANDCD0Ho/12YXT/kHhJLWkJD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVY/W7rXrjzOuU7AmsMusmaLb5WyU1yQoHv+WemewZo=;
 b=xEXb4gNcX3JiyhbgWFFy4s9LTeIZ8sNL3yTEtDwoTXx+g3hCLqo5OzmnIf+ZaAvtgZY4DRuNa/4SmvuwUFwPtjaZmAWtbdmlXAc4NaN+Ks4/e0wDcG9dFUodDqM/OYlnItKo5g2eVOrE+EvbrQWhjdiMbTeaNgN0LZTC/OM/cGh96Aw5GBMxiwD+I0WK2vGePtNPoxks/+NJSK1LSqVzk0nj0fmaDI3RalVuxJjlxE2J9xF3N9M8DjZEk0srQcmrmvi3UHFrpMpOEpvuffT+yzMp/C8CDrVgDytrUm+wQ9v4AXUTFnxrj/ab502zkI90Q78Yo/NSC/kwww32aLfLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVY/W7rXrjzOuU7AmsMusmaLb5WyU1yQoHv+WemewZo=;
 b=t1xo+PvsnKdpEFUyyTEyS65bbfajqsntoafCxU1lzSW75uYxeotDZyJSWNbvNcl+VE0tAFrRs9d4JCkRfyili56HCfyYfFL3uvsjFpU9OnZli75kadNCfoEpNkWzTleIQ/KL8kUGUBVMGefH3/w/7rAP8V6a1DLS+stXtAsXtWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB1940.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 14:34:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 14:34:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 15:34:27 +0100
Message-Id: <DIFX79UQCSTK.14I2MR1FO9226@garyguo.net>
Subject: Re: [PATCH] rust: time: implement `Display` for `Delta`
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>, "Frederic Weisbecker" <frederic@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Thomas Gleixner" <tglx@kernel.org>,
 "Anna-Maria Behnsen" <anna-maria@linutronix.de>, "John Stultz"
 <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich"
 <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-time-delta-display-v1-1-bdd2d6e98ebf@kernel.org>
 <aZLWjBWaBz4h4_SB@google.com>
 <87ecji58li.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ecji58li.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P123CA0513.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB1940:EE_
X-MS-Office365-Filtering-Correlation-Id: c34518c2-10f5-4bb6-40df-08deaf6a6832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	C7FS1s0Hce5VbB4/a/kMWH26hXC311dxjnMdgLR4UeNfHcNjK81qjvcTfVN3VgSzgbJ/Bfyta7pSEGnQnw+k8kh6pxksVBLCaXRbyH7U8wikYYhDo27K4KRCTmOT30YfHZfzcdyJKu74JDL3Oieg+EZBejQo4MjH2tTr50+14Wz8oIS8vs4paZq89V63iFClbrYDG64Ip3SNQmkaW2X/qThUe+GUyOfH6Yohah5kmJSvTXcp/FRte/RhJBCPnUst5SVpusVvWmFzczOFwMgkFWdvrbVy17Kk8IeW+sr91XShqYRKgGLVJdJ3HsO//2EWy9M1TEnVrE8DzhVsSoj5yxv0HitaRa1uaDfUlhFczRIRdaMtchvGXvnyupHa6g0KM7zf6WmV+tZuPIqUelXubEp2XssOJGqhiXhMtHLSIAkb/nC4enY8rFC/rMYPnomM5MAsEswvfBvk0+emhPj8OM0ytqvD+lkYgi45qySaQa2uP3PhkIiIHZ8ZlCtd7Z5ZN3t9HAS2P3KRvi5fTs1t9+UMZBn748U+d0jM6urCOdtYGZtZ3TCetrVzyzQ1RElqqWMZTTV5f3VijHw1PikwPMEj/yLfZN/v3d88a6i9/SCT1UWUlFefFo4GzuWUcW5f1Uy+uh5qoJt63cTAbeJXDJJaZFEdDpxAulXHatlnuBmVynWzH/R20wpSGYEdavcw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkx0L1luY0VvYTdwWi9YWVk4cWZmV2srd1VYZmYrcEtqbUtzZks1R2I4MXZB?=
 =?utf-8?B?cEJQWnNzRTE0TkRxK1BlSlptcGJzNTZpMjQwMFZOdXZOUThuZm8zTDgya0lp?=
 =?utf-8?B?S2NKQlgrSlcvaGJjaDF4L2V4S2g3bTF5OVEyN1VCaXVrTG9VN1I3T2FHZk03?=
 =?utf-8?B?LzNVQTNyRzBQQk5ZcXU4MTNoM1FSdzlXR1VrcWtJN3o2THZlcksrNnlPMDZC?=
 =?utf-8?B?VCsydFJvT3NlQVZBSHQ4WkZWMFhZdUJUeVlZZ3FoNGE2MFJnNzRFYVY3UEFh?=
 =?utf-8?B?TU80Q3Rwb0c3eHJaT1NicFlsTXZSakY0NnVOdDIwYWJvY3JJbTk1cmFueWRr?=
 =?utf-8?B?TVZYYU5vR0ZDODRjZGxhanhBMWxNNWwvNVY4NWJWNk42RlFLQVY5OElFR2FH?=
 =?utf-8?B?V0ttTUJ6bXkyVlh2MEFHdjJrdFQ1aHJXOU9EMmpKS1Q1Ukk3TGF4YUhLN0Jr?=
 =?utf-8?B?VGVUckpnNHNPejNSMTc5cjRCTTZGY2p5Zmd4T0VwTml2WEJGcEl2aUlOUnVw?=
 =?utf-8?B?V00wOUJtYm14bkFmeDFBYkY1Y0pNREtPOEFUKzdhYXc3QkthRHVnVTY1OTBp?=
 =?utf-8?B?TmEvNzBhQzZwMFNVQXZQRlpzcENkZlgybWttTDMxVDJsSFN5ZjJZd0NhbDFh?=
 =?utf-8?B?NHVoeU1KTmdVQlZiMkJjalJsUTNwV1lSZEpjK2tRbFRPWS82L09yUjgydytw?=
 =?utf-8?B?NTdYUzNzV1QvTm44Yy8xSkF0elBhZnM3Rk5MRzhxUDJwQVhGd09NcXRyVXRZ?=
 =?utf-8?B?bUdSajNqVHNaN2N1TENHaTFvSlRhR0JQb3J3MDVWRlF2UndaNlAzODJ5SmJC?=
 =?utf-8?B?Y0c0TEY4Nnk3TWlaYm9IZ1o5b252UHdaYXVaaGUxSXlCY1VzM3U0VjMvNW5I?=
 =?utf-8?B?L25KN0pzVHpaY1Z5R3R0eXVaSjByd3ArdGJRRktweXZNRSt2QThSUlEzQkti?=
 =?utf-8?B?VFB1S1hXN2lXWUt4QkZvU3JtNml0Z2RjZjB6Zk85ZmdwVFFlMnFmN1BUWVJq?=
 =?utf-8?B?SEo2ck4xNTFGeUNIM211czhhV21SSTJ2RnE4b3Z1WXdhZ0pkVVFWYjFDYlVV?=
 =?utf-8?B?c1lsZlhkbU1lcUoxZEFVV2JxSnRvbFM1dVgzUWpvNDYxemdob1p1Z25BbTBQ?=
 =?utf-8?B?bUdnQ3pISDd3UmFLRk5oVFBmUGpUQmlPczdkb1dzbTdIWnlBY1UyR3UwVzU3?=
 =?utf-8?B?aVN2UU5VbmtuL2VzK3BTYllkSTlhN3pFc01zRmJjQmVnTjQ5Y21pcDFOZHZy?=
 =?utf-8?B?bDZZdTEwalJRUXpwaDZjbWs5bUw5RW85OHRDWDFpVE1DVzJsK1NJSmhxeW4z?=
 =?utf-8?B?QUxUVnBNVXBFMkxOKzhiN1luR1M5VWNpdnNKU0FFQTcvYjNQeTlGSWVHTjZ1?=
 =?utf-8?B?ZUZLVytSTDQ2QWM3TE1yaCtHUjBtS3RuZTZ0cVJCczhLcjNXbGRDQ3c4aWlI?=
 =?utf-8?B?ei9mV1ExRGUvR2k0VEt5RDE0ZXBmQ2dPd0V3ZE1EbUpQdHNOWnFEOWUzV1hn?=
 =?utf-8?B?aGxtcFJ4TUVraU51SFRyL1Rpclpva1hQTUx5MnFpQW5TSGlqNURqckdmNExI?=
 =?utf-8?B?MVJJdk5KZ3BhT3BsUHJWWmhiK2dtUVBRc251ZVVXcFl6TGhtcDZHUlFBN1BT?=
 =?utf-8?B?UnZDOVBPV1lUc0I0b0NhYU5XeEEzOXdNc3RFbjAzdHY2MUVXZ3FtdWgwd2VC?=
 =?utf-8?B?cURSdDJ5dDUvS2pXUDZxa01WVkdwMkFSanVHUDlwMVloWGNyZjJ0RC9PL1Z2?=
 =?utf-8?B?M1JFWGQva2NCTFBIMitaR3dRcUtEUkVmY0N2cGFxQlM1ZitJRXd6bVBscEcr?=
 =?utf-8?B?TEVnckMvY3AzVDJpWVBrcGRreGlmekp6OG8vdjNTMWJ3U1JUdDlhdlJWOGVN?=
 =?utf-8?B?aUNuWWcyR1RuV0wvRjQ2TjhsaGVmSm9mREJ1THNmVGNNWmdSU1B4OGtxNjl5?=
 =?utf-8?B?VVdQWUoyVytLL2RMVjcxdzloK2xYVDFWREtKTmdFR3YrTER3WVJnSDhhQlYz?=
 =?utf-8?B?Rnd6eElnYzZkVFJpZW11czhnOXhKK2JtZGxiWDJwZjUvUEVJSExFL1hsR2Rh?=
 =?utf-8?B?WHVIa1g0NkNZWC9qSW1jaGY0YnlXY0QyUVU4bDJETnUyd08yMUtTUW1zcmdI?=
 =?utf-8?B?ckFFbVdPNzhjOWZ3akNSUWM1TmJ4K3hCcU9pVUVHNVAzWkk0REJ0dGljbWJs?=
 =?utf-8?B?NVBBU1lyL0xYd1pXR1NGWnhrOWhDWDdlTFpUbWZnclkwSDJ2OGZGbjhDVHho?=
 =?utf-8?B?dXBEekNJWUtpd1EzZE5XWHQyS3BLL1hCUUcyeUlnZk5aeGhZUW1POTZaRjlD?=
 =?utf-8?B?MjlNUTlGMnc3VERSd0h6SzJWRThBc2RBa0cwdm9xMG02akpRVDh3Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c34518c2-10f5-4bb6-40df-08deaf6a6832
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 14:34:28.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUJUJrXLo2W7WI+GsZF+hZcXHHlTi4VPSb+g3DcdsCZ5A/X9ys9jZ1kRi3fUAJHLl2BBSVCSvS3PwAKWwRB5Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB1940

On Mon May 11, 2026 at 3:22 PM BST, Andreas Hindborg wrote:
> Alice Ryhl <aliceryhl@google.com> writes:
>
>> On Sun, Feb 15, 2026 at 09:14:05PM +0100, Andreas Hindborg wrote:
>>> Implement the `Display` trait for `Delta` so that it can be displayed b=
y a
>>> formatter.
>>>=20
>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> ---
>>>  rust/kernel/time.rs | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>=20
>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>> index 6ea98dfcd0278..e18fd17f38c5a 100644
>>> --- a/rust/kernel/time.rs
>>> +++ b/rust/kernel/time.rs
>>> @@ -474,3 +474,9 @@ pub fn rem_nanos(self, dividend: i32) -> Self {
>>>          }
>>>      }
>>>  }
>>> +
>>> +impl kernel::fmt::Display for Delta {
>>> +    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::=
Result {
>>> +        f.write_fmt(kernel::prelude::fmt!("{}", self.as_nanos()))
>>
>> I think this can just be
>>
>> 	self.as_nanos().fmt(f)
>>
>> Though I think it would be nicer to include an 'ns' suffix here so it's
>> not just the number?
>
> I was planning to use this to format a delta to output via a configfs in
> rnull. The existing C driver does not include the "ns" suffix, which is
> why I did not either.
>
> I am not opposed to adding the suffix for this particular
> implementation, but that would mean my user for this code will no longer
> be a user, and I would drop the patch in favor of another solution at
> the call site.
>
> Please advise which of the following make most sense:
>
>  - Merge this patch without a suffix.
>  - Iterate on this patch and merge it without a user.
>  - Drop this patch for now.

Display is supposed to be user-facing and readable. So to me it's weird tha=
t the
"Display" impl would format "Delta" as nanoseconds without a suffix. I thin=
k if
you need to depend on its behaviour to be just nanosecond numbers, you shou=
ld
perhaps just use `delta.as_nanos()` on the print side.

Best,
Gary
