Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021119.outbound.protection.outlook.com [52.101.95.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40584A01
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765499648; cv=fail; b=hh1+VoACYK9U/4K4e2NPipDuhfZVH/a2ThNbRfjZIajs/eBk/xDrYjx8VberHeqghgnV61nZbY0woGhZQuY5lXUV2c02+Fl8Algqogv8ynTI85dFNUFMWxn18ngr3PPrkzKyhCcuMqt/SYKWQK+nvdU4fV4F8MOiaf0h0qjnt9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765499648; c=relaxed/simple;
	bh=SdMdYThMc8Xyuu6Q82xYAsDnD8yxfeQMSxpfX1oHUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cPCl0RJbkFVauq+/yC1aqc5Ym/fy6Mk92qlZOsGsxmURV6DLrUKp459kL91OQytD+8rf748NJ7RfUUk2v3bWW3hKxAzRSHJSWSQ/Kf1rHtnPyIZD0uQm9zW1NKJyyVMMomud1DhetLvvjwtcI1q9ZoShQ/5d0vid6jYq7wU1Was=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Cj4F96AO; arc=fail smtp.client-ip=52.101.95.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Cj4F96AO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8TWuREeGRUZWMXgiDEF3393QDJJYlne0BodqqhoQ71xT8hNFl7aUXDTf/ASxOd+xIiJRdpJbdVosIuzvs+LVQrLO1dURQSIck1hGZjfnsdTIH7HQjSUmkIv1UTDU0/8N2j6kPVXLrXrxqlTAFsjS2WEHu0vJ2vc9Iy+dlPklsG7VTD5ylCLtmsdY0etG5yf12LzJJxNiZsIIrbacoW2gvWQL7pQxYXXGgg5EUbHErPzPhqGQ8NTy1SnTfoqxvk+0YoZdDy/wpr/0cjDlz1V8k57d3lDPL/+V1kymTFQrrisfG1ganhZ3YGeKKUsQIoO0Q9boIl3oV75uJ7xVMuOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCRvu+FieCxplAtGb4Q+URYGZRE12Xzv1ExFmy6Ujmw=;
 b=F23uFyOdwCOurRA3lovHCZLi1zprzLZlfMkch+ekXrTvrwzVagE7gqneHeOKrqgqUWI/EjjXZPHPAIzNKcYDcgHPMIfAl7HnzpG9cwJppy5qH3iEKDDdbHhUTosLy6fpjwBAXJKuDD1PiW+ABp84dB4f7xgqrOgSQaTAKGG07ylwWWscF4AuXpekEamYW8a+AoiOYuHcnevCYNTY3i7UhkHt7ZHbX5ODrE3AstD/yJ0bE9iFw6GKP5W4MlIBPD9DMo11Pqyw8zzt9XPFTzuX4Z+I36dJQ5fFRP6WVsVsJUrD8rFw9GEZmb0M0bg5Iq1iBps6ekPX2df1SuSFoIMYBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCRvu+FieCxplAtGb4Q+URYGZRE12Xzv1ExFmy6Ujmw=;
 b=Cj4F96AOD8N0HsVyEXQ30x0GpHSLhV3+fIPANIqf4kpg+AO2zc4FxeQ3yfzzTg/cQtfMcSE4G2/qwXYgMUL0feyV3N+nNG84vh6KI4G/fdR/5VrUT4Xtw37liXK0JgZPx3XczwaumwdUk0GWV0RaRYwQO8lg4CFwHFcC4iJfSSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB6037.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 00:34:03 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 00:34:03 +0000
Date: Fri, 12 Dec 2025 00:34:01 +0000
From: Gary Guo <gary@garyguo.net>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 2/3] rust: sync: set_once: Implement Send and Sync
Message-ID: <20251212003401.524495ae.gary@garyguo.net>
In-Reply-To: <20251211230919.1303926-2-fujita.tomonori@gmail.com>
References: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
	<20251211230919.1303926-2-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 939066d6-101c-4a3d-cce0-08de39162689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UFRelrzuNogQqLdDQd+K1BtKruwcB4/9LDTa6djoGBUA/XpZFkVxn6cvwa08?=
 =?us-ascii?Q?t68CYbd89+WrIEjvmE4AWsrDdHgsj+B0vABuo8otDdAnzKtdjdbEpgmwC3PI?=
 =?us-ascii?Q?uslTNmOUJeRHQ81ZPANP7yCIPoy5DFy/JLJGGJW9k8Qk97vOtTKTarfc5nDG?=
 =?us-ascii?Q?UrG9EvWWZnZoqMMqh/z+yqA7jFiCGawgZU7k9ej30eNjoAeHyeS43Rjo16Z1?=
 =?us-ascii?Q?PTu/z9g96qV/ZMRFrkLzq+nG5GK/GMtX8p67ZuqYdBuqlngsqkXChPQ+5QZ6?=
 =?us-ascii?Q?u+/7aa5WLYBQGpU6VQdEPUdOnU36AYyqHpstCNYxvmytgE/jPPhpFDmG85DY?=
 =?us-ascii?Q?aquFF1TNc6oMaTYgzO4HkJWW6iZUX35KnpaDFYwqIpmIl+1CVynI15O2rLlf?=
 =?us-ascii?Q?pGA6J7fa72qRpbMOuwUUeDOfw0EROKZ/hV3k1grb0VVfTnQzk6QH3d66Xn4r?=
 =?us-ascii?Q?h5P7SAiDrkt2LoW9EavxbxcI10EjqsYXWjXC25o5C4W0wVdEW5ofpIphmnhd?=
 =?us-ascii?Q?/gq/W4BBRUr7CpGAF7Rrzc0HlXtTT775i+YrAubjm98xSxEmNgjsAsBXyjV8?=
 =?us-ascii?Q?jE9V64Vt8UNz/XNPKwstTN8PHGUU07o7+WDTrB9OBRaFRWGOnR+416DD4J55?=
 =?us-ascii?Q?9uO4XR06SxCPHDRqQoIN/ovPEI8lcJnCJkngqS/eFbfZfls3WQVjibjex55j?=
 =?us-ascii?Q?yTt9De5EfFXPgHgOj93Ks7amaaMsvkIMOJQ7kqpm7B48uzcoGsGhYHY72KRx?=
 =?us-ascii?Q?z7BxozarwYc5GBvYPSJ6L6ZZxB84L90clUSEUjW6V28ul+g2HGU5fkxLdicw?=
 =?us-ascii?Q?CEpBEovksirx/udA8qV1kZU0wZ9kxfZ4JNmBZf+Fk00fd0Pmyv01rmp9N4q0?=
 =?us-ascii?Q?iln4rFV2RR4fvYSJDuEyehCQpI5rMjn6uRHazA6gU/DsQbCBKERUI+P1BUSC?=
 =?us-ascii?Q?HWtUAJohKiy7PtOPfRQavRk40XIjBTKMEt1ey6rctaYmb/PUZG27Sc1VcSqV?=
 =?us-ascii?Q?403WYhXEixhBnhWdz1ivtBkMlpNVXipzkswl7NuXPgitp1+ZcZ6ggCbGXWvW?=
 =?us-ascii?Q?dPilGezGqW8hpF6wJl0DX9ZT/18djzZT0RXPfP+xAl/vXPd+3+AP55C5Mp8M?=
 =?us-ascii?Q?pGmoVmgYojAk9dDwn3Nl0oDG0SY9Zt0a0ApoT+bUwUQX3Q/OCRBJUHUqqYXl?=
 =?us-ascii?Q?hN8itmUH8YXNilkKN/ch7dY/uyqwUt4P7qV5U9O4jvxLaVLoDje5vqUlk3Zh?=
 =?us-ascii?Q?RndQ0r1LdbW6qz6ch0zUBVJbisfGTzdwREJOjFdesno0kuRg+FEs37E4lkTI?=
 =?us-ascii?Q?h5QWy5skGaStzyLLbznyo5ZzYcuibBunALJlEwRrwErZRHzxXctKEut8ANF5?=
 =?us-ascii?Q?0uNZ0Ww+uh2wMdQEkN1gBkTqlybJod+K+Y/UMvYCiSOc7UxJZiFTk0uIpZXD?=
 =?us-ascii?Q?5IkOC/VV+Ix+mq0cIuFcldvPM+PBLBc5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vSbmDpeTxfoiMAeGUnBYNKExTgikhpLes5sbuGe7yXy5c6W773E2zo++X3D4?=
 =?us-ascii?Q?uKLVqMwqPxNUE2TX0GYZ6940VPn5JKeTHJG1Ydth19Nv5BwsUySCm5MyNu6D?=
 =?us-ascii?Q?QGxhL2ZhCeI09iOlejEBwLvUKkwLrL2QnN5z/qGOHG4yQnI4iRFlX1X8PcaL?=
 =?us-ascii?Q?bNxkDR2QVq8YbFqMZThILcDoTh3lOWn4x6TFqZXmEZuFuircKxViWOZ7wEDb?=
 =?us-ascii?Q?ahmbjQhCrwrVdenn/3U+kB5XTO9OW/bb77RpRs8wo++n/rmyIoDK0zN8VR/f?=
 =?us-ascii?Q?r7JsgFS6Y6QeNWv8MBfwf3w74TeWMuRy90E3tWW5+O8yNHZQAYGKBB8icK7G?=
 =?us-ascii?Q?HCUuv/gbNbF4GJvxM0N9jRXrQ22yYpmKOrM6rDlWAXaspPxpSuhhW+7gs1No?=
 =?us-ascii?Q?6l/dnLutNNkNVzzpgXo3lEqcpTcmYDl9q1PI0kovMBCkZ3UHEjDKUhrh4f9K?=
 =?us-ascii?Q?hbziX93twd+1lx6rgVZqM74NMZ8n2mb2nWkdlwsSr0DPMdNkv8/uYCHCsVC8?=
 =?us-ascii?Q?vtyZ3mxI17K3tcr270KyuSHzM6ZFZ0GLkXcKqkjdFJQJp0FdD5hkBDL+cXlv?=
 =?us-ascii?Q?QWfILRS8WtqpdKr8dDzyAFcTfWhkanFlBzfsNh/xLz75jDVyNdylYWUAsoEz?=
 =?us-ascii?Q?nH+VgvYmk6/8d0XqUNPLtYEA0aJqVgRi6EQYQaWrG0s3Ia54tpVx8s7R9OXS?=
 =?us-ascii?Q?vaVDElSvnLEyKF2VBfTiYia8u5YukI7qjQ/nMqz37GJ4zgYTP/6D8HPgBPvM?=
 =?us-ascii?Q?iXLChx9CNXJ9MupIgaTkU8vjGxrQN1YIRxSUhUyzk0T7KfMBrVxDTLovgtaq?=
 =?us-ascii?Q?w8tw4iWzT+I70JZDmedd/1n3s0tlUnZGnra80uy0MUh7FBoK8K0B8OQYp2lG?=
 =?us-ascii?Q?jEqM7GhwGAbOIeEOP28V5EacGS7NS14zL8b/ethadP/Z9deBopSUnA/u7mer?=
 =?us-ascii?Q?pgwWoAJXVLtuuuu8FDR+xtBI/80v7Rx38GW5RmC9RVM52Q3zhZ3sQylpC0oU?=
 =?us-ascii?Q?d2KAw5LF5bcE7LnS6m8Cay494Lb+DjjwsbN499V71c+xpCyxBNUCR08Tvj7Z?=
 =?us-ascii?Q?Own5NRgq/s22QjmQzkb9DzdLuE4jAEvPNlll4ZWZgGMCiDxhW+erRrhnh5oI?=
 =?us-ascii?Q?bWyHpaHrRq9X3pZIHwK4Cy37fJVTf6td6rGHyHK9M3WgE9m7AdI0s7BWpPF9?=
 =?us-ascii?Q?ZMAQKhnVQunTdfSA8D+XbPkR/BvaCnWtxEF7tCPI4/luYqo3x9gtUTZ6OswX?=
 =?us-ascii?Q?I5UZNj/+H+E59Bz5oUUhhCmg0U2A8nx5hHtNClWipY9fGVLqeuIKurM5i1dc?=
 =?us-ascii?Q?sNODfbwWjXVSS8z7RO/84zZtL9OBJXqUplL1o4EY4aXFsgkqud6T6oXnrgvB?=
 =?us-ascii?Q?q23e7SNwMbKX4iUGCLmQqN2YEFSYQR9OZINvNkQBm8Qal1DX3Dukj7Q4+8M9?=
 =?us-ascii?Q?3HdvPjOmQz25W1Mc+a5CtYPrklHHSHuYyJsP1uXDiPzJpEmXUuqev6d0hj0q?=
 =?us-ascii?Q?FH3xjgqQESXiZvtN7zPr+aAHcYQWfLKsuJnFKU+ErdsmHk6EtmjyYuiL1XET?=
 =?us-ascii?Q?y0DhxaIoK2qsKqPLbRoLm2X7M3GN2JIF8/y8KJsb?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 939066d6-101c-4a3d-cce0-08de39162689
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 00:34:03.3070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yd5tKS1CC8/zB6cDLJBEZI8fad1xhLGw5em2iCZnJkF8GQjVGzXU8r2Gwxd+QGT6vo/BsZ3TZODG+f6VZDUf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6037

On Fri, 12 Dec 2025 08:09:18 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Implement Send and Sync for SetOnce<T> to allow it to be used across
> thread boundaries.
> 
> Send: SetOnce<T> can be transferred across threads when T: Send, as
> the contained value is also transferred and will be dropped on the
> destination thread.
> 
> Sync: SetOnce<T> can be shared across threads when T: Sync, as
> as_ref() provides shared references &T and atomic operations ensure
> proper synchronization.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/sync/set_once.rs | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index 889d37dfd17f..5894d0dda14e 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -127,3 +127,10 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> +unsafe impl<T: Send> Send for SetOnce<T> {}
> +
> +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations, so it is `Sync`
> +// as long as the data it contains is `Sync`.
> +unsafe impl<T: Sync> Sync for SetOnce<T> {}

This needs to be `T: Send + Sync` as `T` can be destroyed on a
different thread that creates it.

Best,
Gary

