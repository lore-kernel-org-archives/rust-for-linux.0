Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020126.outbound.protection.outlook.com [52.101.196.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B63E5EF3;
	Tue, 28 Apr 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372764; cv=fail; b=BI+JlxEN6GKm3wx8ALMeY/uKRFsmr6C/MIPp0g+BWyCCXQfdJPiHOVBwJMTlkx0nR/c4kXy3cbk90AIYLp4vDv0wgmIokSYpQDdeOa2i4ft/1Ct6vm7vMh90NudyeYI9gre4w/msOM39I5VGTx7/XXZuORSszpq5kwMTSDmGDBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372764; c=relaxed/simple;
	bh=/3kyxHEcPOTwr/TjBvubia2W5SoljGkBQZS2AjWo/hE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DWEbaBYBS8DHGXcPRs9+5pQXl0MjRCO2l9EbNrCuUR/aw0rRicBmT3tjpf4cDb0y1JsuTu9tobwGITv1FjBphaBgv+bDSNZ4Nw0XbBwhpaE/GoahOg7zevu8vbCGtiY+wGNNnN4Zm55mlbH5sAq0xOJ1cWkT1fO1TUNDKadzjmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qL9yQDPj; arc=fail smtp.client-ip=52.101.196.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="qL9yQDPj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iymcx3GS5GRz8JOnLLqeyk2MA/riJIOrggBigmfxqcAZeXQf+blsoNzFGD5tJq4nfN6nHGkcKD4+llDK5rHBHoiUgmN73aGTSvXRt0/0Xm6S8fi5QAvQJ4V0waQVOoXfnMHdXwfDvIp8YJ3XQAh2JtIf1nt7TxR+LJehASZWuGNQ0Sms6TeTDKmqcivxkJmthjOnFWry5O9p2yK/ePPHIgNRXdG388ZN+3Zrp2TMbSk7su9gnd4d72UZslpYUPiCsRDHQt7d0dDiMmvl6oAnLIRDYra6h1X52zy7yTwgOTR5wrd2JcNPUYDUFgGeIXud78Sfns/mtUlCHBPGrIDOGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQnZ4XqZmkrGHH2EIYnjgFrjSqXKTtQhUuCoHYJNK6c=;
 b=bDHEjEjvUxcJQ3fTINUqH/phprmX4b0UrCqwcYO43Ijj1xGvx2ECldEhczTtI6F86Sp9n0M5kQ75OKj45KmcIOzdLG6Sx8kFEiy+l+GXW/STJPr0VtHPFKPZXJ64hQKia7jdMAL3eVSemnwl6y935l6Mhi/Ev5N7ssrKIgVm4KS1BY0NY+PXKYykGjTAGKnX10dxaYmPoWiQ7SBOvorb5FFNEoBayJHYRz7a1kmOa+M1zZvXHCOMCGpM5QYqIMigDXR5OVyEm1/YQ8aYBN2yzNeuNzRMhYr6nkLZLIdODo5FtaGttPQF9b9F75ugkWAtvrridS8UIjsN61XNXy7qxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQnZ4XqZmkrGHH2EIYnjgFrjSqXKTtQhUuCoHYJNK6c=;
 b=qL9yQDPjdqa/aTM9yT6ZXUdiNsKF866keY/OReVTz9ntLQJV08L20DiM3NOVEdXnoDyH1yz60T9Ct48eWFd0mEYZQqpSnpLTuBvg5pz2FMIDUXD5OCUU4EaYhI7X69ditOXINx8dES694DWGOUbPCGqRS8+buHmhq+HYek5ROjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2587.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 10:39:19 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 10:39:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 11:39:17 +0100
Message-Id: <DI4Q24LGYM9X.3EXO7UO162QV7@garyguo.net>
Cc: "Christian Benton" <t1bur0n.kernel.org@protonmail.ch>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lossin@kernel.org>, "Philipp Stanner"
 <phasta@kernel.org>
Subject: Re: [PATCH 1/2] rust: list: fix SAFETY comment in List::remove
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260403220751.15374-1-t1bur0n.kernel.org@protonmail.ch>
 <20260403220751.15374-2-t1bur0n.kernel.org@protonmail.ch>
 <adS9JslFrhFK57os@google.com> <DHMWK36LPD3S.2V9DV6BT60YJ4@garyguo.net>
 <afBhYqOOG0H3AZkp@google.com>
In-Reply-To: <afBhYqOOG0H3AZkp@google.com>
X-ClientProxiedBy: LO6P123CA0008.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2587:EE_
X-MS-Office365-Filtering-Correlation-Id: b412e1da-e0fa-4673-3add-08dea5126655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QCKXYIYjZOE7B1U3UAOKCW6hS8WutqPombtUG/pkL3d3OkxxSNSSQpKfa5rNYB7FM6qetjhA2b5mhNwB3HZBcce/F2wMdkdkzrCeOIJFA4xKVaq45PcHFpp6B+vczuSUA3JN1uNZk3ecKOfbzacbtf59FN3p1eNcCXItnKQaoBIO8MI9+PAJOJXWTB/of5DpBWd6Sp5scRoI5/BF4n8S+pK1c/QTnOja57odA8zSTayrvtDn5FzhfQJZqAD+ntYcx20DnOYJED8vCnbeuUO95GMxI6RdcQSLy5q2ptuN5cgkozyi2L+g2Bzmln7Xzho6jlMTDV1VLXL98kRqWrc0QWFiCBdC9VOLjgsxWaQG1KhY3oc4ti77u9MUoXb8T4u0nLcY9Nu5qCz+alaSwZW3RZadwAomkP0KGA+36P3TX1JFMNTDVZwkcP+sg+xL3kWeuHEgPHPTSHoGfEb93xAiBv+pfopKkjVzJyvnCjGunwAKGy0Nw4QsFsaKAesOEaLp8oYRAI3u6SPnT+Wrx5EPQajYUitW8xzYnXQsxKTeHrjKEl18ZNKUp+BFc4TZOOvyoGLMlwsjCmeuMHh9eCrXXzfPVkYGnJbIEwmy2jgDuLUslCQVdX/pg3lGGmLjN4SCB/sEVyCVWVrEjFU6ENT1ZU9sz8cmoS/XlIeL02NDrAo0UqsgTYAu3uRZCmOZBDJegrmrqgvDNO3BIL8Lk2JwC4PGWNcJF1cnwN7611z0kto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE5TSElGZUJaTDNCN3J4L0trQzZmbE5HQ2FlUC9uT09sM2huKzVyY3RUOGlk?=
 =?utf-8?B?d3VBODBZc3J1ekxzblVUcWgxaDNPK3MvREpsMnVzZExzSGd5cmNqd0JKcmZy?=
 =?utf-8?B?d3hXeTI3UkIvQkNUNjY5Y1dUZ3JubTFQeGxYbE1XVGpJd2ZLM2dEMVlOTlox?=
 =?utf-8?B?elI0MjhVU3F4TE9zdkdBU0RNeDdaa1E4elluMXpsTGppNHdwS0F1VS9uV2R3?=
 =?utf-8?B?WmIvYzZCN3lSOHB2WUk1ZWt3eUl2dlpFUHc4VjkvTmt4OG1HdWF5YUtJeXlz?=
 =?utf-8?B?NFBXNVRSdWRzQlBVU2ttSFVJK2JMc3Z5RE5GRnhxU1UybEhOY0pxenBWb0lC?=
 =?utf-8?B?VDd4Q0c0VnZxWExGM1ZjUVp2NjMzaUtWSXplTDB0QzUrV0hzK2p6RE8wM09W?=
 =?utf-8?B?V3I5S3lqbXg5MnJ0QzhSckRsaHhLMUNQbTBwb2FTcEw5ckZZVlFqQmMwVDZ0?=
 =?utf-8?B?d1RNRS94ZkRsanZkUndDKzZjcjJCMG1GeUkxWkdlZmVpWTA4dzB1RFE5cXc5?=
 =?utf-8?B?SU0yaEE0bVFXdHQ0K0cxS1A4K2J6RW5yMXhqMEhjM05JWXFWVm1jVmh5eDdS?=
 =?utf-8?B?dk9lWUhpUDRSeHJaOTFVOEU2UmR4L3lDd0ptNENzakYwWk9kSmVOTkdvbGFj?=
 =?utf-8?B?T3lRREpIRGpVVDU2eVNVWUJxRUlRU1JFSHZURnRVWEdPcElNRDVoVE9rZllK?=
 =?utf-8?B?ZlQycGtOSVNWWDVyNWZVNWJOSWM4dEhEenVSSUNJaU5sOE1wMlIvdzVGYkph?=
 =?utf-8?B?RVlkSCtERk1EKzB5WXk2eDZyTXRxb244SytvNWgrVEQyTHFSc3gzVGJNdDJz?=
 =?utf-8?B?Qk1FckFERktFd0NOYmJqYTd0TEd6Nm9uNlQ4WmJGK285NGZmaElHYkRHQlpG?=
 =?utf-8?B?RHJMd3N3VlNqR1ZtUFE4MkRHK29nQXBQd2hEYWNsVDk3Wmo3WU1YWTFJbXRz?=
 =?utf-8?B?c2c1a2hIU3RWbkE5eTNyS0xmdUhZMDg4anJhUkdKTXVEN2h5Y053UFE1MlBE?=
 =?utf-8?B?V2pEVUpWWTJqNlUxQnN1VlNpdCtyc3lyQiszWUVjRVkwMDJMQmd0WXNFa2Er?=
 =?utf-8?B?UnVNaE1FSlQrM3lKMW43VlowZG5TczExUytZV1Y0OFBtT3ZHZmhjNy83TW9T?=
 =?utf-8?B?d1IzZDVsbjl2czhIV1ZWN3RpS0R1ZUt2Rm5obk1iUUFqUHJPOGxUQnd1dm80?=
 =?utf-8?B?MGxDY3lhYXZmQXUzaG1mZHZpdTlvcFhCVVNSaS93Mzk3dlRZU3lzUHBJOVRB?=
 =?utf-8?B?bTR6SjBwL2tkUHlnMHQ0QkJWMkVMZTVqZ2U2ektvbHdXV0ZhWGttd0tJYkZT?=
 =?utf-8?B?Q3U1NkdYVms4UFN1L2l6UlpRcVZvbmJTSTE1YWNXOENFdjFQakhGVU1jZHda?=
 =?utf-8?B?eFhoMUsvYVV6bjY3N3J3T1VLNDBkR2F5RUxidiswdTkybDFxeWozOHdNM1RF?=
 =?utf-8?B?ZFBwK0pqRGVRbjVEbnZuS3ord0ZQZHlXRHIreWlkUnA4V3plS2FwQm5sZDB5?=
 =?utf-8?B?Yy9EZGcxcEZ6VzFuSWpRMlZXTU9qK2k5cGp2MEJBdmE1bVlnbFBCZFNCcVpw?=
 =?utf-8?B?SWlqSlU0UzZnanVyY1pHQzh6VC9HbnV4M3hBQzcyeE9pVGdHOFdhbG83Vk01?=
 =?utf-8?B?L0pSYzBUb2lGd3lSVE1CeTAvSythcFNxc2k2TE40clFPVkdxRjBoSkVzUlFW?=
 =?utf-8?B?UTA4UU4ycW12bmJ1K0ZxU0c1c0t1ZUJVN3NIZDNkbDdPeVNJNll5QW44UDJx?=
 =?utf-8?B?RTdFODFHRnA5cWh3eHQ1eXIzMmtqYmN3VG1pb3hxV0lWTnVPZXUrSm90WUZG?=
 =?utf-8?B?TTVqTThSeWRoWDgzWmliSWdFMWNwUGRFVFNKeWdwbmM0TzJYSGtQdVFZUWI5?=
 =?utf-8?B?WHgyMHZDRUgySnFLVHVtRGo4ODJUbDVveXplc3JqMHl4VDdHVHZwUGhzYlJk?=
 =?utf-8?B?cXVHbHJLN21mMStJb0JsbmRid0lBdUJVdnVaempSVEczc2RqbGNEOUR5ZTNM?=
 =?utf-8?B?b3lEV0srVy8vekVWZUNXdElWYUNZK2RFUkdKVTREK1pTRUl3bEtoY1Z0OWZX?=
 =?utf-8?B?QUtoV2FRaG9EZ2tSOXAyQmh3SUZ4dk8zQlBCclo0b3gycU9rU2s4bWg1M21P?=
 =?utf-8?B?VXFLbkR5M0ptVzI3dWRiSnp3REJucjVpelNiZEQzU1kzNU8vME4wTURiN0M5?=
 =?utf-8?B?cXRQU0dIdFFkaWZVK1haZDFvODVoWWg2NjB5QnJvQzE4WEUrMlphbkhkNEJG?=
 =?utf-8?B?dHdLUUl0U1dMblU4SnAwNFhZZHJ1SVNsMUNuUXhGMjdRcDFrdlp5SEozVWNW?=
 =?utf-8?B?VXBJMEl4eDlkVzllRTcyM3VHTkN1WERYVW1XdW5mZVV4YlNDL2x6dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b412e1da-e0fa-4673-3add-08dea5126655
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 10:39:17.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bH/x1U6573Ttm8k/Kf7/xE5nrswXufRmxfAIif4EYfTkwXG4otQeVx/YVAf38wK6kdVaDg1nb1m+RIeUHoPx3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2587

On Tue Apr 28, 2026 at 8:27 AM BST, Alice Ryhl wrote:
> On Tue, Apr 07, 2026 at 12:56:52PM +0100, Gary Guo wrote:
>> On Tue Apr 7, 2026 at 9:15 AM BST, Alice Ryhl wrote:
>> > On Fri, Apr 03, 2026 at 10:08:15PM +0000, Christian Benton wrote:
>> >> The SAFETY comment for the call to ListLinks::fields in List::remove
>> >> was left as TODO. Fill it in: the call is safe because T::view_links
>> >> returns a reference to the ListLinks field of item, and references ar=
e
>> >> always valid and non-dangling.
>> >>=20
>> >> Signed-off-by: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
>> >
>> > Thanks. I agree that `item` being a reference is the only thing needed
>> > for this to be sound, as reference implies that the pointer is not
>> > dangling.
>>=20
>> (cc Philipp)
>>=20
>> FWIW, I want to change `item` from a reference to a raw pointer. In Phil=
ipp's
>> WIP DRM job scheduler implementation, there is a case where the list is
>> conceptually a list of `UniqueArc`s; each job only needs to handle that =
is
>> sufficient to locate the item in the list and remove it.
>>=20
>> I suggested to him that keeping a pointer and do a list iter with ptr
>> comparison is sufficient to achieve that without needing to do additiona=
l
>> reference counting. Of course I don't want to iterate the list when I co=
uld just
>> call `remove` function on the list itself; for that use case I want to c=
hange
>> the `remove` function to only require a pointer (with additional safety
>> requirement that it is valid).
>>=20
>> It's orthogonal to this change as I'll probably be more careful about po=
inter
>> provenance too when making that change, so just a heads up.
>
> Could you explain why? Is there any scenario where the caller couldn't
> just create a reference to the value from their raw pointer?
>
> Alice

We currently have something like this:

    // Insert
    let handle =3D &raw const *unique_arc;
    list.push_back(unique_arc.into());

    // Remove
    let unique_arc =3D list.remove(handle).into_unique_or_drop().unwrap();

I.e. the list is conceptually list of `UniqueArc`. (I hope it can eventuall=
y be
just represented that way use type system, or even just use boxes).

I suppose we could do

    // Insert
    let list_arc: ListArc<_> =3D unique_arc.into();
    let ptr =3D list_arc.as_arc().as_ptr();
    list.push_back(list_arc);

    // Remove
    let unique_arc =3D list.remove(&*ptr).into_unique_or_drop().unwrap();

but this make me feel uncomfortable w.r.t aliasing, even though I think it'=
s
fine with the list code we have today.

Best,
Gary
