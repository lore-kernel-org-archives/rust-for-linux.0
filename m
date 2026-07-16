Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6D3385B9;
	Thu, 16 Jul 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215435; cv=fail; b=ndG1q+iRc2DO2T8INXMn0ojiomHI23qDxvyINLeFZc+/jwjBAKKDEc3WiXXLX6C0pBmPX+VLwgD56lwSjFt0RnwYy7JbXhc9LTe/QMh5NRJary8ziNdGRXljOtlH8tkRkGc6UYZEIsXFY6rXDaFwLbUAo8vzovhoA+ffEQpfY/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215435; c=relaxed/simple;
	bh=ElX0ovtlsMmQpEGZbL2eevmXwy+n0OY4GwxQUFchUFs=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=lcHk6g43jm0DZtmBNV/+Q9H2hfdTGFWbhZJ8EgGE2/Pupt267xpTo4aQwi9l562Lz+ejlM5W9MpyPFi31BOgWjoJ+V9lAiojbmFbQ0NSvpsEZN3Qhj14dSgZ2HvLcHiKUekwcEJyCDJUGUcL3PAgZxl9UaxB80qDGQMTnA7gHds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=UI2h/GFf; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="UI2h/GFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HF6vgeCcAwVwak/CZC1G8m18yZtJAY1tZlplX9GRsT3xwY38EZx5iRTOHnuNFKx61nCvJVGffD+kCzjGWZtNUePLn093BX7/TF2jfR2kVwHKb6xL6WzHwofMo3jiJaLqAIUpwj6E9JSmK+Scon1Nj/KcND0pGdDOdBuuqcxwWsG84L/OKFttW5McqIxpveqLoHvISX8/pdw2DTMJVTTB62gtxHAHlj2L9LvUutATEn6iWZUKuelFbMMd/vTeEEXERyTj49MVd9gCyvRW2L0uUA9ueaG6dMh6oqMEpbI0i9NuUJmE7pOMs0l50azelgAaqA+g8sVyoyZ5IfTt4foIXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjta1IMoeWuR+Tk3AelrBcb43oQk+2/qwBFW4GV0pK0=;
 b=Tn7t72u36x+trkZBpogVd9pCrsJVs2ilHITwEiWca0gcM2rVY6RGdKTtyuThxGgAIQdCphamu7CMV3XCa22g2UiUfpvfjZ/x0FNy7/raQTFsGoYoqQ95UA5CPXLdn7v6+D7QYfvzEt+ju0d+hq8Sydp5P2rOh0pHHI4QuZxiXPEvBPFAOqHVUWp2NgMPky4s3ZGUxtF6nDrYgr0z5l8GwlaakwSNc10IJ2Q6AM/IG8qIdo7MSlRkYmCrVJzhe4hohGhLHan2q5Lx7Fd/wqGVRVJU3V/mr/+vtlysMxJOPjofkZ7Dd+2C0YqJIk+gQe4W43qcC+RI90of0GzwrzsAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjta1IMoeWuR+Tk3AelrBcb43oQk+2/qwBFW4GV0pK0=;
 b=UI2h/GFfWGjRvYr/peuvAhKLIAnxYZSJLQZ4BuPefWncIZ80lfQgE3d32go6BOzgtATVcmXdOeJK8NFk1fJhr+B8mNzY3ZFFnWjFrpYd6oW3uymZGIspUbeqDZetARXhGfXhjMsswZPW8EXNc7xo7VuMkU9KD1lBSyOExC6ihYM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8325.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:466::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 15:23:47 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:23:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 16:23:46 +0100
Message-Id: <DK03KZBE5E3T.3VQJY9DIBYON7@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, "Srinivas Kandagatla"
 <srini@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Orson Zhai" <orsonzhai@gmail.com>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "Chunyan Zhang"
 <zhang.lyra@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Kalyani Akula"
 <kalyani.akula@amd.com>, "Michal Simek" <michal.simek@amd.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Johan Hovold"
 <johan@kernel.org>, "Ronald Claveau" <linux-kernel-dev@aliel.fr>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <imx@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] nvmem: fix a const-unsoundness in reg_write
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
In-Reply-To: <20260716142415.28718-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: LO4P123CA0647.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 1764aef4-e3ca-43ee-5c86-08dee34e3af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|5023799004|56012099006|6133799003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	n9p6E+IQ5Ec24YRxYYSTdUZ2t1WbiFfsOeKKBN6ok7WaTx+SaoK4AJZaAkH8gf+qACSFJZQgDPvhtEaGSiloOEfkdnkQlOtgdS5fKtRUn49/FAWfGa94naofpPnhDC7mjfvZKXLBMjYy9zNR5nbO5+RY/CCHRzyYOC8GuN86nRmVAHunE/+KO3/gEIAvcMJ1c2BobPL7Rzp/cEBVvjHGnL4rp5H+xcnkxBSq4qAoQawbwQkOXPxray83/IEinGouxslBP0VYuPqwjMYSRt5BpGcSTi6Shv5ltb21cPyhjvEhGRRAxriu6WAzyJs00jaBGEEJoWXmp4i3SeBk4gzFlFvptNN2ZH+GBrUxQDmh6wEVerjdnnX2etOTCZAhW6cylCn0OhfiTRa9RhP6yG6HlYQXvZyg5WPWcCA2Z0lXWD5GAchykEsDg0YC6HwYogv3iZg48VylJxqtMeCHAZDjEv2heqlM914SfpxhlC3nlYY6l86wOgg4x82q0Q2ovFrgP8IDt7ktTior/NQ9U2Tpy/3gtQ2CxNlAHqc8HrF7O5e3AOTgce7ALe03u3Aw6iBYESazteXiXvNpH9yP+sHqto1rVSdkpwHNovspR6/WxMlhXaofG8PAF0jL04rQ0LPfLaWbe+P4rvTYsHHg/Rm3ne8gvRkbsVCa2oH7T7lfF9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(5023799004)(56012099006)(6133799003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVNWbS9PQ2tTVDVLMDBZQXphUEVZRk94anlDMjhjVm4yblJGbnNFK0F0blQy?=
 =?utf-8?B?a0tXQ1VlSzhWTm5DS2tQM3BOWGlPNDVpVTBZVHZXWi9vL1MvMThWWnB1V2dx?=
 =?utf-8?B?NmE3TW84RG93VXpYd1pmQUxtQkE3L09DUXUyT1UwSlk2R3BweVdiQitSTDlS?=
 =?utf-8?B?Q29CQXFURGdKamYya1JpZXRydVZaeUUvV1ZRbjliNlB4d2R1aS9XeDNlUW03?=
 =?utf-8?B?NjBhMjVFcHJEeVZnMU95U0wxQnBZUG9RTks4eHpHYlltdHZzU2dWTlBoNmlX?=
 =?utf-8?B?MlU4WE9abnJLQmlUclJsZ3lvVjFxTHFyU3puTVNYVFFTQThscis5MmZoek9l?=
 =?utf-8?B?blFxVmF1bUd4UGRlUXhrcHJ1cnlUVnRNTmg3QitsQkgzVWRRdHlWT3VlWkdm?=
 =?utf-8?B?QlFDaHFMUmcvR3Y3QVBPVjlhYnQ2Ui9xMWlzaE1pUXdHVmpsTW9BMVdJMDd1?=
 =?utf-8?B?RmJGNnE4b2VYT2EwZzIvc1VSb29QSnc2elE4a3hLaFFKNnRjVWhDUSswdU5V?=
 =?utf-8?B?UVZkd2QwWHB6dS9YempibXdoQ00wNkpUQVZwZmFXa2dYTVJDQzdKdENKNHFj?=
 =?utf-8?B?azlhTHh3dlNjS1lxTkR2b3RMUjczTGE4ZVRCY2lxVFhiNEdaa29tZmc5TkJx?=
 =?utf-8?B?MGZnNTJUWjJFcjRPVTNHNklUUWJ4NSt1WmhsTGRCelREQmJrZmdPUS9URDEr?=
 =?utf-8?B?QVAzS1JVZkNYQXBlMTJjUytXZGh0Q1V2QnlqZUgyRkgyVFFsb3dEdXNyNStl?=
 =?utf-8?B?YU1zRDFaY1JBeUJwNy95L0gyajFWa2tPQ0NzRnRvTUpId1FZMHl4dXdEbXRn?=
 =?utf-8?B?ajBPRURkbGk1ajVDNzRteityV1JYalNjam9mUlc1WnZWdWFoU1EreFdIY3dL?=
 =?utf-8?B?WHdqNmNsUi9WYVVNYXVqR1VuTmRURXFWRGpYdExYL2hqZ0hrOUFJOS91cHZH?=
 =?utf-8?B?aU05Q0FSSnRUT3VZUjRMMnBIL0NCVGRTaFQzaHNGRHF4dnF4QzhYclJJNEZi?=
 =?utf-8?B?VHFWZExWZkZpZEZWODNDcC9WUjk4b3dFYmNNUEwvcjRzTGdJWFJoOWFva2w3?=
 =?utf-8?B?Q1czZkJMR04rSlRHbDI5TU51Q1ZOVCtKb3lKWXNWOGxIL2RCY3hWbGZGUU9s?=
 =?utf-8?B?MGkrUnA4dDN2R1U4MVAxVzVEaXQzMGhyUEEyVUNYTlorYjd0UjZMcSs0MHFp?=
 =?utf-8?B?U21NR2tpbW52TWcvbEo2MHF2Z2xRbTFIS2JBWTZFOWxaUzZwVmxkWXhkdDc5?=
 =?utf-8?B?cXZETDhING1ZY0NNTk1rVU5jdnR3dmFqSDJ3eUViS1d1SmZlQlREWnVRQkdC?=
 =?utf-8?B?SEpDc3NZRkl1OHRWeno0eUN2WlBhWFNRazhjb3JKYnBXUmlodTEvMWFZVGxW?=
 =?utf-8?B?QkpvT1kxbkNjY2FkTG1KSnowVEUwTE44ekpLdlNZWUd0RkRmOHZhZ1ZJbGFR?=
 =?utf-8?B?K09JYmFKU3FVVG5JdnhUaUdKZURuZjI2c0dYUS9xNnhZbzlsSXJXWWMrMjJ2?=
 =?utf-8?B?QUVRblJFTTJLWm9JUmVaSUlXYTUwVG56bFF6QVhqN0lCSHM5UFJ4Zkwxdm5I?=
 =?utf-8?B?VElDS1NZZUgzMzBLcDZ0VDZyc3Q1YzR0WXV1N2tlVXN3REtqTGpxbUhhbWtM?=
 =?utf-8?B?Q3g1Z0dtMlMrQktLVStCb29hMDlWUnhLOXRhTnU5SXJ6T3ZZZWtjeGgrVzVI?=
 =?utf-8?B?SW9yTDd4WUpkSzh1YzNvaFJxTHRmL3BxTno2WG1wU3VBRkpJOGdNV0lrQXB4?=
 =?utf-8?B?ajhpRWFxM2MxSGpXOTN0Nld4aWpoYjZ1ME9FaitIbS8zeE5BR2dvQ3VKQ3hw?=
 =?utf-8?B?dGJhemk1Z0R5Z3pCVk1NMjVIVFpJdCtQMktlZ2lITnlGZURhMWc1eDEyckZN?=
 =?utf-8?B?R1A1U2JTUU1OK0pRa2hQeFNzdTJSekZIc3p4YzRkUks0YXdyQktUelJjTSs3?=
 =?utf-8?B?eFpRaE9YZWlma3Rac2x5L25Ldm1tN2oycVIwbTFkL2gyUzdjWUtoOGdrc2Nm?=
 =?utf-8?B?aStMaE1zK3VLYnUzUU43cFhsd1ZyN1hydXRjazdjY3hMeW5GOW9Db3cvNjlD?=
 =?utf-8?B?TDZWQVlRanZKd1N6a3I4WTRjYlc0cVgwQkZpOW5NSXh5STV2M0Y3c2puV0Mv?=
 =?utf-8?B?ajI5cXZEZ2lSREY3QVBZcW9zUGRnS25NeWNUL0ttZW9SRGZtKzBodS9WN2Zm?=
 =?utf-8?B?TTJQeFlEblJ2TWxJRGZPTFhlREdMS21EV090ejZkdDdlaU9nM2dMaGZSOFdY?=
 =?utf-8?B?Vk9sZFJ1SzE0UHZGN2haZnEwTzdjbVk2SDloS2RDMW81UTVvbVArdmJFMWlH?=
 =?utf-8?B?QXBCeFZWOXArbTB2VytVL2cwN0wrcEFjaDJqTnpDbzFaUnhCeEwyUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1764aef4-e3ca-43ee-5c86-08dee34e3af1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:23:47.0178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 345MzfAWA8p8zb/1ZFejTJFcYJiUP4HsDAYwK3bX3MopVX3NQuFyGBlZf6BdR7sFub/du2/gw1nEgU0mrLqZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8325

On Thu Jul 16, 2026 at 3:24 PM BST, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
>
> This was found while drafting the nvmem-provider Rust abstraction.
>
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

I wouldn't call the series "const-unsoundness fix". There's nothing wrong (=
in
the sense of UB) in using "void *" for constant data as long as it is not
actually mutated. Yes, it's better to use "const void *", but just call it
"migrate to const void * in reg_write" or something similar.

Best,
Gary

>
> Changes since v2:
> - Link to v2:
>   https://lore.kernel.org/rust-for-linux/aljAqBNVXV1aVJqx@luna/T/
> - Rebase on top of linux-next/master.
> - Fix logic error which made all devices read-only.
> - Remove a blanket cast of function pointers to void * in
>   apple-spmi-nvmem (patch 3).
> - Also fix constness of write buffer in firmware: meson, which is used
>   exclusively by meson-efuse (patch 4).
> - Re-review all changes to make sure the passed types are more correct
>   than they were before.
> - Actually test with COMPILE_TEST, which I forgot to enable before=E2=80=
=A6
>
> Changes since v1:
> - Link to v1:
>   https://lore.kernel.org/rust-for-linux/20260715175229.24672-1-linkmauve=
@linkmauve.fr/
> - Removed all changes to other subsystems than nvmem.
> - Added a new reg_write_const callback instead of changing the exisitng
>   reg_write.
> - Deprecated the existing reg_write callback, it will get removed once
>   all users in the kernel will be done migrating to the new one.
>
> Link Mauve (4):
>   nvmem: core: deprecate reg_write callback and add reg_write_const
>   nvmem: make all reg_write callbacks take const void *
>   nvmem: apple-spmi: improve calling safety with wrapper functions
>   firmware: meson: pass a const buffer to meson_sm_call_write()
>
>  drivers/firmware/meson/meson_sm.c       |  2 +-
>  drivers/nvmem/apple-spmi-nvmem.c        | 18 ++++++++++++++--
>  drivers/nvmem/bcm-ocotp.c               |  8 +++----
>  drivers/nvmem/core.c                    | 28 ++++++++++++++-----------
>  drivers/nvmem/imx-ocotp-scu.c           |  6 +++---
>  drivers/nvmem/imx-ocotp.c               |  6 +++---
>  drivers/nvmem/internals.h               |  1 +
>  drivers/nvmem/lan9662-otpc.c            |  6 +++---
>  drivers/nvmem/lpc18xx_eeprom.c          |  6 +++---
>  drivers/nvmem/max77759-nvmem.c          |  4 ++--
>  drivers/nvmem/meson-efuse.c             |  8 +++----
>  drivers/nvmem/qcom-spmi-sdam.c          |  6 +++---
>  drivers/nvmem/qfprom.c                  |  6 +++---
>  drivers/nvmem/rave-sp-eeprom.c          |  6 +++---
>  drivers/nvmem/snvs_lpgpr.c              |  4 ++--
>  drivers/nvmem/sprd-efuse.c              |  6 +++---
>  drivers/nvmem/stm32-bsec-optee-ta.c     |  2 +-
>  drivers/nvmem/stm32-bsec-optee-ta.h     |  4 ++--
>  drivers/nvmem/stm32-romem.c             | 10 ++++-----
>  drivers/nvmem/zynqmp_nvmem.c            |  6 +++---
>  include/linux/firmware/meson/meson_sm.h |  2 +-
>  include/linux/nvmem-provider.h          |  6 +++++-
>  22 files changed, 87 insertions(+), 64 deletions(-)
>
>
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1


