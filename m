Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021126.outbound.protection.outlook.com [52.101.95.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611C2441A6;
	Fri, 27 Feb 2026 12:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772195289; cv=fail; b=kZv0+nMK31Jj2HTxVYn/C1E0qZpMe4RBMB3DdGEG42NCDwJzgRsSUeoqSnqVkTHDfJ1HkVNF+ho+i0aUkjgpZS3IpAHKtbiI9DteE4ugT8tidB+qXM8gl8WQL30A1a1jTMe2SVbStzgbcpp+0T1CXrAZ3g34JhVd+SYIi5U85s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772195289; c=relaxed/simple;
	bh=VJFLU7HY4FWXRqaUFMOAK6yBFM5GeQH0Olk1gYdYtR8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UgEPKlOJ5RXj7rYAjHGZ5Uq6a9nnhmLrR7foqYE+38a1NS4dU8fu6aUwWJWyHf7Gvq69I7B+iH6VxIPW9g9KkFrk+YRiCMBJsO/5rV6QThKTiyYw/RSm5Aye8kp/oiE2OrwepyMXqqD6lm191pGRS94OOsVUHBGwffmgJzXqejg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=pYRDnqFE; arc=fail smtp.client-ip=52.101.95.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="pYRDnqFE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlknwnYHTOOE8vlkAMLY4fLHGmAX5TG65LHxAg1iWD1Xa7uqls7WxqaPDCvV2oj4ZSiMCdjB/2CNFCqeTUZpfYl00UtIEwijzb6axGpWyUtXxNss3k54QGdexytW+m/3HAE6HXCH6GtYX0qM7UU04810OIFM1maTaJJT6nzxcOd5G1xUzHH8dgnaZGaiwjdlDlGedIkA3D02Yr5Kwpx6gPZA7M2Jrviv1KzV9Br/N354ZLZoN1g9RyHY0VeSV8GtJ2va8GWjazSlz35ltDlJeq8+InusTHcKuMfRQQ3fWJzNOiAPJGA8N9+ZnhSjzH0P1hy/gAvy2Ytr3a7p7OEUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RETFTXEyIiglSLZ3Llud1duLxrY1S5UiAH2ixHPaK8E=;
 b=rsW8kmoMpN59vMeel9TyM8eYeQKfzfsVke3NFYEjeEMtMYfwOmQxiTQi2PSfoq2p5htfL7vmbyn85iEtGN24Eij1tXo4ow6cysjSwdCzySfPkqK9RlX1P3DhikP2om9C2VEoaDd7d3Q+h0vp90HReiKm/0UXo7IapWpqFNoIH6cMQVlDJd66FPNtcHErI+TicRNHB+DIfrW4snH9jM9bdEc8ssKh/Ue8vSmy4z4p6/nZMYvppx4rUdx9uwdScCoZloZ0oadXGwR6cpGbTyfwRmQi4NcwpTLbvrqNR3DthD9gu2A3g7LXHrFmFVac/qNIWHg9aveLMmZ0DL+Lspoiiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RETFTXEyIiglSLZ3Llud1duLxrY1S5UiAH2ixHPaK8E=;
 b=pYRDnqFEyRVA7FlPLkV2UjGkrmyWzVwXKNOR/466vmKKIBwbjN4Pu2crMVuVSM+8kA8nhA8Bs5D43guW8Ro961mJQm2m0eJbkm6zFm/k+FCBwq0Q5xd+vMiU6dwGIeL+mmsYx9Sr1vY2BIQRob/mYsoQ7iIuoaH1pMiZSm/iQpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6110.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 12:28:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 12:28:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 12:28:04 +0000
Message-Id: <DGPQSQCRYS7E.2443Q5A151I7H@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jann
 Horn" <jannh@google.com>
Subject: Re: [PATCH v2 4/4] rust_binder: check current before closing fds
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260227-close-fd-check-current-v2-0-b3347edbb310@google.com>
 <20260227-close-fd-check-current-v2-4-b3347edbb310@google.com>
In-Reply-To: <20260227-close-fd-check-current-v2-4-b3347edbb310@google.com>
X-ClientProxiedBy: LO4P123CA0682.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e566673-076b-4d05-5013-08de75fba7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	1tPpyWdJzjbG14jLDy4r/P493Mq7fBxmr8USyGEnaPKbcbbWFc9nFdPMVMtZp+c/HR9U5r62QoJAu+keLdMav/Z7ZHaQztDV2r7JGy+5a5gXLvJb/0QtE7uijwhQeOfYeg5yPkibOk8mAktGqcl4JFCcl6teWndhUSkxeZhqDwVLuJLVYYTtK75e00YQMgqHmTF9D8px4KtQD4Np1qtvdVZ/pCb4IXo7ruQC/crtZjD/MbufOg+rMwN3gdllgJTJc4w8HFLtnJiXS93XjfHU8lb4cbb6m6HZ8IyRUNWCw7GdR6LfW/vodQ7DO8TOeHQIPLTKT2+yq1fp3+TMjODmmN+weg6d0qEPAXMBlUG3dbfZcgfzTeeeU6KKN14Xf9hbkb+8zUy6Cx/HrfJWsQQwNnwmEzcqEG1rrjvG2JgdKdlwLmWbYUUKs22fx09PR3NdySooCa0gWumVIigt8UzUrkKtt3AfKfEkxX/DXYuA8jLISYWaMhZUzlcwo6037ljvTSO/C2nmm1gUzJuZQRcbWd+lzgxT53jYF+Am9Tg0jf8Oja+nisA9hj8ahCqE0hJe80925gm+aa+xyFmmgUUhHnYAi/5pFn2G41Kn747mx+qGCLmCar7j12fjPOInIZ4QQrocHdjoLvsoJcBiDLqdxYHi7rufYdWz5rQ2SlhoJcKxNdFPpHATIqEj9C5iZILB5LEGY8urzE2h+KpeuIzBFpkPqa5+ywCmgu4MepAkRgayavg65zQBGCmqEpwP70NJCEEFWf1ckXnKu/gOiz3J2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXpTallCQXRnR0diZFBEdEt4R0NEZFUwWTBTS2VqVkdmL3BVeUNjRllIeGp1?=
 =?utf-8?B?elZvV0hzV3RKUlZwQjZyMjJ5VGtzeDMzbEZtWkFJTW10RXZkcmR3czNUTU5V?=
 =?utf-8?B?aEFYZEFoY24rSnlqNkVURW1SQ0UvaU8zNkdaNDFxamEzS0hTNU5YcXVaeHhS?=
 =?utf-8?B?OC90c0ptRklNc1ZpV1k2QlJDeEVYOGg1YjdReXgyZmJIWStsN0lYVUhsYmhk?=
 =?utf-8?B?aUcyZnFDc0V3S0JCK2JjMUx1SWkxUW9Bb3EzaXJTc1lKd2RtZFVwNjRzam9X?=
 =?utf-8?B?SkxXWlhGdVZxbE42bnpwRWRBdnZ2RTQ0VUc1NTZWRVhTcE1tSkR6dDQrcTAz?=
 =?utf-8?B?LzhZYTd6bloyQTdnQnF4cHZHV0VHaUdYVzZWWFFxNjNUL2NrSHZRYnZQeStl?=
 =?utf-8?B?aStGMld0eHFhWjduT0lnVFY1amZYcmdzclFRN01NVU1IeXU2SFM0bDdWN2pD?=
 =?utf-8?B?Sk4rc29MeEdjSkJISE1XVlY4TFNVaU51M1JWSHdLa3NvMytUVUptMklyNFdG?=
 =?utf-8?B?ZE0vS1hML3N2OStFUkdLOWFmVm5QZ0JMUWhZenpSSjh1UGxqcjFoOGYrdmVy?=
 =?utf-8?B?eEFtM0J0ZWNRaEYvVGVaai93cTllcWJ1TDZ1MWwxdkFlWkhhTkl4Q1FwL2ZJ?=
 =?utf-8?B?OENQRTJzSE9ZUkZjdjFLV3JmNW1sblM3K1lGdWZvYWJ0Rk85VXFZU0RrRmZ6?=
 =?utf-8?B?Mmc5RHN3VVd6TCs3RmVocEtpMHJXSUhSRUlOcHJNWDVzK1J4QjdHVjdxUlNB?=
 =?utf-8?B?czhCUWUxd3BIZkhaazh1Y2I0Q3R5RzN5T3pON0tCaU9XNUFOWXFQSHN1WWRl?=
 =?utf-8?B?bGpVanhPcVNWWkZhbnRTQXBEVXB3aG90M0RadjNMQ1poSWUzeGs1R1Nzazcw?=
 =?utf-8?B?SGhWSDBKRkxsSTladmtVUjhDR0VmemdKcE9GYmdTMXI3TkRnRElseEtMSlYr?=
 =?utf-8?B?Zi90V1gxcndIVkJtdlVpZmg1OHRMSmgzZW9BTGQ0bk5HSHROQURpOGFyZ0N2?=
 =?utf-8?B?TzVXcVF0eTZ0aC9CWW8wdTRYRzlOWFp5K2J1Z0Rsc0o3amNZclIvQzNZanA5?=
 =?utf-8?B?K3c3c213N25taFlibUs2QWhSTDBhSDZwS1FsbzBlUGQrK1hRMHE4RDFxNG1C?=
 =?utf-8?B?NWkvcXFqaFJmWTNBWTNDODl2eDM3dlBlbFpBVTJycUpWYW9xK215Y1d6UllZ?=
 =?utf-8?B?Z1NKYjB1ejkzNUsxUUl0dDBaczZORzd5cG16dVlJMG9odDNXUWk3NndzU0ww?=
 =?utf-8?B?RWxpMG9NS0V5T1dhY25wd0liaDFwQ1o4YUdCMnkyMW11YzNpS1labmFJdHJ3?=
 =?utf-8?B?ODl0K0Fub0VEU240TXJwcUo5d3ZDd05TR0NsWjVDVnFFaEgwcnJjT1I0dVFz?=
 =?utf-8?B?SktDYmZVM2xCL05mSmplMUswcllwTUV0SG5aeHVGOE1jdEZRcnYyQ0c0cndB?=
 =?utf-8?B?bzZralNReHNuTVM5NmFmV0Z1bjhiYS9ndmNpZ3IzeFRQUTltM0cyaVkwZytQ?=
 =?utf-8?B?TVgvU2M1YjhOTVBIN0p1NG44anJ1ajBiRmhOMFJGWGluMFpxbmRzdEFDVmlo?=
 =?utf-8?B?RHE2cTJCdCtja1RmSklNZG9PZXN3U1czNXF1dEtpcjNZN0lrblJDOGlYVGZB?=
 =?utf-8?B?dHJJMXNJdE5QL0VvbGRRSElTdmMvaEYyczJoaU9SQmFoZ2wwWW9RR0ZsZVY3?=
 =?utf-8?B?cDE0VjhtbVNIbFFKZGJaaFNsWTBTemhOSFoyY3cvMDlDNkZIL2tZZnMrWm1N?=
 =?utf-8?B?czU4RlJyaER3NSttd2VqelA2dktQenNNVUJVT1UrS2UzTzM3KzlDWWdhZUx4?=
 =?utf-8?B?V292WXYxMjFxbERaSmRVVmNTTmUyMm51NVp2OHFndzAralpUVFFheW9aUStM?=
 =?utf-8?B?c3NLTHJIcmpKaXhmZStESDZORDFGTm1vZ3pMTFc4R2lNZUFyZlhlcEpFY3Rw?=
 =?utf-8?B?djFlSGZUeC9welorVnd6YVJLbmtUMmY2cTUyMnNCMmUvM1J4VVlId1Ntdnln?=
 =?utf-8?B?NlZ6Z3JaMTFNWkRHTDg1ZDJzN0RnZW1SZ2NNVWZaZjdPZFVnaDlIamxDaGVZ?=
 =?utf-8?B?bzFmZ2ZxTVczWFBla2MwMExnSGdicmJPVUhQdTR0TTZlVWw1R0xrQVJmU3Rx?=
 =?utf-8?B?UlZSNkRBVjB4TU9EbzNQUXNzcVU5MW1GNUhPVjVDK2V6WlZUSGRaZVVVU0dE?=
 =?utf-8?B?djVwM0VEdnBNaDI3S3dFaHA0bTBHZC9rVzloWnBlM21JNXVOQ3NBSmt3eHVF?=
 =?utf-8?B?OFlYb1FwK2pZL09DY0w2TTJOQUtMaW5QUndOK0liK0dhVnI1bzZMZ01yMjd6?=
 =?utf-8?B?N1BrYlVZK2dYNVBNVmxRSUNjbGVGRUNPKzVJa0FvVmdUdlZmTTViZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e566673-076b-4d05-5013-08de75fba7ed
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 12:28:04.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eh8h7jN5HbvrjMd2C9elI8tl+GkTYltb7zQtKbjGPn+56yZtkOQbvU8kl4767S2fLqnNNyDSkIDMsjHZsqJPdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6110

On Fri Feb 27, 2026 at 9:34 AM GMT, Alice Ryhl wrote:
> This list gets populated once the transaction is delivered to the target
> process, at which point it's not touched again except in BC_FREE_BUFFER
> and process exit, so if the list has been populated then this code
> should not run in the context of the wrong userspace process.
>
> However, why tempt fate? The function itself can run in the context of
> both the sender and receiver, and if someone can engineer a scenario
> where it runs in the sender and this list is non-empty (or future Rust
> Binder changes make such a scenario possible), then that'd be a problem
> because we'd be closing random unrelated fds in the wrong process.
>
> Suggested-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/allocation.rs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/android/binder/allocation.rs b/drivers/android/binde=
r/allocation.rs
> index 7f65a9c3a0e5..31a42738a99d 100644
> --- a/drivers/android/binder/allocation.rs
> +++ b/drivers/android/binder/allocation.rs
> @@ -260,6 +260,10 @@ fn drop(&mut self) {
>                  }
>              }
> =20
> +            if self.process.task !=3D kernel::current!().group_leader() =
{
> +                // Called from wrong task, so do not free fds.
> +                info.file_list.close_on_free.clear();
> +            }

If you're sure that this won't actually happen, perhaps print a warning if =
it's
called from a different task but the list is not empty?

Also, I think this can be

if ... {
    for &fd in ... {
    }
}

rather than `.clear()` and then iterate.

Best,
Gary

>              for &fd in &info.file_list.close_on_free {
>                  let closer =3D match DeferredFdCloser::new(GFP_KERNEL) {
>                      Ok(closer) =3D> closer,

