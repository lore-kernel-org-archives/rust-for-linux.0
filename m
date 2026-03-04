Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021089.outbound.protection.outlook.com [52.101.100.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704A439B945;
	Wed,  4 Mar 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623677; cv=fail; b=ASUU9SzdQVJwsxoSqNeBS8y2VVFtmEIjQs+zAxDFhtQHaV9zeI/vrENa5iTNIUEcp7Dr91euh8wFnA0gUnzx9HsMgRzvrKtxpYfSsl0Jp830P5NOs2d+rWwP5NyLkuTosN7wBlBDUg4YpRk6T4nRBI/HuCqWloJsC4HyLKMfZIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623677; c=relaxed/simple;
	bh=+jyKEdoPWpZP2cd6DL+UdqC3OD1lMdoro+9PX6cDDbA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=SWaA6RyUPmG4DUeNlm01qZoU+UZs7w8+Ly1iPS9/k4VLqXHpmsubQlGGEiznSI6BqVphI/ePWugjkAlc20tUjymfT1AlduDLcIIRRTwS/daVUXhe/LRs3oLsVIzzqP/+teOsg2K9G5FEHj2A7yosadLrgfWw7b1kslfvm2H3Qyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gNQ7hNK9; arc=fail smtp.client-ip=52.101.100.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gNQ7hNK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vc6i8UHMWbGNVxS4taWF6gOd/nbj8lYLrNRbtGOBG/y4vfZO/SNMGqTDgAY5mh5IYLLgQYO7d6uc2SaKxR9VZENGzUH4bGtnvtFwLTiFT5HWMSAgn/olu+9ITd6y8IXTkpKJeuqh7XvJFwcm0qSw/4yuUwTRfsSl6JkCV2W65i98Yk8JBy1t4WOXIh2Y/qAkslUPC2AomDvCpWZGKSo7siodjvnSrvvsjhE3iI1PgsF8bkfxX9S55wbl/i/2LbeJPAccu3KxjeD0lYR/aRu/xQzZ5HY87hWb5eLSCqZ100IFIgd5JqNIilgxxGKNECNxsScmAEEspdqqSA3o9uPqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2+Yl5hQb5zO4lBeZkN5rrmgatfdnZZ3ypUepg6r/fo=;
 b=AV8sFUuyRaph7LWkYeHJUu5HONfn7C4f2o/JRcMp6anqn0bqFde40KB3EmHnUry71LMbLdmkKez4zO33ikYen8oC9H7aG+JxRUN6X9HuKZhW0U3uJMpZEHXcnH7bTGq6+fRBxXMS4mpESs8qnRvnnHEjNyzDatUHSPXTqRmJdd/j+uDhEHndLRypFq7vuDmMGQAhvKY7W/WTPJxmi41/eEI9IorE26slkRI3vtwG8CfClUM5pG4d7T5/+SnoXv5HyyP4w9H9whE/jy5xA1xEmu9246ecwjPkWbALieJUrBZwWcis+VGQBRGD9Ze19MQet0nnAU7J0v5/5AkBslMccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2+Yl5hQb5zO4lBeZkN5rrmgatfdnZZ3ypUepg6r/fo=;
 b=gNQ7hNK9H8S8HB6ifO1UeXCwrs5Mh4tHDUGmzs+3LeiA9ifp0uKo7MsVpAG1Nk1DBJcDO1hnN4vrG6RGUACfU9iFlA/JuPRJz0XlC6rJqhY9aairSU2QQzEx2D5WEEPg6bznR7FJ3JsZP8bRc3mcxuj1M2k3p1pFizI6DgVT2Dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:27:53 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:27:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:27:52 +0000
Message-Id: <DGTYND7P67DL.3NIMJBU5R91LZ@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 3/5] gpu: nova-core: gsp: add reply/no-reply info to
 `CommandToGsp`
X-Mailer: aerc 0.21.0
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-3-a6314b708850@nvidia.com>
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2032:EE_
X-MS-Office365-Filtering-Correlation-Id: 1308535b-a2ec-4f79-5f83-08de79e1133c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	Ul/ytjm8dKvYE2LFexqRh6wa5kn50B2z7Vg/bpNyL7Fnkf4MGeKxdNSfKl+I5wnwsc+ovueGPxsBncrewFpMgyWjHtStlBQbzvsc+bwc6knW4P4MiqZmeZkbU1Y4eN/GnWALlAjVsDyGkx/wiw99NDjAatZ/WINKmddGNBCmeQa+rGlbcyMF6kHNoUiZDVg++3JTwQfaSY+SexYu+bYlUamnM2UynkFgfTmQ3M34mMoqPqJ1epncqQ3A7rBff2MscIW60BSqn9DjjK0FJLj1HAJxEpP+wMjlKwV/9C7Y7wdPoz2lnad98LAfMwFJbpFMrKShwmRc9nU2Xx1rqh/zibS6lV4DAvyMwoS27H/+NGrFmEu9OQT0R9Wu0Ho/B3jPSfRaqLBWCqbScnoydzCjDRCdHfvRMiOgLQM9Wu295Sd3QAmXRd72C8pHGfnUV+eopsFHPgjdm/xopaNbesDzEXU9Ykep9gysMD6Fkv1h1NgLzBbdbGufAfK5hj9vZwEp3o0u8g5HahfXxrbRTGihyRpNvq9g3tnXpOHtNhTFgqkrWfTniICk30nxcApajh0pE75Cn/xRTeHJh6NDTRpkA676SMix1WPtZziaNWpwAHviCcp1zfox37C6sOKBnrRxmmRRUmiCzCCHywaYNTL8LYIWH11YUuK907n7megjgIjG++IGaqFkTxNhK0djKjrkn4M3woHNbAjy/Ub8Yl0stcoAPUQK64pznbCpvF3becg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElid0ZvaXRyUEVyWDJvaE9JSTR5bnZnanI3aG9vcWNONWw3VHBJNGVLRHNm?=
 =?utf-8?B?QUNkeHIzZndZVVBXRVFKdWx4RXhlcXRUZGZIOTY2RkNCMW9tbXlOeWpEUk00?=
 =?utf-8?B?aTBmRGhBQit1QkV2WW1EdC9LaGJLblMvMlNuQlA3bnR0SEtHNGx3SUZvdU9Q?=
 =?utf-8?B?c21CS1VJNzRIcllxTWpYUldBT2xBUlVGRU4zdkYrQ0ZJUjZnSkhsSkRoVWd4?=
 =?utf-8?B?cDdjSTBZaXZtSDU3d1NrZzNqZzNTNnQ0d1NYcGxpMC9ueHhZKzJRcHlhZE15?=
 =?utf-8?B?dVkyVXJseVhDY0xDVDRoYlY2TzlLZ0ZwY3FLT3pSamNPT0N3dmx4a0VRYk56?=
 =?utf-8?B?TlN4UlVkTGx4Z3ovMENXeVZtWjJzVGZ2a2pSUWRna2UwenZEZ3gremFMUnVm?=
 =?utf-8?B?MW1PYUZialB5eHgxa2lJWVJTcXNvcWdSeGEyYmh6NWFhWjVHZlI3bUtOL05R?=
 =?utf-8?B?ZjB6d3B0OXBoMkJHaGVuMkNlblVZNFZYZENpdTVUazBDQU9TMGM0S0RuMER1?=
 =?utf-8?B?KzNxVmxyNFFqQUZFVGtqZFNxcmVkZDVoMFVoR0ROdTN4eFJla3FURkZFTEQ3?=
 =?utf-8?B?NDY0UzZ6aDhPSitFcHJibzh0SmdwTGlydGFVQ0J5cmUzZkJWaFdLcTIrdllP?=
 =?utf-8?B?RTJyalRYc3NBZDdoRnVpS0pDSGpIVlA0R3pQOEptYkQ0NW1abTBWTytOU0Fu?=
 =?utf-8?B?UFZYRExGQi9zNm4rMXp4a2Y5Sm45cEhGa0dEYS9laTBydjFBVmswWXVxLzJs?=
 =?utf-8?B?a2RRaUFpd0lrbVpjKzNVeVVRMmtIMEFhYzFjVVNEMlF0eEIrbTNPNDhLd2pz?=
 =?utf-8?B?TVJieEdiNUlLOEVHYnVjTmo3MHNQT0VwSURhWkNDeDdrdkNSd09TUkdjNGJo?=
 =?utf-8?B?bUR6MmV6RHprY28wMytCMlRGMm1QQSttSE9vM3cxa1RrcGFqeXZ4MUJ4ek1k?=
 =?utf-8?B?SFJzNU1ocTZqanhEYUFLMVJDYkN1aFlCM24vWFYydjJkTUNId2pSdmRrNVpQ?=
 =?utf-8?B?Ri85dE1NMkJXczEvekRCVHk5TmNSSmIzTXhvVDNhZ25Ua0xVL1dzREZKWjhG?=
 =?utf-8?B?OVQvM3J2dU5keXZWaWx6b0V0dGtCTlQzR0JJN3d4SFpPLzRwN1dxS2dqS0h2?=
 =?utf-8?B?RXQ4QjlYbmFSRk9YV1dhK2taTjQralE0L2pxMnZXVHpyNGRqUjVkQ0cxZE5l?=
 =?utf-8?B?SCtrZjhRbTFNUmlLZzlOSW93SWx1aCtXVkFrb2JlMExESFA0M1NXT21IZ0xr?=
 =?utf-8?B?MjVSelNvSmxjaTNUNHIxQ0poZSs2eU41RVlITS95c1JLdHVsOVFFQkdja0dy?=
 =?utf-8?B?ZS8wNVJ5bmFJa1JzbERKQisyTGVZSWRaNGZ3YmNsWjdQSzNmdEpkdG1oWlBV?=
 =?utf-8?B?V1g4Ykk2SXBBY1IrUVc3Z3NMM3luV2liblk1TmlITzJ6V3NIMWFzZVVQOGVK?=
 =?utf-8?B?UE0rbUh5RUx5OFo1N056SnlPVGdJajRUZUNER1ZqL042MXZkclBLYXlqb05l?=
 =?utf-8?B?WS9oVHkzMFQ4R2F6c240UkdCc2lMT2JQR0l6dDNCcVl3dWwybXRPUGxCRDUw?=
 =?utf-8?B?cDRCdnM5UFJIaTg3MFR0R25yQTQ5aktlNTJBaytibGlIa29QdzMrSmhmeVo3?=
 =?utf-8?B?UEpYUjJGWTNsOHVNM1NZTHFDWWV4eEgzS1RqdVFzWWhsYmdMQS9GaU5kRXlG?=
 =?utf-8?B?TERQVnBwRFRvS0FVUFU1Y24zeVhLeENSTzRIOEVkSkN4WDI0Y1NMdTBnSnlG?=
 =?utf-8?B?T2hwK1JqRVEzUFQ1bERvNEJXdDMxRHJEY05TTWd2TnJZUzQ3RThTMVFFQ0Uv?=
 =?utf-8?B?c3hJbFpFeWVXVlVoN3VNdnUrdjdNNlh6c1NDT0xDZU95UXI3VlAyUCsvRXhs?=
 =?utf-8?B?ODZ3anNtR3JIQlJFclRLeVhEb3BIRU0wVVIyQUVlYWltbEt0ZG1lSXhUTk9j?=
 =?utf-8?B?WXU2eWpKUGs4QklJSVZ6VHU1aFUvT3c3OWV6SVpKZDI4WWxjUEU0c1p1bFk5?=
 =?utf-8?B?OUJ2YkdRRDRXczZYa1Y5ZnR2Q1JZQ21rd05vUTJ5aEZxSUxIODhRMWQ0clZL?=
 =?utf-8?B?MjBlSHZINnMxdzJkMW54TTJZTjlVWXdiaDN4aE1OdysyeGxzdnNVZHFIWkVp?=
 =?utf-8?B?bk1KaEF6NmZueng1UEpkNEtNYkJtV01oVWd4SlJrNUV5b09URzNvM2ozcWJs?=
 =?utf-8?B?R0NzZWNxM2Z4M01kSTJqS1RiZnYwK1E3eENjNUFtMWlPMlVLRGlGT0E2ZGJ3?=
 =?utf-8?B?MWwrdC9POWhpK01lOHV5dzc0YmJZd3ozNGluNFJodTZydWZjL1ZPSGRIY2pz?=
 =?utf-8?B?V3d1VG1uMzRrbEFENFQvY0d5bnR5QmZweEtLaFZjTWx5V3FRSTRhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1308535b-a2ec-4f79-5f83-08de79e1133c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:27:53.1297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nFQnprNtul6if+dkkelJDjXEW3nhfBaBBiU4Ea58/KYMfJMj7HaVEH9xE3F1m7ubD621b2an7CTEfhTEVGl6BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2032

On Wed Mar 4, 2026 at 2:46 AM GMT, Eliot Courtney wrote:
> Add type infrastructure to know what reply is expected from each
> `CommandToGsp`. Uses a marker type `NoReply` which does not implement
> `MessageFromGsp` to mark commands which don't expect a response.
>=20
> Update `send_command` to wait for a reply and add `send_command_no_wait`
> which sends a command that has no reply, without blocking.
>=20
> This prepares for adding locking to the queue.
>=20
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  drivers/gpu/nova-core/gsp/boot.rs              |  5 ++-
>  drivers/gpu/nova-core/gsp/cmdq.rs              | 55 ++++++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/gsp/cmdq/continuation.rs |  5 ++-
>  drivers/gpu/nova-core/gsp/commands.rs          | 16 +++-----
>  4 files changed, 67 insertions(+), 14 deletions(-)

