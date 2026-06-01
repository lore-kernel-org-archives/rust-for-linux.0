Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF43AFB07;
	Mon,  1 Jun 2026 14:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322871; cv=fail; b=hYQvrShyR5tYWZ+73s34rj8y7+c7ZMjQp9wSYC52TFOHT++UAugAfinyJ/DRbm7whuNmX1xlc4BGKe8bDEX28I2rE0rUFKJTp+IFr0mlSq2EHWengrE72wLb4IBSh7TRW7srTmXJAmOWgrM0FciYynwBVXd0HGQ+ePW3oRZFnX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322871; c=relaxed/simple;
	bh=uSzM1lfs0zt6oAz19VhncFxd4T18y9oB1CcrFKfDnKU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gXzMXDTCWD35jv2coFy+cbEDm2eM2ED+3Z9eYj/uZzzKLvP/lAeKzRuWhE6p27Z0VC1Tu5Gn2unbVDsVE1u/btTiSHEyxVZphHmDZaxH2hoQNbGwTDkgGuvtVFNTEC+PzAnI/NQpba1nkkQwLZQF7nzU/iwSIj2ysuczSnRJPNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E6XxHSe6; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E6XxHSe6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDaJwoa3lsSZxScHgQuB4zaCbV5TuDYvNeayIWVzwBO6B9M4ZrB5QNSNI8kKsySesU7g2Eaq1lnXg2CB4LWNIfjbS/Ecyw3oF7ka33lojhNxBVP95EDvouXVKpP6FFltoR+0L3xmfwMaxY8hIrbfPAnN5DVredGaK4VQ7vcAm7MlBWREvL8fYW97g4GN5nZg5nL1G/aPC6UXdnDSmxNUtNQeGTmguKEnQATnjRmU276a8BLx0K6i3txKqBlYy5MSIShNNBp3DJqfGFgvEiPs02PyKSxRngFZJ/4NH6OarwBiJkJxX9F35GG9YwJvuhGzO0PYpgUJMxC0+L3nfGGSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jG4owtmM7b1cDX70o+vxeWFipw1TpvzJSI00bV3D8kI=;
 b=vlYojfd+mSjlgdrXJsfCajauN1JCNJXBdz7GvVpdasOYQ1I1IE60EQ5kLqPQZeYnXSv6syqXNdiGoO34maFCqB3izLb2IdNIsiuGtPNWAsg99k7a2uJX/Vev5f7a2mgUJYXGaZ8SQQJNO7mTZUyj9DCQ9LC6ooXhxvhC+ogJMPavX1Rv1UfY5B0rdeTQ3iuhsXkBoiokCLsbkrv+erRhmYb/sIc7aB/NGJnKHz81MNqFMRPuFKplEH76kxUhE0/Y19iQON+OzK1r31FfII37ndeOvyKKP9nKd/2ojnpXQKIaWLVbfArJcKCtS+jzJ46HbeoaKiRetz1l/ne5zeKYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jG4owtmM7b1cDX70o+vxeWFipw1TpvzJSI00bV3D8kI=;
 b=E6XxHSe6i2P28UtmeH8tFE2VKInwBYZxUN0EKjJ7MuoGLu4/BI8Z/EMzdE6h4CXe21nksOoLE6HpKAziFskAIax3CNR9q3CoW7Vk52kFQKeMo+YgdoCOnihhWCkrwerD0ycfvHMeWhlDpPIo+41SGRR1mAV5+28NvGlGSpwHIzgxWz8ouQZPb/MTLkV3U38RIPvjVhsBjH/4Z502l8bouyimlcnEd+MNXDD9UV7loy+sKOpRZANprjoIg4z+mwYVXYmXhMYWLrE+yfOPs0LlzDAoeHFG5Ra5Q/ifwqZYvMJxG/LazSc5jXF9Ef0WhFm4kK0cf1JxtVoKxdPDao7E/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 14:07:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Mon, 1 Jun 2026
 14:07:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 23:07:34 +0900
Message-Id: <DIXRS4BZL90Q.2D6KSYH2S0O65@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 18/22] gpu: nova-core: Hopper/Blackwell: add
 FspCotVersion type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-19-jhubbard@nvidia.com>
In-Reply-To: <20260530030953.740561-19-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b019c8-ba16-4c18-b464-08debfe722cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|3023799007|18002099003|22082099003|56012099006|5023799004|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	knHWIHIJu7BYbC5g3fdbUZKKCtPtxArMblfTBR88cddL76hCNfs51mBI3MkWqvLr/GwRgIWDxAADvH5VSkL1HwR6B0odyKQsjc+83mpdxoMJALbIsMlIczUO+bo5210kIOuyes3Ni7/CxeZ0EyhBpGyB8kd/UorY7xtmvzPJeVQh9w5niFvRK4ekLjfA1YFDg6q/JTik/gXzAM0EU2cvsyTNcspD8S1tehM/ZiKkSnKEUNh6ECEeGhfVthDMmBgRbwx2KE56qEao2us5eDHStb3AieJ/cdwn5fab2hdCb02YAaKX1zE9gF+4Wr0zGpGGd7x1icmL8kKl7MqMIBmanqRaUlHeoVMHyjO7m+J0aD0CoAeLsYoONTgv3T8bDDQS7BYyvHLjME9hL7wIcu6Y5xpH3JeslJKAUZ20IWNQaQSNGxRYjl1TsXwtUejPofD9ZkTJ3+v20tHyzQxAGY4ts5+g7VOJThEZkyMqvMebJGjhk8xz72UxsW/U67oMQ4/ZpkpPtqS6k2Uvbh1suuoZ0OCeeoiE3eykZeFA1MVraMHso/TawywNLvXd8aqtIhdDNS/PqrwdCwyjfkg753BmjCnFmjxlCdDUDC8Xwl8ZczyuTvHDu5esP8WskKYSg6MMJMnuNHNixRFgpXk3huCiwCgUm+8gIF20nuVtIUgE/pe4VfxEjer0PdAi948EpQyy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(3023799007)(18002099003)(22082099003)(56012099006)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDRqNGh4QzhqbktiTnpMNjZhQUVGV1M4ZjYvMXpPd0o0eU5XSWZZcEtObU5E?=
 =?utf-8?B?Z090WUtneGdGcHpudm12b3FkcEhXbk16M0RxbUhBc0dsUnBlbHJzWHlwK3U3?=
 =?utf-8?B?RmxEZm01Uy9GUDBCaVNPQmRDK083TWRGd29TMTdpaTVqZXNrS01VbnJzUEdp?=
 =?utf-8?B?cm9mQlZ4OTdZbm5VY0ZZK1VhaTJubnNCNjhiYnZ5Qm5STXBMVVZlUmdCcXVC?=
 =?utf-8?B?dlJoekRHZGN0anZadVY4bytoWGxsaW9NRkFSOG9OVzFNNzA5aFBKZWhnYXlV?=
 =?utf-8?B?b0xQQzBxUmxTbkVHakFSYU5MdjVOd0Zkakl1MmM0Mmk5a01ZQUhiTWVJSzYw?=
 =?utf-8?B?MERYMDdtSkNUSDVHT1hFbXcyNklGNjZPd2J5TTFySEF2SG5qbFM4Y1VIeTg1?=
 =?utf-8?B?YlFlUTJlRm9wYzBYQWlTSXh4QlRwbzdybWw3eDZ1Ly9MVjhDSThNWFdEY29p?=
 =?utf-8?B?cWs4bW16UC9YMis0S2l6S0lVZTlra08wcVlBWG5XbGlyanZ1N3VoeFZoRzVh?=
 =?utf-8?B?UzlSZ3dXZEdsTTdjK0FuTUxBd29wdi9ab0R0ZUQ4SzVheFpONXU4RWNuWFc2?=
 =?utf-8?B?YzZaT09leWhuSm9IMXBTTWwvNUFyVTFUTy9XbWlaLzdoL2NaaDcydmo2d3Vh?=
 =?utf-8?B?VHQ5TEttM0o3bDZQbTB6WFM5dlRVYVZKUThsckxzYkkwRnNmT0FYcWJXdzg1?=
 =?utf-8?B?RVpKTW5WWXZlc0MxR2hwdFJIVHhrTUorWnBLSVhobW9JTjlldWwwNFc0T2k1?=
 =?utf-8?B?eTIrK1NGMVBFZlMzdnRFa0ZVb1hGSHNRSDJtQ1hVSTg1ZDd2MnRFaGlqUm9v?=
 =?utf-8?B?QzFHeXZCNUY0T21BUW1IZnFGdUJyOFZiZnNDV3dZcTNSL0txQkFSb0lsUDRC?=
 =?utf-8?B?QWN3cHlqaU1lSW9pazk0YjNBaWhYbXh3cWpBbFUzei90dVVxSWhVSytqWEhO?=
 =?utf-8?B?S2ZualUzR2NKLzJhdVBkdDhrR29VOWs3UENFUmVXSXJ3UXBkT2FveXBmWVhH?=
 =?utf-8?B?bVExUVVIVHpWaW9XUldBblQzaWE5WkZlUFFiWkVzYUNnbmdpZWxMMmRKU29G?=
 =?utf-8?B?M0tveFllekdkdlJlTm5NVDlZeXo1cG1jWkdkNjBHbk5iTXdacnh6MmlKdHBU?=
 =?utf-8?B?U21RVVRYUDVuaEJROU4xSkFSMnEvRjBjM1NGcUVESVVwRkpsZnVkUk5kekUx?=
 =?utf-8?B?Ym9WV2hJTmJMN2YxVDdnbDlkOWlQdkg0bWZQYXEyUUxnUUxUYTAwVzd0WEtl?=
 =?utf-8?B?TzR6dnZrSlVGZktXckwyL3dXekNuVnVLbzJrU0U0RjNHQTVmZFA3SmZPVkh3?=
 =?utf-8?B?SDdyb2xtM2p3ZXY0VzJIb3lGUk9OdUFiTCtnNjJZVWRqRkNkYlpWd3BTay9u?=
 =?utf-8?B?dytJNTRZUEhPNVppODdPeHFMQXlOUkFtK1g5bmlqbzlzZzcwK2p2L3NxZE1s?=
 =?utf-8?B?UWVHaVlPY0NKYlVaYU1ISVZzK2NCbExlelhZMGxtWFU0VzlnNFFWYk1DcHda?=
 =?utf-8?B?Y0FFWmVLVmcrbjdsTk05YkVMMmwvOEN4eWxRelArWGRGeWhQTFBFTHdUd2Vl?=
 =?utf-8?B?eWoxZk1LNmp0eU54MllZVW8xY3VVcldqQTZDdy81dy9tSDZVMWQ4THdTczNt?=
 =?utf-8?B?bzBGamNLalFQT2xON2lIQWNzMHNTTFUxQ2kxK05aQ2U1UkUxZnJpQ29nMlA3?=
 =?utf-8?B?ZlNGVit5N3NGRzJhYUJHbGFPMUc3a3FqS3hGUHlqdEpwem1VREVDMWtSRjZM?=
 =?utf-8?B?TTFJV2U0MVgwM0lGV0doc0pmSEltUTJML2RET29MWkFjUXVlWnhFTE9lVGow?=
 =?utf-8?B?ejFUbndUQThpMnlFaEtrQmlsRWwyeXgxWmdTTDE3RjhpMGtSWDgrMlRZSEps?=
 =?utf-8?B?ZmRHa2x6UC9henNNdy9YK0tROG8wVjE3QjJkSDhHVGp5aVM1bjV0WjdkdVVa?=
 =?utf-8?B?TXpIT2RvMWtzcklHb29wbEFsWldWVitFUEd1dytnZndKZGJIdXpiV1FTekNk?=
 =?utf-8?B?MncwQTN5emxITmpwYUZwTzlYZVh1UUZNTFNPd2pJSHFlekduS3lWdUlOY1Jl?=
 =?utf-8?B?bXlkaGFua1JRY050VFkrVTNvZXlmRFJ5cTMzVXMvMDExcmRON3pWajd3Wjdm?=
 =?utf-8?B?bFZOeTBIQ3JKTkc1d0YzNFFyaGlBRGRWTmUrRVJoMml4aURrWEZxdFR3WEVR?=
 =?utf-8?B?YlVVaGNQbVJvWDUvSjU3VENUejRwbUs5b2ZKcWQ4SFZSNktoNXQzZVVSWE83?=
 =?utf-8?B?YThxV1BzQjh5RTVSNS9oZ1hGejI1Y29sRHhJTnFtM3dGQ0psZWxGWng1bVhV?=
 =?utf-8?B?bDZtN1FFZzJkNTNiVk40eXFNZ1FkQWlBYm9qYkNMYzZ6eVFWYmdRd0JQT21r?=
 =?utf-8?Q?ClFGELGcMyESCctKflaMCIVCKP1g9ZwCEspARAOs9nXSl?=
X-MS-Exchange-AntiSpam-MessageData-1: D98bPyhetOx+RA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b019c8-ba16-4c18-b464-08debfe722cf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:07:37.8032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRH2nufY7uA/ilMfaHmCVWMC0iuuKQhcKwiiWtUDJkLVoAwrgwSS9Hr70/NtDg/+D5/2iWq0QItDTZJhJ04Vzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531

On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
> The FSP Chain of Trust handshake is versioned, and the version the
> driver must advertise depends on the GPU: Hopper speaks version 1 and
> Blackwell speaks version 2. Represent that version explicitly and select
> it per architecture so the boot message carries the value FSP expects.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index cc2ebc3f6e78..5aae8282f2f0 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -36,6 +36,25 @@
> =20
>  mod hal;
> =20
> +/// FSP Chain of Trust protocol version.
> +///
> +/// Hopper (GH100) uses version 1, Blackwell uses version 2.
> +#[derive(Debug, Clone, Copy)]
> +pub(crate) struct FspCotVersion(u16);
> +
> +impl FspCotVersion {
> +    /// Creates a new FSP CoT version.
> +    pub(crate) const fn new(version: u16) -> Self {
> +        Self(version)
> +    }
> +
> +    /// Returns the raw protocol version number for the wire format.
> +    #[expect(dead_code)]
> +    pub(crate) const fn raw(self) -> u16 {
> +        self.0
> +    }
> +}

This type seems to just wrap a `u16`, and return its raw value without
any limitation for its range, or other functionality. It is just created
in `Chipset::fsp_cot_version`, to be immediately unpacked by
`Fsp::boot_fmc`. Why not just use a `u16` directly?

> +
>  /// FSP message timeout in milliseconds.
>  const FSP_MSG_TIMEOUT_MS: i64 =3D 2000;
> =20
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 7dd736e5b190..6cdface3c618 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -21,6 +21,7 @@
>          Falcon, //
>      },
>      fb::SysmemFlush,
> +    fsp::FspCotVersion,
>      gsp::{
>          self,
>          Gsp, //
> @@ -141,6 +142,21 @@ pub(crate) const fn needs_fwsec_bootloader(self) -> =
bool {
>      pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
>          hal::gpu_hal(self).pci_config_mirror_range()
>      }
> +
> +    /// Returns the FSP Chain of Trust (CoT) protocol version for this c=
hipset.
> +    ///
> +    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
> +    /// Returns `None` for architectures that do not use FSP.
> +    #[expect(dead_code)]
> +    pub(crate) const fn fsp_cot_version(self) -> Option<FspCotVersion> {
> +        match self.arch() {
> +            Architecture::Hopper =3D> Some(FspCotVersion::new(1)),
> +            Architecture::BlackwellGB10x | Architecture::BlackwellGB20x =
=3D> {
> +                Some(FspCotVersion::new(2))
> +            }
> +            _ =3D> None,
> +        }
> +    }

This is only used in the `fsp` module - can we turn this into a FSP HAL
method? That way it also won't need to return an `Option` since
`fsp_hal` will already have filtered architectures that don't support
FSP.
