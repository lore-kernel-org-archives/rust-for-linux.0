Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093E23537DE;
	Sat,  4 Apr 2026 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338449; cv=fail; b=J1kvMj/t062Xj48/FbL3Z0C1wcSXr2Ojkeu+BMSajia+BnULQqDDaJt9n5TBF06qeRrq0opBQy7cS5WddRrcapmk3n4vm1+MWDKFjVSi3eDpjf8rXh8QKBqElnyQBHME5+/7WyOFIxS+rx6UbWYH/iuTX/8tV55OraQA3eG9IPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338449; c=relaxed/simple;
	bh=K0QJmzD2DB/eKsUXlkCTcDbd1BwhHr/UUhkoOfZivMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dKObLf2gxW1NuysXVjTcFYy2XjSfpKz3C/lqm3UPV129tEnjaDtBJp+HkqWkOLJQeZctSQ2/Z0kMmXOQ/i8R/AdRr/5HyUJBkW5nQNIqFHCZcvmD8lkXsoVOJ9v2gpIQnKLlCVWUuGu1B2yiOot/rXvpxDGRNhZy+GyVpmB6g7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FKdsPT4A; arc=fail smtp.client-ip=40.93.196.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FKdsPT4A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy5lZtDj4hOzkow9J1itlLHwDo/WUanbdehnSaLGX2Z3Tw45rv2+pEMItfT3enbfr0fcgqwwrm/TqWc7LxbRxuIH/qczjdk4qfNgHurPktdv8n1aryXkaVmj24+NCL2d1kImGCtOFlFT8FbXmunh4HCeTsif0PzzGUprLql9zQG/en65Xo4T3u5emfcfgER86943/mx+R7YepcbhkrgcPii/fH3ztrI1z3A8t8W1Z+pn66GFO62yWwCnqKsH6DnQTF5ktxVtK3BuY1yaUrS+8g4z4JA+nFUVatlKxdTi9OC50Vt6QwnEUIcmIdSU6Wt4He8hoUTG4bQOgr4m1kG+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ysetlp8Kh+4ve7gQfLIgxG2v4Z+/AbqsMTUd61PWinA=;
 b=wEyc/X1ndjqXCQFkwFprVSV20Vs99NlopYYVUva7TLRxygFF/v1tLDYMlahj+G3K5BRQ5COlDokKsr7Ig8XbHs0j1pBIaKo0wb/OdvYoTDjbtPBDr7TIpSaTJ/5829wuoBJndb5kWTjD+7Me8CemZhxAkaeozJvU+fbZ0JsT9tyEZLVKsm7inRDJxdYubtJa0AkrwseYynAfQ6Ym3akHq1BU46v6rV+ydZs9LYp4/VZ2zAFU/yKE7NuoGMyF5j3TdpaInhmPgiPysJrEI8HGJNhTAzG1xoDSn+WprW9t4gp12ni71TbAwbCcl70aoQWL8eKXZmkDrJUJS1DojYN8ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ysetlp8Kh+4ve7gQfLIgxG2v4Z+/AbqsMTUd61PWinA=;
 b=FKdsPT4AMVVrDvWvKRoO8knJv1sK/JTN2I2v3ioV0D20GWOeggqvrONbNmlfsszlXg3rFndZYgPI9BZHUjjCH1D3mXNwNQZ3WZ/lEj7DPOElDfWPH53VYD+76xMOmFLSvDeje6rrHcJejQrUsTDQjQ4i9uqldwj/nzC2QgRwmwCa9i5xrn0GBrqyox0xny3fDfxrUUcxLBHOPZnKzKE1VC86DjHnDGsOs1zxRMT5ojab/q2OC+ZVhRrpyT/WlCQ+CBjDKwNv+CWLR5/Bn/Oo2/cczo7y/xXmfAar9REpJOKJ4zJhov07LcziNIOjH+1t0kAV2OA5nrE7kj738OWdSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Sat, 4 Apr 2026 21:34:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:34:02 +0000
Message-ID: <d6ecac3f-43f9-4830-8523-c91d29fd1416@nvidia.com>
Date: Sat, 4 Apr 2026 14:34:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
To: Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260404025821.386514-1-jhubbard@nvidia.com>
 <CANiq72n=7Gnq6=B+m3VMXMR7f365zkhBq5te34cRHWSAPrd8fg@mail.gmail.com>
 <DHKC3P4FZHOB.1OCA9MC9ETDWG@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHKC3P4FZHOB.1OCA9MC9ETDWG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: a86c7e68-51c1-4960-2a42-08de9291e3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HbV6dBhUAOHeJrv9G+/GsBOXSSPk95qErQTUeCkOInD9zJHgIxvBTmH9znzr/o3DpXXGn20Qv5szgSShQ3jkxTbxilY7B65e4mcZaVT+yZAibDIqkCpsYqlRiUsV+x/o2ufG95pmKbcH+JrqrE5yv6ugp8UxFfXQi+MS4gHa8giXTZo0TE9l1QfHH08Wzw4Z+Q0xyFrWBbyBXFgMzojvGSsZduOtiMIh29ttmaDNFWQaL8DIkqcB94QKlbqGciVr4RzlIF7KRSuWexuE5skaVsce1LPz/XdNW3Ufp3TTyekEL9nWIwBpUNJpn28IBwG44eCHxhyAgRvXaTjuqxSIzRaD3Hu0r0I1PHZFzMI7dk4zKR47VlqaKmNMHgyQQWiiPuZOlATdMamYQWUM455iXED2vE1uYlS9us7kvRcJ7YrfZaoLzx4Ed4L79WuWsRl4rzRpNglZ1W45cfLiYO6/uNojAtgYh6kVYq5zqgXKcWfjZR6ixS6KpDKxfzBrqRKwgSpegc3ete/MNciFyDRdj1SK+3fqhc+Z1uCgHindicICryBaexTkhI9wsypRiaNFAEJ98ATbILEWN5+cfNJlQ6NKtFCxumqmmog8xuhDHqMLAqO1FAxpLm8NKDS2JpKTvV8FLoG3yzNrtn6EzFuKzZbIQPKBoSAVYy2oYMS+WWMrm2His+jN9TXjEh2cNC/s5axqjdW7TKdTb/gXt4DStg89NtXlbaPZ+GVsBrC88pI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVNqT09xbklEaDBueGJ1YTQ3ajZXTXZ5RGplWFFmU29rY21vYStSQ3NkTWM5?=
 =?utf-8?B?SVBxZFVvYmpRQW8zd0NKTUVkSzdWWVd0VmRPUXVaUjkrUGt0c0g1ckdPMEEz?=
 =?utf-8?B?Z0VFSnZldjd0em8yNTlnQURPdzVPZHlhbU9PMjQ1ejNjSjRRMUhrYjlyWE5O?=
 =?utf-8?B?azMyalJaNlVXQi9YeVg3TW52ZFZuUm9YSjhUTitXQUFrSkg2T2x0aDVsZS9s?=
 =?utf-8?B?d1NSWEVseXJqY0pMQ2RUblN4UkRwUXR3TW9yL2M2bzQwTDVXSFNOS3dxVEhm?=
 =?utf-8?B?K1BlV3JNd1BiaDNDeHNBUEtIUklMemgwQmpxNjh6V3V3YytQOXFnV0dudW9R?=
 =?utf-8?B?TGg5aWhpQXZxZnNKaFQwNS9vMloyV1RwMEVzR0o5QWl4OExCNzB6WEV4Q0FI?=
 =?utf-8?B?aFBIdHhmM216WnY1SUxrU3dHeUp2eXA5TUhNM09FRkE2aTZkMXpMeHhjTG1t?=
 =?utf-8?B?Qk9LUXB2NERtMVdnaWZzM2UraThwK01pbjdwdld2Ynl6Z0RJc3FESkYyOWhx?=
 =?utf-8?B?SkJnT1RFK0d6TldsaE1pOWV6aFIrRnhuNzd6ejJBdm1ZclA5OWlVQklTZi9t?=
 =?utf-8?B?akplS3dNSmY0Z3huRTZGSElIUklKeW04VkpVM0xTbno2MFVkNFhwYm5BbzJy?=
 =?utf-8?B?N2tlNTZETk9ZUmJuQ2Z5VDdIakVVRWR4MGNPWVQrc242ZVd6bmRiZHVqYkg2?=
 =?utf-8?B?c1lXODhtV0VaazZTY3lEdHo2T1dJY05KMGpINE8zWS9LcFhWOUkvK01VV2lI?=
 =?utf-8?B?Z082MTlmbC92c0dHVGVyRXRMVzVtTnM4S3JXUkxXQWJLRlg1NGgzOXFGQzZM?=
 =?utf-8?B?VWZBQTJrRzdQMmRaaXFvRmo5elA2UXB3ZmloejBRMzJ6bzBzWkY4UnVRS05n?=
 =?utf-8?B?RE4wOXBtSC9HOHNxc0I5aHJGYWphdStMMEY1YXdWc1BETGpxR0ZKNlc2MFRJ?=
 =?utf-8?B?Vkd5aE0vUHViMFdyM1phdTZDM2poOUlPQXhtOTdrUSsweTF6MWJKaHVVWnMv?=
 =?utf-8?B?UkFPdmsxa0FXbWZqWGRkb2N5YXNJY0hmazZGQXN3aUZsRlI0N1JFM2NwU0ov?=
 =?utf-8?B?aHh6ZDgzVDRKbWJxR0lXSjQyMmYrdzZ4YU9jMGx2cVczS2JZdnc4dXl4aXpM?=
 =?utf-8?B?Tk9VcFdmSG5ZUGIrSDBXVlVDN0hPdUNzLzNpd2hSbGdPdGNSRE9GTWFEODFM?=
 =?utf-8?B?VGRZbHJVbE9Fb0ZoNGtYQ09USWtLNTBHSEZMZ0VlOXZ1N3c3YVhYa2M1ckJL?=
 =?utf-8?B?T0x0MWI5aXNCeFNTR0JBVk5UdWRLblJiNzI1WWhVcWZxK1ZkU0hZU2pGejJp?=
 =?utf-8?B?OGxaQXNCNnNkUWZMenp3clhZK1lWRU9vSEVReVF4R21qTU5tWlo2RGNrdHk2?=
 =?utf-8?B?N3dZVW5PSnBXRWxpeHJUYWFnWHN2ODBtS3lSZGN1cklJK1ZyTjdhc25QUUla?=
 =?utf-8?B?ZXozdzhacXVkV05HZi9vb3ZXYm9sUUFQV0VXRHc2c1dXcGZzMmpscllObEpH?=
 =?utf-8?B?dTlYS3RPNkVsa04xS1VhVFI1VWlRKzgveFNBT3R0alFIL0pua3lrNGJKMCsz?=
 =?utf-8?B?YzZsSTNMUE05dGVIL0gwb0V3cGxhR09tMW84bHVlV0NZYkxMNnlpQkkzMm1l?=
 =?utf-8?B?NW9JOExqRXV6TzhFRU9IRk0zelZvNWhoWENQVzlPRDZ1WUtJZEFYMWY4QXBN?=
 =?utf-8?B?Q1l2ZDRjUXppZVpVSE1pV0VlQmtqRVV3cEVzSTVnb3Y2Y3ozTXA5azcwdnVp?=
 =?utf-8?B?TWdPTk40SzJWSTYxdEtuZFRpVEd0cmtTVzlkS2JhRXZQNWIwemFLQjFqd0ZB?=
 =?utf-8?B?VlVzczlrQ2VSNFVvR3RLdEFHNU02UkRMTGF4dFhlbmNXSURzRy8wQThXOG1n?=
 =?utf-8?B?aTBaZ3QvWG44TmVBWnlabllmbm1BbXpNUmUzMHdXWEFJMDdXNVpYcmVGWFhx?=
 =?utf-8?B?TnBRem80TjJhNDBNK0RtN1dFVmxkTGl1SzlHcVd0YU9qVTVZdXJxYTZSR3hp?=
 =?utf-8?B?YU41QWg2bXRldEF1a1h4M2ZVTndmcE9PYTM0czNsaXpFZVB3RSsvdVJpVDJa?=
 =?utf-8?B?RnJZcnlTbWd6TEhxdHhqWmdQekRxVUUxaWplWVB4c0RINnlUSFo5Sk8zMUdp?=
 =?utf-8?B?S1VNUGRMVnVxeGtpQXFXKzJ3dzAvYW5FRHoybkMvQkVsMklGaTluUlFXb0t4?=
 =?utf-8?B?d1ZDVjArN0pzL3U3QjJYOEZITVovQzQrMGZXdlZncngrRzhpUExhby9GN1cz?=
 =?utf-8?B?TkZHenV1VXZpdmVCN0N4TjUxZ3Aza0J3c1Y1OEExSk44VWd3am5NOFhGN2tK?=
 =?utf-8?B?S2szTVNDeTFnWXVXMzljaW1RTjlDY3hXZnZqUXUwQjBHcWhHclpiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86c7e68-51c1-4960-2a42-08de9291e3fc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:34:02.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssCwoEf95hrUko5zi1L9f4XY2DeFZzCkyQAq9BnXj1+xmQTAN2056dnoVWBnuzhvAqAv3BG0GsE2vyVT83rgiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455

On 4/4/26 4:29 AM, Danilo Krummrich wrote:
> On Sat Apr 4, 2026 at 1:13 PM CEST, Miguel Ojeda wrote:
>> On Sat, Apr 4, 2026 at 4:58 AM John Hubbard <jhubbard@nvidia.com> wrote:
>>>
>>> Clippy warns when shifts and bitwise-OR are mixed without parentheses,
>>> because the relative precedence of << and | is easy to misread. This was
>>> causing 3 warnings in drm-rust-next.
>>>
>>> For read_sysmem_flush_page_ga100(), add explicit parentheses.
>>>
>>> For the PCI ROM header parsing, replace the manual byte-shifting with
>>> u32::from_le_bytes(), which both fixes the warning and is clearer about
>>> the intended byte order.
>>>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> Please see:
>>
>>   https://lore.kernel.org/rust-for-linux/20260401114540.30108-34-ojeda@kernel.org/
>>
>> i.e. the plan was to allow it, since it may be a bit too annoying for
>> some. It was also the reason it was split upstream into a new lint,
>> which is why you only see it in Rust 1.85.0:
>>
>>   The Clippy `precedence` lint was extended in Rust 1.85.0 to include
>>   bitmasking and shift operations [1]. However, because it generated
>>   many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
>>   lint which is not enabled by default [2].
>>
>>   In other words, only Rust 1.85 has a different behavior.
>>
>> Having said that, if people prefer to have the extra parenthesis in
>> that case, then I don't mind to keep it enabled.
> 
> I don't mind having the extra parenthesis, but I think we should disable the
> lint regardless, as I think it is a bit too much.
> 
> I also think we should drop this patch, as it is not worth the churn, if we
> disable the lint.

OK, I sent v2 out before I noticed this, but I agree. :)

thanks,
-- 
John Hubbard

