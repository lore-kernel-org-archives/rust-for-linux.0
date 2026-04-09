Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022131.outbound.protection.outlook.com [52.101.96.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEE34C815;
	Thu,  9 Apr 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729035; cv=fail; b=UXHAGj8rJUfab4Eqk9YF+lcD0eLsf+Ys8laz7kDxGmNX39WqjvqlGegMDU1vWka8kuaW0nClAGB2HaIAXTVtA66ry91Vujw2eJ05AFPfoatJpPOZS5lf74lMWt2MVYMuo99PM/78BlSWYPt+RvpE4iq8jr/Mp4dBEFt3MLhRbVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729035; c=relaxed/simple;
	bh=ySfpNJ9Q/lNJRgULOavdvHmunDLUK7EjQYHjpVGiQMI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=g/rGXeSXGAW+3tzb4RsBFjphTmxUVd8acC7vBfS0HSBUJdjwbaBZEn0vb/Umcotm/EzDOaFgL04tuHMzSuCFRIXHsA9szw5fujaYx0UWxmSVLcBr0KvPYOWTWqSDhMu18KxKJZGoQidZWp73Bboaw6n2AdPPYizuPISoEMlRtmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=bBJG+vah; arc=fail smtp.client-ip=52.101.96.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="bBJG+vah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnF2U02zUudC3n1wNb8iBDMeWAYAe3d7dbSeRStWCmXZ742Go/f0ECSqpZp1mMjAuqMSeFRprwC7eEjNcij2ZTpDS83e1efItPUhcv5tyD+qzQZFAn8ghaStB1gHAGL8WJ+g8gZNQv8ffRtaNd1nfOB8ZWM9Mztu0sxB4jxThPX4sUv1k3O8Qfh5C0EnAla55XVvhiI8MWOUWjrmqp37qYbcOpyGpew69pBw1XAunlgomN7sVdXObbofC/erahGMYEdP8svxrD1izXTbcRtFwZFyoBUW6HU3VNpMTw3EorS/TUyrs8VmP70e1NE1hunq+4w/tiaA6VTg1OIjWepDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch85p64fNuzAT7gARhxckqqviS2gYuDnRayBqAQbly8=;
 b=dgpn09Kp8+XOqNgnvdKsxU8ETAeOxUt9cug5Yx413D6QMnGEDyOIpf5+undk5gUYXive9pAaPC4lwxOGgr/C7Eyww7GSVvncfWdI9fsNY6z17VzBu7ewwiUwT8wXOzYEnks30k5HP1RZa1LGoEbu+iImSekfkV6YndnMYIJpvQ+pfoaowsdJKH5uzfpcR+fF4/ySuLvqQi+qLSXfabI1OM9TImFpX7IPYbFAMhxHktpDixTsrRoP6HxUWbsx06Iuglc+0MqTzh6BxYnORJ9EDkAWRMyy4ftBkWQqstgDWFV98iNLLbKbm2BT5IDajrbHdZyhzbgrrsf/H8Qwo0Ufkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ch85p64fNuzAT7gARhxckqqviS2gYuDnRayBqAQbly8=;
 b=bBJG+vahoYUJeSdDM1maUdRpA3GxkdGuRS42o2Os0Zo0pd1IIhPWSYvfid4Flu8xpel/BPb9cn3roKnOZaKCzccs4+ETzH8uqiiKe0ikkWl/q9h54drLsLURZETicarjsWi2nF4/StkM0sMz5Un5US3gt8NrdYc+t5vhVUHZhuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3293.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 9 Apr
 2026 10:03:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 10:03:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 11:03:49 +0100
Message-Id: <DHOJEMI0WBYX.2Y6HFZ2PYD7HS@garyguo.net>
To: "Dongliang Mu" <dzm91@hust.edu.cn>, "Gary Guo" <gary@garyguo.net>, "Ben
 Guo" <ben.guo@openatom.club>, "Alex Shi" <alexs@kernel.org>, "Yanteng Si"
 <si.yanteng@linux.dev>, "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] docs/zh_CN: update rust/quick-start.rst translation
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <cover.1775619061.git.ben.guo@openatom.club>
 <b5e1246269848fc95d118a722fb11eee88961053.1775619061.git.ben.guo@openatom.club> <DHNQOSMQJV1A.18UJB6VG0QK70@garyguo.net> <46eb585f-4983-4821-9be8-ef57571c3516@openatom.club> <DHNYKCR34P1F.1EZ3D0A8UB8S5@garyguo.net> <d7e81015-f17e-4ab9-a9e5-d2ac6dd82e7b@hust.edu.cn>
In-Reply-To: <d7e81015-f17e-4ab9-a9e5-d2ac6dd82e7b@hust.edu.cn>
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3293:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b6f149-bbbf-41b2-ce2c-08de961f4c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e/hYhD05ph8ZIt0hMGu05OR35+3BMvxI3OyMe4+96W88YqQsOd4GZKR/HN89n8q68vUaTKm6xabbIddP7jdyHo1p5DKu60N0B5Kq77ho1dSnTQFdPwN8ghuDzG0VkjA5RFQATK1YiUkJjs+ntxlh1EhZK8Ffnkc6nguNxMjRyc3iESYVYHD84vQ0RDQq1XiYyn30+uqOo3/+CIf+aJhid9bxRFEucxpA7vMvLe2k2P77n3xTQrfbRSzC/v/Iq4MrBd/6gEv91dH4iCKLoptsoIvZ0KexVQfCAh2X3qYQd68NE2sn+rO4lyU7Ka6SifYEHRR1Prwa13VuJDeASeM9xyp2j3EpjbpZ1RN2CXXstihrvIkYlKOO5HzDJKew9zLezQDZZw28rWa4HrU0CdazW5ziADEkPSLnFBzIy5+yipXJR06/94EJSnd6BtuSJnOdSV+mL5kHtciQ9YXKz7TWsngYljhNfglwXfVDayaKtrfYhhIJfpboua7JUMpPZkrHDRwFIC0Pys2iNF3/XCBYqM7rZj5NYXEjVzvlND5RRWyE0aRqQE4pfaeaymoOBB6RKdRHeYQX4YDWsFD8o7tkryn1CKCSJG2IR745A0AhKTLYgYMktl3h8IIpW+qJ2QS9quc6QNHfb2RW/DXbNz7zf0m4a3p+9drbF3G1hz38pRBg1+rjv0IWtm7Ioq938G6I2kAFJxC8mMtsXklTpshjq1WPQqah+fPvp+V7GoPWGxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1Jnd2hrbXI4dEtHU0Ewak5EMmszanFzY1prMGtqcnBRaXQ0M09IWVIrK2VC?=
 =?utf-8?B?Ly9NUGg0RTQvWEptV1VqSi9uZ0Faa3NKNWZ1MnVjTXhoeTRUcGkrQ09LV0I5?=
 =?utf-8?B?SHRaNHpNMloxY0Z3cG5heGF6S0J4YTVPVlU3QU5OcHA0YXVubEJ6U1ZBU09u?=
 =?utf-8?B?emhWa283SnV1QXpJWUZRd0cwMnNBeGs5c0duVmwvVm1mdFM2Q0h2Ry9sSVA1?=
 =?utf-8?B?aGEvRTlXM0QxTnFsMlc4ZUpBUHNFQm91RGFTY1poQ1FOSHRESVhJTWpuaFFW?=
 =?utf-8?B?a0hpbDVCVE05Q25vNllOTjhuYVVGS3RKalZWU1dIeDZVV0VERE55dnZXQ3RG?=
 =?utf-8?B?ZFo0TVRybzk1cThPTU9STk44dkpzb1RFbjN3WXpOWlBXN25xT0lxcVNGSUZH?=
 =?utf-8?B?dXU5OWpzNno2emJoL2tIR05uNCtMemgxL3E0ZSs2VHVFclkyaW8rUktDaTU4?=
 =?utf-8?B?cHUzTzA3T25URkRYeE1XM0NvTWZ1SXEwMy9JWlRmYWVZYUllZzROOENDQUl1?=
 =?utf-8?B?S0xXYzhqV1RoNGJXZTNmWmRtR3AwdExmRE9sRXRxY0YxWHFPWXY2VjQwV0NT?=
 =?utf-8?B?ck0xaE5VY1BJWWJOd0lLYnNQY216S3BaVTV0ajFmczJiSHQwZCtkMEhBSzFS?=
 =?utf-8?B?aWJST3h1R3o4dzgrL2dnZ1AzZEQrZ3Z6Zlc3dlNFRGhMZHp1MU5Qc1JJVTdQ?=
 =?utf-8?B?ODNTVDExQ0x6WTRQbnp0S0pOTWhyTnZzUlkxdXNJUFFRVjA3UU15L0dLcDh1?=
 =?utf-8?B?YURZVU1vR0xGZk5FWUV3MElwRmp3a0dGUGthblVRZm5CczExbEtOTHNoNjla?=
 =?utf-8?B?OE5aZzlPcmVLTnJoTWZwRUh2blFSODJPZEYwS1BOQ1hRclNvYU5henBpdU9D?=
 =?utf-8?B?dFk3T1N6NkFTOU1OZmx5Ylh3K0xmbjQ2TUxRTjJSa2d1SStuQUg2RERobFZN?=
 =?utf-8?B?TVRBZEF3eGQ5Q2tkak9OMm94bnp3Wk1JVmg1RXV0Rk4wYlFqM2tMdzVxL0lK?=
 =?utf-8?B?NDYrNnBBNVpPNzlJMytFRFd1U2JlQzVsNVhEQVlhdkdneGNyZXRzMG1LbU11?=
 =?utf-8?B?cHNHdWQwbHYzMUwvMlFWUDgxS3RJalhIK2FNU1I0a3hLb2E2TzV6N0l5N1dr?=
 =?utf-8?B?bUh2RUszWGJlcjVEVmJQODZ2RzZtcUNRbDUzeWFpZlFoaXphUVZwRU03VkhU?=
 =?utf-8?B?bldBd25ZN092RGtiamF3R3ZOQVY1WmpMa3Z1QUErVEp4UTRxUUZ4TkdTRDk1?=
 =?utf-8?B?MzNsMXFleDIyaFZyS0hFRFlyUTJBRUJUalBIbm1KZ0NRYmZmUTc5VW80ajMy?=
 =?utf-8?B?Y3JFVTNKTGVQalpXTlkzbTlvM1RwbVZwYU9YbUtQV3YzVnBzVnp2NmpnZnF0?=
 =?utf-8?B?bVJSa2h4cUZ5UTNrU09ITklpS2ROMEFJcmZybEpuSUJEc1dBMGMrUDNGdVly?=
 =?utf-8?B?VFBseFpqOS9pZUd5MHo2MXBORi8zTFlCbGQ5QkhQekh5enFoYXZtVEpNVko4?=
 =?utf-8?B?RW9hOG0wdTFOMVlVRHVpTXNTU1JveEcvSk1oblVYdnNMQzgrWlp5RkFZcFJP?=
 =?utf-8?B?THl3cExsUWdJanBUWjluM2tWQTAxZzRlZHhwSzFGOGdXZm44TXN4QlQzVW9s?=
 =?utf-8?B?ZyttMW1xOTBubGdNcE5XV3N5alJpVXlaL1hIUmcvK1hUZWF3YTFHUWVrVlNI?=
 =?utf-8?B?TDBTSGlYZW1XQmZUNnBOL1J0ZHkzNmt4MHcwY0FTZ09yM05NTUhjY0M1Z2d3?=
 =?utf-8?B?Q016WkZ3K2tOS0tSL0NTbXo0Nnc3VHdoQkpBdndPSnY0UDRXVjM0WS9pM2hF?=
 =?utf-8?B?b0xydnBpbGFmd1l3bmNDVFFoZlRia0NXeGRGR0lQSDRjMTdzdS9ndzk1ZGpV?=
 =?utf-8?B?Nkx0RS9VKzZqMHdMWVVyQ3NBYmNoYnViNDhhVnVTNzlzcmRBVHdnU0MwYjA0?=
 =?utf-8?B?SHNJdERybFRyQVdtUFZCbUMwTzQ5LzM4VzMvdDl6cFQzeloxV0x6bkJDWTNh?=
 =?utf-8?B?USsyV3U5L2puRXFsS2F1Q0tSV2lITS9iWFBLTmNQbG9wa0l3TkxOQ1NBbDVQ?=
 =?utf-8?B?a01WV2hjMjg5akw3SlpkMkFhMzgzN1pJSXVZRi9JQmhNT0RmclZ5d09CMnAv?=
 =?utf-8?B?cXhBK3BLVGl6YmFsS1Jkd2lVUXlmUmExM21wVGZKRXljaVVWUGdlWDVpKzc5?=
 =?utf-8?B?SlFNUWJ4VmlVenRYVmNPY00rM1RCR2F0MmQwOVZtdWRlU0tXUlpqWEpkeGFk?=
 =?utf-8?B?OHZqZThzd3B4dzRTNnhFSHZ4WG84U01MNFU4NlZtdjNxQWNHQmVjaXlPTzBO?=
 =?utf-8?B?WW5yZVM1dmM0czcvN2ZBbU4yVzBGNXdXSmhPcXMyY2VSYkdocUg4UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b6f149-bbbf-41b2-ce2c-08de961f4c2f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 10:03:50.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6pCyqz87+BYGdfu8SndZsQ9e5x8b5942JAU8D8zu+Br75/rmXerF5MWaK8cWS6MBn044jatmEwpAEaU4QZIdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3293

On Thu Apr 9, 2026 at 6:37 AM BST, Dongliang Mu wrote:
>
> On 4/9/26 1:43 AM, Gary Guo wrote:
>> On Wed Apr 8, 2026 at 5:51 PM BST, Ben Guo wrote:
>>> On 4/8/26 7:33 PM, Gary Guo wrote:
>>>> Hi Ben,
>>>>
>>>> Thanks on updating the doc translation. There has been new changes to
>>>> quick-start.rst on rust-next, could you update the translation to base=
 on that
>>>> please?
>>>>
>>>> Thanks,
>>>> Gary
>>> Hi Gary,
>>>   =20
>>>
>>>   =20
>>>   =20
>>>
>>> Thanks for the review. This series is based on the Chinese documentatio=
n
>>> maintainer's tree (alexs/linux.git docs-next), which does not yet have
>>> the latest quick-start.rst changes from the Rust-for-Linux rust-next
>>> tree.
>>>
>>> Would it be better to wait until those changes land in our base tree
>>> and then resend with the updated translation? Or would you prefer a
>>> different approach?
>>>
>>> Thanks,
>>> Ben
>> I don't see the issue of sending translation of the latest quick-start.r=
st even
>> if it's not in your base yet. By the time the changes land upstream, the
>> original quick-start.rst would already be there.
>
> Hi Gary,
>
> Let=E2=80=99s wait for the rust-next changes to land upstream first, then=
 I=E2=80=99ll=20
> ask Ben Guo to sync that commit. Otherwise, the Chinese translation=20
> would do not match the=C2=A0original English doc, which will confuse read=
ers.
>
> We have checktransupdate.py in place for monitoring the updates in=20
> English documents.
>
> Dongliang Mu

Given that you have tools to catch this, I'm also okay with this patch land=
ing
as is, with a follow up translation when the new quick-start.rst lands upst=
ream.

Acked-by: Gary Guo <gary@garyguo.net> # Rust

Thanks,
Gary
