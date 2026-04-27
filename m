Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021123.outbound.protection.outlook.com [52.101.95.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E093B38B9;
	Mon, 27 Apr 2026 23:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777331289; cv=fail; b=kJDfLFFDzScqrkTFNN+s8SZkxrEn+LPlv0N1d7+1GvMX2uwzHGIb612GKubwzb3hVN1eeI3PSQAoc3nMEfa1SIsrrvIHjgJhNO3iLNV33doXbwvPjcLX7A/e/cMsYQYzGo2M0sHtw4OqeErU0CL2UQfm+Gqq80I/blP36AaLKVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777331289; c=relaxed/simple;
	bh=QTUnbKUVIjoW2AogOq9VVKBpZma9qY7gIIM0gF/Yo3M=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=MdMkmPdBxG7fJj7DDnKhz98Mxc0IU2gvJRHLmYqqSp8AgBXq/CBCssuQH/w/FvDj0dkivpKqswScjD3h9Wul5hfZq07fVJ3pOb7qNgUQFfzy0LJL5n9aWzMwxmfrgfOBUs04eJXMc+2uk7HMlih1CsxIULWt2Wq/IdgdIEpbdwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=dkGwjHq4; arc=fail smtp.client-ip=52.101.95.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="dkGwjHq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dubG1b7b2Di6lgtToNBgeJDBGEf9evBhITUMs8OH0Ntpp8qc+fdPKrFEnotjcMIey17xAwM5SiabHU+jYCHzIPbTUueZGE2EENTyGzhqyOt/qXFhnkT0SUca44cOs/PJA8iycm0wnMGAsrj28DMfvYkB0dLNCWXWLAW5WWKtSHkwdKMuJ/nQVcqDkXMPiTXJUeRdyYLGI12084ABjh9OqFeJ/wNhk+IyhUANjQw+H4Sagrhkt1cdHM5jI4OrDKgwq9K0bKVn1auqT8meTv5JTZdg9mc8u3eOf3Ez+y93n7qWd+QPFNKICO14wFnNUxTDXVrvEN2Y1ek7LWxcH8mX3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTUnbKUVIjoW2AogOq9VVKBpZma9qY7gIIM0gF/Yo3M=;
 b=MEGmYS2rzmnB+LYU7vgmEKc9DUl+2oD2fqtoQfHTMY8Xg1VIvBqov0/Zhc07F3+ni4nQP/wbm3MqR4aX/UGgewzpGN+e0I74DudKPUXmflUuK5oFMOycB5NbBT5BTRYHoCgbLfX48Ts/LE8qtbTIJHzdAEF67CTeSF/615dCR8TOHhCWPiPJXotZBT+C0dKdIcZ2UJn6f0iiZB4aAVRtt5MUp15tn9iRGZtmZcEGSCJl0mcNP1JLXsHRjsPe/6aPz8WgnNi/JRrAcQ+zdzmH8e1aVpQDd990NqIsSX9nIQ6bcRcUy1HdMjXqTwbjWn/C1yfPodUKccVYZwbMZ7W/qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTUnbKUVIjoW2AogOq9VVKBpZma9qY7gIIM0gF/Yo3M=;
 b=dkGwjHq45dG+j3qfIhNGGw2SchmsoTGd3ybFpLpLQmgiWVrtNq+kdau/F9qA9apkGE3ASai24kwQl5G0F/oRRjqKi62+UO0zs6ybFnvF/UbA6hC1bwIjM8jMFAAPnmsLfa9Q5dT5t+p5+AlNTHGxc6gTAa19PiT33nQ8HUbl/tk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6721.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 23:08:02 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Mon, 27 Apr 2026
 23:08:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 00:08:01 +0100
Message-Id: <DI4BCUVQU6ED.1BIKMGRXW42PD@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Christian Benton" <t1bur0n.kernel.org@protonmail.ch>,
 <phasta@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lossin@kernel.org>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
X-Mailer: aerc 0.21.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
 <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
 <adS9JslFrhFK57os@google.com> <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
 <eca3a1b9712a132a400e51247320fe44aeef168f.camel@mailbox.org>
 <i_q9YNda77b8VwQ-EyK1uAnt4tqcSiGoTZ8YdIVmjBNi8NDf5fBm-S7pqL03VRx8mI6jXxcF8N1asgnpX1QFqDoZ7TQ1lyxiQms5vQSe-b4=@protonmail.ch>
In-Reply-To: <i_q9YNda77b8VwQ-EyK1uAnt4tqcSiGoTZ8YdIVmjBNi8NDf5fBm-S7pqL03VRx8mI6jXxcF8N1asgnpX1QFqDoZ7TQ1lyxiQms5vQSe-b4=@protonmail.ch>
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: f416564c-d1ce-4e7b-4149-08dea4b1d4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	7TXbZB/TvqxxnUH7Pwl8o4xMsciw/QfGxuqbKC5tDxtS3BXI/wmeR0Z6kZb7b/+JqBR1/yTKVcoY0A0KLJN4+cWlKZ7rLdZPDVzuWrNg3IMM27PBtZ9zJ7tZCmBj+JeWB0HRas+Rauft4cbSrCZb96jjCqfRPlxT3Yfag0aYNcTWOmHvy10v8MqlrOtfvq7eStweteyR7zpLj9avZ4OiSa+iWxcrjO3t9M22fiXX6fhIl11U3k+2wuFd+46KrE7eeEvXXC3ASE/r9nkk/askVEmz4u8B4w8sTbSGAFEJeVcxjAM9jqpf7fYxEKh2IvIp36BeDGG3WVm2lFjBK21N7zjFmYrMNUQN6yA1cDX2RVS9hFus4dafNXBFrh5Rry5aQto9MWWnlB7CzQXoKXiM7UEoVWaV3zE3seFVWD202iQwJJ5GdXy/kVeFcgW9GAGEfYlDknTc4II9Fw4cBSHb8hKwVCRHcQEdQY/380qDygt79/o0sEFk1Se0urSibcvOO662/OxOPVg/2yok2kFMY3xQ92QhVarQPVW/pApSIjG8V1yD3b8hYaQsIWCB8qw55DaqC2c7QamT1rihnr5vPcWnYqHAQWIpJTbj29kRdzt0zvUO8mNKFnXjlQVqaY8mJS/2pt+nrGHQ3KSatVwCelPqH/FXv4tlsWG+B5Lp7uPJaBXqjW8QFB9mzWle+k0/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNLTHptdHZKNjAzWmhBaDRKSHQvdHhFNkhlQXRkUUZVeU5HajViZGlydEdR?=
 =?utf-8?B?dTBWRFhPYWVnNXBlM3BSK1lTUmh2ZFhMVkZIWW9XcW1tRWxTWGh0SnExSE5y?=
 =?utf-8?B?aFhrZVBYVk83VnZvMjRwbXBHbm5oZFQyMFFHWFFpYXpXUEZtbEtEeWVhU01K?=
 =?utf-8?B?SDlhdHUvazNZNDZoM00wdU4rRzdDVkFBdXFHRE4wYlBreldrS3BtcTJ0dEhs?=
 =?utf-8?B?bkZiOGRPRk9ySGJCRkVPakxNVTQrclJwUGJUbGJGdDROajRNcTFNOFRORUZO?=
 =?utf-8?B?NWJQVmgrWVlVN0ZQUGc2TnBFeXVGTjVvcnhkaGtYdjFyekxWSnZXSEY2anNY?=
 =?utf-8?B?bzhvbXZlTGxyM0JxUnpYbTk2NjVpVldDVThJdmEyNVdKOGdIQkJlYmNZczZo?=
 =?utf-8?B?SDBrR1FuV0lGYUVQNjBjYk1iWWloQVgxdDBQRGtaQ2dLYnJ6emE2U0MvY1lS?=
 =?utf-8?B?QXdLTVpvQlZmc3dwOHk4cUg4T2lJL1ZyZTVaMCtiWGdLZlRUQkdzV3hESWRo?=
 =?utf-8?B?ekxWRWFTenFQcDd5eUVrN2RwQXcwelNmTDdOcGtsRktWUzkwNUY0Vlgyd3Zs?=
 =?utf-8?B?OFdrenRnYTRzNG05eVEwcG9tcEVhUlM0cFExbHdQUSsrblc2akJYaU5FdXJX?=
 =?utf-8?B?WVVSYk5zUjlGVGN2UENzNTRmdFZBeHBFUWR0KzhPWmVUUzF4TUM3T1c5N1o4?=
 =?utf-8?B?Wm8wb3g2NlRqNENhSGJCSjkvblA0czF2UVZXTitGTU5jVWZ0UXB1MEY1bmk3?=
 =?utf-8?B?SGVqVlFwcHV0VEd3VTVoTDV5bmtMdklwWnNXQTF5YzNQTEw3cE9jc0J4WUlQ?=
 =?utf-8?B?SUljSVBKN3UxQmV2L0c5cHBOYk92bldHa2drUHJHOWMrcGRkRGxvVXVHRGpj?=
 =?utf-8?B?MDRpdWJyQ2YvdEVQY1ljbFhNTldteG9LWUVDQmY4bnJuQzd6dS9QTGVDR3pm?=
 =?utf-8?B?a0p4eVNxOWY0V1pqdDVPQ0R4cFJMOUhmemtkaEtPRExpUkNWSVBwbU54VW9B?=
 =?utf-8?B?a1A5eXVaczY0N2U3WU92TDZocUJTRzhCcDRXbC9TQzhuMkZGcEl3SDVlWmZV?=
 =?utf-8?B?aFJwREhkM1YvNXJpd0s4VHA2Y0p3NlhmdnN2QURHYnZPOWt5TWpBZ0RObXk3?=
 =?utf-8?B?ajUvRExhS0VONDUzL0hPbUI5eFZNQkV5WXd5Wm9qS2Z3TkhoNXBZdkZGR1RX?=
 =?utf-8?B?d2RVa0RnMXVyWWpCQlhoK09MSWlnLzdkaG5Mc1FadjJvMU04VHVYamlEcmFz?=
 =?utf-8?B?QkN5Q3phNVcxdGs2clFPUmdUMmV2Nis5VGVTYXlEZzgzbUJBalcreFdLRGRH?=
 =?utf-8?B?ditnYmpxSTluYkZNZ00wcXJsZWtFQ3hSUHVxQ0laOFZnQk9TWXJiVnk5LzF6?=
 =?utf-8?B?M0kxNWhtTzhHOVlvZDBSZWtUL3lBMEUwMlI2d1U3TDYrUk5ISitoWEl2OGFl?=
 =?utf-8?B?d3B2ZU15VEdzM2pZRlE4Y01XTkhxOEl2QkJuUmdzc0YyZHlsQ3RSZU0yeGdC?=
 =?utf-8?B?M1pkSlFiZ2pNMnVRRHZmRmE4aW82S3U5eXl6ZXJGOVZ0YXlPazNOVVNBZnZh?=
 =?utf-8?B?VHh3RVIxN2FJVFZwVnp4TjRpdXJ3MlVsb0d4QlU0U0VzanJVZlNtSFM5U3Nl?=
 =?utf-8?B?WnZmcmFqUWIzOU53OGE4VmttcjhmKzVuUG11cWs4ZXZhTW9UUzg5ZW5XbFJC?=
 =?utf-8?B?MjJCZ0JtT0FXSE81UmFuaEpkSzlLeUp1SUhTSEpBb3BPS1VQUWYzZkp1SjdI?=
 =?utf-8?B?YjNRSnVDY29nZE9qd1hUUGcrR2ZYYVNwenkvWmIyYUFrbFpVS2NodEl5VVRp?=
 =?utf-8?B?R0ZJbjIzOVlndWhneTZhVHFTZzJQR3pqMGUxYm5sYXMwYVFDSFZmSiswbDcz?=
 =?utf-8?B?VERXdHp4c1ZjcU9QQS9LclpuVEhqVzlhNnA3L1dDVDVHc3I5bCtKRktHaDhB?=
 =?utf-8?B?ZFlJOHkzREs5N21aV0wvT3ptOElVTHZTNU9RRTU0UDIwcHZPTk52Q3EzdnhM?=
 =?utf-8?B?YUE5K2o5MitaTC9hWjJnMmU3N0ZrQ0lVY2lsMXVlbUM2a2g4VlJ1bzVLc1dB?=
 =?utf-8?B?eVVFbWRFZEV2RGhxTmQ5bG5UdGhGT25uOFkyNUc2REQ4SGp3N2VsSTcvV2lH?=
 =?utf-8?B?YlZDRng5SkhVWE5HMWJRTDZYbEpzNTErZEt5SmpyM0xZaFUyMksvbVBkMHlG?=
 =?utf-8?B?dERuZHZveDVWeWEvcCtuQUpPNXNSRGVKZ2lIZW5ReUxISlJQblNQbVpQeHdD?=
 =?utf-8?B?K2J3V3pUbmJRVkZ5aFdLT3F1R2hWVHBhcStvUEhpWVA0SHVHdG94NzB4TXZp?=
 =?utf-8?B?Qnp0bGdzelpQRW02QkduSTVzRjRIcHFFOEVTYnlPRHV6YjBBUTY4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f416564c-d1ce-4e7b-4149-08dea4b1d4d1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 23:08:02.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60tcNQPv6u+/3NZ/ANwiJeGGBI417JomCxXW2Kj5Z4UvDvkQqo48A+WBC10LcKedfHNNE4gB1kB/aYujJ0KaYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6721

On Mon Apr 27, 2026 at 5:53 PM BST, Christian Benton wrote:
> Hello Phillip,
>
> I am interested in taking this on will do so. I had reached out to Gary a=
bout
> his email and asked if he would like me to. I wasn't sure if his email im=
plied
> he was to make the change or was mentioning the idea to me for me to do i=
t. I
> am, however, more than happy to.=20

Feel free to pick it up if you want.

Also please wrap your email and use bottom posting
(https://subspace.kernel.org/etiquette.html)

Best,
Gary

>
> Sorry for any confusion on my end.
>
> Christian Benton
>
>
>
> Sent with Proton Mail secure email.
>
> On Friday, April 24th, 2026 at 7:29 AM, Philipp Stanner <phasta@mailbox.o=
rg> wrote:
>
>> On Tue, 2026-04-07 at 12:56 +0100, Gary Guo wrote:
>> > On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
>> > > On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
>> > > > The SAFETY comment for the call to ListLinks::fields in List::remo=
ve
>> > > > was left as TODO. Fill it in: the call is safe because T::view_lin=
ks
>> > > > returns a reference to the ListLinks field of item, and references=
 are
>> > > > always valid and non-dangling.
>> > > >
>> > > > Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
>> > >
>> > > Thanks. I agree that `item` being a reference is the only thing need=
ed
>> > > for this to be sound, as reference implies that the pointer is not
>> > > dangling.
>> >
>> > (cc Philipp)
>> >
>> > FWIW, I want to change `item` from a reference to a raw pointer.
>> >
>>=20
>> Are you still working on that, or should I or someone else pick it up?
>>=20
>> Regards
>> P.
>>=20

