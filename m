Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFD368944;
	Tue, 10 Mar 2026 08:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130609; cv=fail; b=Zx3yEpmbxBl8HwhXHTTVRwMxtvvyPIIQ9tZ60frYF6ects+eghWZffgHgr3CY/S1bbofg46u3AvixxU1pohU+yog2smHWtO+DqLxGGBnzQnn8suJi+hbgUm2bvmrtJ1uaIZN67hAanL9EG3rwhzJtugykB7DRdk5I9VQb3qRjGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130609; c=relaxed/simple;
	bh=1f3eryq6WyWxjqs6giHE/LvSYhwlYfdKtF6doxuzAjc=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CF81HoVel6quO8Y66D1cZms20kjNijT6Fo+JUohqdtx4KfOcg/TRiT5hnslQiPw1LAxvsh7WogzoHNtT5dOd0/cOLd/RkjAB1tARv73JSOtvGuBLhJbbaspYp0lAbE5KOSvOdNcZhfN9+UcMGwTbAmZJDXGKU2rNajmNKGp9GSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=clDDm2md; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="clDDm2md"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iitKx2U23etdaLaUB3XmdZ3KM3zyp48I0jviIr0ZbtUwdyNLa7MAsC7h0Nw5d6mZRhzzGnTuYXZcJNIH4UjHlrp2P1i2Zq4G717TqQxvb/vfShdXhKKCMhE1RYrDyvF7XUOhpMsT7qAWQ4krKHvxrfi9K2ebodDLWVanmOCL/OgSRxK2XsN3HmjQ7kmtvpfVovj4L4rc8WE2oKKopoclday5H2J5PIH26BLbP+tV2o9hOy67w0CO62ksvR701T80dnjmitnALYsrW87yXJAlZzVMIFTIc6wMfef1NS+dvpmFyUkDz6FlKg+60fDlE33XaL/h7KPgwQSo9FLAeAb21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IghUiem3jgD8yx97+Md56FCmzFhe8Y1fhOUwkkMYJYE=;
 b=LTq6W3WYaKpr3/68T3cDhh36aGsSTVAWOEo9juQuNCa0ikZK2tiSdDEKxDQNl98pnx/ZYJR4+Fd2+8+3oBGvHUo0AuHDrwr9x4PMHcSFpfFXfZxLRr1BWTss0+Dd+o5TSY/pNFbyFoXioIOsqp0zeXVLyu8XcgsrkdkNGaUy4hTAN0XndsuhYL5KVxyNJeaPpMT2tLh0e2B3d1i63XnsBGFOW0ZL2CXT6QEqzXlxFGWsuntIXI9SCb/gY879+/le9biJ8v3NafHzdqdAA1gtk+EmI/J4+DFa8BngApCbKK3ib+vSUIfqJkDdmZ1wjY1gt8ZC3vYnbKAg95rv05/xWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IghUiem3jgD8yx97+Md56FCmzFhe8Y1fhOUwkkMYJYE=;
 b=clDDm2mdvQajhbd/KH/KkuTvQ1ZxHbPlgMbFD7HGc+eKHhOaf5Nu1TfyhCib+CD5ed2nNMNv+KqJZJIRjicwIdoOevvtb5o/YxR/hGQMVttuKGOM9UMLYv9QFodjC8sTgRmJBXOwkaHChlMWtTkQUpm1U01r/lU3rjXrRRX3uYWhl+IlRVlj/UlljaN/TFZEI7S1zXtK2dBVbNYDHWW0io/MegJdO3DHOOENAg2oktkcqGLN3SxW6EYi6tMPWnaIJtakSfN/DIikSz/FkvCH+Mkhb8j6kfS5Ev+qZ0dg7ZiEPl3iqae9vQ15FZ5xH2HzkK5JrzpD5Lwtc8DmBxXJmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:16:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:16:43 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v4 0/5] gpu: nova-core: gsp: add locking to Cmdq
Date: Tue, 10 Mar 2026 17:09:14 +0900
Message-Id: <20260310-cmdq-locking-v4-0-4e5c4753c408@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PW27DIBREt2LxXSrehqiquo+qHxguCWqNG+OgV
 pH3XoKlNH18zpXOuTNnlGGOkNGuO6MZSsxxSjWIuw65g017wNHXjBhhijAmsRv9Eb9N7jWmPfa
 cGaYtc8wFVJH3GUL8aLrnly3PcDxV67Id0WAzYDeNY1zqFytMAMaBy34QWgsJnAYwrjo1YY5II
 TU1+qIeIWfb6uy6h9aGE7G1cVNaYjrZpXbHRWKCeaDG99KAN/wpleijva9PH9Gl1CHmZZo/2+R
 CW6v/1xVaVcMQ1CCoVD1RN6pmKuyWVr9oVmnXA1VWeam1/EPzb/q65UrzSlvFqRh6UmHyg17X9
 QtBiv88ugEAAA==
X-Change-ID: 20260225-cmdq-locking-d32928a2c2cf
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::6) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dac6596-350e-4b5b-dd45-08de7e7d5c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	2HAEP5kq9BRCRxesMO4uWfhfkwodUOkWnOKZ9SZ3Tk+btw1Q6tepFV4GsJJSY6TQ+eIIeNaW/S1IzQHoq7Ysz5xqCQgzwcq+kkVp4VjL4hxJRy9FWlgPtLyNyPmQAyab+vgBsUN/kXnYCb4z+SgT6MIj/OBUnYLnf0LgXtyuPQj4fHKa9lv7aP83MqozR5zgfAKfeuBk90mDZmSd3TUkXMPtgdNS1o0wIG3W+5+33AqTaJsDhSzm9MtrEopH97GmOqm72OYbTAg/uAqzO48VO9OlGTCZKVQUm58VtwbpB8fTlVH0gzb7mwEof7nfEQlmytXpYP/KMZB0SXCiEBgprHTgEp3xy7T3kPqHyns4eip2manp5E9F/H92WzJanCWqnSDnv6RVU051wjmAWB7vznOxwEMTKk1Dl7sGG+PuH2KcM9rpQ8Jpe7rZTX7yaGzb1gnQY6p2Q4qUJfJPOM+6jGlQdTVafcFpevqCjBThHf2Zpx8BqrAwejT3QMmd6AnKzswq8rqdled7KRzi1Cv3BCMeCFPE9BuUpmONjW23h+Fmopf1REorNoRx23qUj3s3NDwzbOuuVZIejYMvqdXDrboUNCxpecZZ4UUOAuF+O10QQPNkiVFPV2ENasWu4GL3HA0VXsY1hE81MjXYmCuGUXgkW/ize9D3GuhQv9euq6JF8wss4rGHjPy4Ey3q/C352difeHtO2/pM0Ch34fyAlI4P/iRRTgft9Icmuuz317o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNsYVZKbW5rUVdkWW9raFR3RVplM2RuMDZPVUI3Sjd3a0pSUGJ0L0ZMYTMz?=
 =?utf-8?B?Ulk5V0tKR1dHYVQrZHA5NFY1WFlGUmIvc2c2L0lGcEl2VDJLMVQ3VlRaSWxH?=
 =?utf-8?B?dy9EeE82TkkwZ3E3ZVc1Y0dRbXRlMno5S1VSem1xQmlqN3lCWWt5cFRLbWRq?=
 =?utf-8?B?aEVKOUJwbVB4R2pnSWszY2Y5T3kvaGZTRytNb08xODZyd3BHYVRGL1QvN3FZ?=
 =?utf-8?B?UFM3YU03VzJtR0R3aHNGd2RPblBrNFJ0alV4UXFLVnhHSXpOUllRUG9vWVZ2?=
 =?utf-8?B?S21oTDZXcFRTcVdmcTlZblp5ek1vQzc4MSsxS2ZBZkptZGZxNUk5eHRsUmcw?=
 =?utf-8?B?dmJOcXpla3NBQXRmdDdGTjU3SjBlbzRBNHllY3FlQ0x0STl2b2c2Qi9Ib3A3?=
 =?utf-8?B?NTQrWU5WVjJRa1ZJOHR1RG9EbVJiM2pTcDAybnJsSjh6UVJRRm84NGRSVEh6?=
 =?utf-8?B?MjB6ZFIxY1hYYzU3SCszVllQYWJzUmdEMURySTBtRmF3UEpJYlNsUWVZT01Q?=
 =?utf-8?B?eHFMR1IyeFh1Ym83Wk1pdnZiRTlZUE1Hd0crNmVMdHhESm9uY3R2N2JXdkU5?=
 =?utf-8?B?eHlPVVZKTmV1Q29wZktXbEtwMlVuVkk3ZVFxYVV5ckpjRHNPbWZvUWsyNTMx?=
 =?utf-8?B?Rk5oWTdFc0VndjFRUnZHV3NpTE5oNUtyei9zdGJ5Z3BFdGNnb3BQcERvaE9H?=
 =?utf-8?B?b0xVQTlBYmxlTTcvWWFvendSMGZMSDcxVUppQmZiSU4rWGZmSGhsSU1ybzRR?=
 =?utf-8?B?TXVtamxhUmQ3MmVSMFF5dXpuUjhEYjlpY1I3YzV0REZ0TlJ6eDNkVTFUV2Zx?=
 =?utf-8?B?dW9oWmhmQ1JZUHJqVEEzL3lMOW1BRU9xVm1DS285MUYrTkFNVlcydWNIK1Z5?=
 =?utf-8?B?eUFtV05qTndQS0U3YnZPWWtyQzAxdEk4eWlyT1FGUFcwMjNBaWFDL095ZG04?=
 =?utf-8?B?YWcvUEtiN2JxVkZNSytxUjIzSWMxTHdRVElFWXYvcitVN2VGSXB0OEVSclZn?=
 =?utf-8?B?QnJsVTZSY1Q3cUtjQ0VPSTVqK09KOElzU0pkY2lsVkM1QkNjSThKWUpzMk9i?=
 =?utf-8?B?ay9sWkk5c1pVNmNpaVkzL2RtT1hLV3N0OUttU3VkRVZ1RXZFRDNPL0FyalU4?=
 =?utf-8?B?THBFSFBtT0Npbm12Y0Z2N1pTQWxrL0NQM2tGUHIwOUViMEZOMS9tTmVzZVBm?=
 =?utf-8?B?bUxjRUVrdE5PeVFjMExnd1BRMHovN3QybFBGODRhenk1bTlaRFlna0pMMnMz?=
 =?utf-8?B?TElKdmx5cWZMWEd1bXpHQ2phcWxIUXJPNlNhSXlNL3VPeWlkeEIxY3dUekRV?=
 =?utf-8?B?c3d1OFp6RDdnM2tZVUdpb0wrUFpPZlhvYjBqMldyQjBBdnVQcVk0S0FpMWw3?=
 =?utf-8?B?RUdLM2QvdDZCdVprWGZMVkhMMkUvdVFIZ2FzbFA5dDVjM2crNmZ3Y0NKekNw?=
 =?utf-8?B?MU0wSmQxTTVuQU5NS25ZcFBnM1hhRkJuckdEQlFma25jTXpuVi9XQVZJZ1BM?=
 =?utf-8?B?QnpVa216TkswVHJqbG1vc1pVZ3M1bW4yQnZueENlWXFDWm9nSGhMTG9US1NF?=
 =?utf-8?B?eTRYT25FR3Nhc1dHZ2VtSkY2VnZ6MlA5Wlh0UDhwYjNkWSt2OXBkTzNFNkNX?=
 =?utf-8?B?akRsRXNFOE54R3NQd084L0ZMdlBZRTltUGxOWmdxQWdBZVZoMXFiRWxxOXAx?=
 =?utf-8?B?aUxNNXRMR3R2MXM1RkFyS0NYN0M5Z3NWeC9ydUlOa1h4VnhyM3M4M0daM1gw?=
 =?utf-8?B?b2g0UHZjSGc5RTJYTnRLL1lYbk1lYktXcEtPakdMRm5tVDJ1eGZxRlhpTnJF?=
 =?utf-8?B?SnpYU1dhZkFTRUhEaWM1T2tvcGllOVAyTGZXVlZlMUVYMS9pNkk3MDYzWnlW?=
 =?utf-8?B?V0pPdVY4Yi8wd2hRZGorUk5tZGcxcnRvYTgxSlNVRUd1aWUvY2Z3WTd0TGdl?=
 =?utf-8?B?WmkvWFFGY2ZJdmMrOHh1RzFPUjFsTmFrMkdUb3NuRGw3ZmFteW5IdUFXcmEr?=
 =?utf-8?B?ZUxHMXB4cDY5MFFDMVpKaDFrMmxZYTZGdTNKUWFJUjB0TVl6V2pBN1RIVlJY?=
 =?utf-8?B?N1hITG5pVlhFNTUxK0RKMHBKQnV5TFRXZEthR0l0K1FSMzNON0hCdG1ZT1BK?=
 =?utf-8?B?c3lUVjBNU1ZsanVva2cxcXRHTGIzYnhiVGZjdlcrK1ZqVUlDdDBVZHd2WWRL?=
 =?utf-8?B?TFhCK1BmeHZBUXZ6NHA4ZEpoMWVYTktzTGhlVDZSSlRpbzJnTkZHK0NPSDFX?=
 =?utf-8?B?US9NdU43VGFTUElXQXBjQnBDbHdpcEh3U1hLWVFPc0h3S0VCUm8wUmVKN2pD?=
 =?utf-8?B?OWpncFhyeC9MWXMzNldBSHNYZWh6aG5ZTSszZWJ2NHppSUR6M2g5VmRpek1t?=
 =?utf-8?Q?k7NjSwlxEwpHvjXRArBP5HZldI0aGo851qPIq5T7xS9qY?=
X-MS-Exchange-AntiSpam-MessageData-1: m4d1xNVz7X09tg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dac6596-350e-4b5b-dd45-08de7e7d5c4c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:16:43.1560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1saTjGeYcs6BcYKqecI6qaWL3yByutQrFnPDi/6V3xeBKHUsrdP8pHQyaRNlkjJiasuFGPtS3hVHftlcE8vNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614

Add locking to Cmdq. This is required e.g. for unloading the driver,
which needs to send the UnloadingGuestDriver via the command queue
on unbind which may be on a different thread.

We have commands that need a reply and commands that don't. For
commands with a reply we want to make sure that they don't get
the reply of a different command back. The approach this patch series
takes is by making those commands block until they get a response. For
now this should be ok, and we expect GSP to be fast anyway.

To do this, we need to know which commands expect a reply and which
don't. John's existing series[1] adds IS_ASYNC which solves part of the
problem, but we need to know a bit more. So instead, add an
associated type called Reply which tells us what the reply is.

An alternative would be to define traits inheriting CommandToGsp, e.g.
CommandWithReply and CommandWithoutReply, instead of using the
associated type. I implemented the associated type version because it
feels more compositional rather than inherity so seemed a bit better
to me. But both of these approaches work and are fine, IMO.

In summary, this patch series has three steps:
1. Add the type infrastructure to know what replies are expected for a
   command and update each caller to explicitly wait for the reply or
   not.
2. Make Cmdq pinned so we can use Mutex
3. Add a Mutex to protect Cmdq by moving the relevant state to an
   inner struct.

[1]: https://lore.kernel.org/all/20260211000451.192109-1-jhubbard@nvidia.com/

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v4:
- Change RECEIVE_TIMEOUT from 10s to 5s
- Update NoReply doc comment
- Move CommandToGsp doc comment update
- Fix import formatting in continuation.rs
- Move CmdqInner after Cmdq to reduce diff size
- Link to v3: https://lore.kernel.org/r/20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com

Changes in v3:
- Rename send_sync_command/send_async_command to
  send_command/send_command_no_wait.
- Move `dev` field into `CmdqInner` to avoid passing it through method
  parameters.
- Add `RECEIVE_TIMEOUT` constant for the 10s receive timeout.
- Link to v2: https://lore.kernel.org/r/20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com

Changes in v2:
- Rebase on drm-rust-next
- Link to v1: https://lore.kernel.org/r/20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com

---
Eliot Courtney (5):
      gpu: nova-core: gsp: fix stale doc comments on command queue methods
      gpu: nova-core: gsp: add `RECEIVE_TIMEOUT` constant for command queue
      gpu: nova-core: gsp: add reply/no-reply info to `CommandToGsp`
      gpu: nova-core: gsp: make `Cmdq` a pinned type
      gpu: nova-core: gsp: add mutex locking to Cmdq

 drivers/gpu/nova-core/gsp.rs                   |   5 +-
 drivers/gpu/nova-core/gsp/boot.rs              |  13 +-
 drivers/gpu/nova-core/gsp/cmdq.rs              | 157 +++++++++++++++++++------
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs |   8 +-
 drivers/gpu/nova-core/gsp/commands.rs          |  23 ++--
 drivers/gpu/nova-core/gsp/sequencer.rs         |   4 +-
 6 files changed, 149 insertions(+), 61 deletions(-)
---
base-commit: 4a49fe23e357b48845e31fe9c28a802c05458198
change-id: 20260225-cmdq-locking-d32928a2c2cf
prerequisite-message-id: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
prerequisite-patch-id: fd45bc5b8eda5e2b54a052dddb1a1c363107f0a7
prerequisite-patch-id: 06fe65f900206c44b5ba52286ca4ce1ca42b55d5
prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
prerequisite-patch-id: dccf2b12b176947e89b44baafda9c5a0aa0a93bc
prerequisite-patch-id: 30ed64c398e541d6efbcb2e46ed9a9e6cf953f4f
prerequisite-patch-id: ba1c8da0cbdb4682b879633a94a172d1b2b6bc8e
prerequisite-patch-id: 081d4a4198a0bf09f3480cb8baf296db585decce
prerequisite-patch-id: 56c8c25e7362178cd019c8f03954a6bcdb72b1b5

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

