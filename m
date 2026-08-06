Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021104.outbound.protection.outlook.com [52.101.95.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85047045E
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017061; cv=fail; b=jzzjmT1MuxOVnBmMPlH6331RpJQov+eE22RsMTVRN2VlA9IyzgdDArS1C1qGik1KAMQHtecxZtQ0GLvMgvngtUKEtri/62VHyEDeryFOeIcLz1By8siZlx65Kthyn6KaLgD8I9VDALOVrCh/vjS6tCzo7mAkyVzCgvt7cHC3Qo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017061; c=relaxed/simple;
	bh=BGmmku8oRVAde0w3tRBVfJPlrEWIo1DwugNQW1wE0Ug=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Gk3z7Hf/sKuB+wZYaJyHQdZM4j5o3aaTzanfpUkk+nDuH8+PMRRE//jrpJH+4fmw+pwdsnNsRiE256pJiy0TDRHiLP8dzDEDW8QDKU8walgUOzclBQ20mNi9o/08pR8XpXwPBc4OFXEh+4++JFp7HvECmgCZnYWxq8dZ9q9yP1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JrgGtFOh; arc=fail smtp.client-ip=52.101.95.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JrgGtFOh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaF9l4UAhIQXj4rv7FlUghwSFmWgMzy+Zx2JclJ/g7c/xuhVib5bWJ70AU1krPKZbAZcVcOJ+yJW+TQGvgeFl8wPwkfV3cHGA+7ZQkIFeky26wwcz55t1ZmyXVERymtsA0MyJZyXtJbHchCE+/89YeW0VFdeTIh5PfMzoV0Wa0E2+rttwa5Zd06g3cQawJVQ+UzSWLKzJ0ag3EVVt/rv8QLopEGG5MJHyxkUmfAp/tcWj38CkIMZ5wLvyvUuWnAQqMrGYPuZ5pEuh5NW9Kz8vtt+O5jLO/NUGttvzrhSJ0+S2gHEwjR6PzE5yqCXd7RGGDialaw7Tyx70aPZXUa0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb+uLfbL30VbXEB+8OnYvObilB8jvhqZVXo0UAkj9zE=;
 b=NYyOnuVUpat4f+nxsI5psOfVIx2YRpKLcoJFuKODlVacK/hvnaNdHRG7l5vYPyTMEJFPWXAsCaVDIbIdwyrFY23F3NnlEDTyfweTJhKgLWWGdi32mBYLe1OAYUcxJMnGAW0rCzG7FE0LQbGd8yDkIJDsv3MT11KhqYI6qpSh0Nh6HXr+HkWEwCZ6ZVQLgb5z/x8+qm9EjhDL8EoKRl3L9X0QU27LIYw1AysiqJXT2cQIgTPknFbKB4Racz/sfYTCzPBxxdOY37L5lxwURUfsowp2Ts9JsC3FfjZtBsh8rS2duvsZ3GZKa+6McVjGar2E/Ko9rplJNWMQwz795sd9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb+uLfbL30VbXEB+8OnYvObilB8jvhqZVXo0UAkj9zE=;
 b=JrgGtFOhFHCbpWMYU/3wIYRz8waPymLi52163+tyVy2/Thn+XZvH2X/SqfJ2LIjrUrE511ngc/ukqfm0wZlO/3udt5cTn6B9UunC9TNFy0MQ8n5pKoEhEysIqW8F6hYO0dAEV7n+pSg/kAgf/dTspzg53lnzZ8gBIrW1yig/VJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b4::24)
 by LO7P265MB7590.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 11:50:56 +0000
Received: from LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a]) by LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 ([fe80::c07d:488c:d4aa:2a4a%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:50:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 12:50:55 +0100
Message-Id: <DKHU7G936M2Z.3A8B6AQLWLEN2@garyguo.net>
Cc: <acourbot@nvidia.com>, <anna-maria@linutronix.de>,
 <bjorn3_gh@protonmail.com>, <dakr@kernel.org>,
 <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <jstultz@google.com>, <lossin@kernel.org>, <lyude@redhat.com>,
 <sboyd@kernel.org>, <tamird@kernel.org>, <tglx@kernel.org>,
 <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout
 conversion
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <arve@android.com>, <boqun@kernel.org>,
 <brauner@kernel.org>, <cmllamas@google.com>, <gary@garyguo.net>,
 <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <tkjos@android.com>
X-Mailer: aerc 0.21.0
References: <20260806073241.1024319-1-tomo@flapping.org>
 <20260806073241.1024319-5-tomo@flapping.org>
In-Reply-To: <20260806073241.1024319-5-tomo@flapping.org>
X-ClientProxiedBy: LO4P265CA0188.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::17) To LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4b4::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOZP265MB8551:EE_|LO7P265MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: c961a46d-e7c2-49ed-fa8b-08def3b0f986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|7416014|4143699003|56012099006|10067099003|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	beJzyx1BnHuCZCfyBqgOVaHqDJunq13Y1+vx3kIdI/D37kl87o7JGosHnYKE1xjRSmqLt7gFm2avBsK4DAMqVUGFHxY7VT/ZeOoBCiVkAVgCctS5e2njg8OZZbsPMkqKoWXCZr8uwFrDeakgXKuJ1WrE/PJ4im/WqOemYx9IMUiBm65niG7vOpdJ3gFoxQIjlRqnGdc8n43L2vRyNdliYgPgNH1deDlUhfYsAqnVEYJyyhDhemiV2i7R9lkRNRRJFMJzatUJ43HG6Nx0thpD6NWR1uaxanNILZNmIlGLHTDSCkj4jhGC6A4ehkGnM6jb7rU7gdxCw+upbltkCZIAAVPEYq34xSx4NJFYVF1403+KpWoBeBBWd8F5mX/pV1TBCJUDaLfyFtLxLk0H+WxeTjrs1uH6nkbpr+V8w1Sjz086SeiyuXEVmQHTEfYgz9AgpLDLTMvbF6PIxLksCylcUc9/hwurpBxwSFn39Ds+fubBSdOdFbuzWErBydIOkpAK7rsuzeXl0TCZEX9YWO3wu0tylJ1X2peNAC632lbOgP4aRaDNFtyUrsz0XmTAuhCE5E7SVMuyrxtGY3/QluyKwT3PJ+Ad7ufMDEBRCVcHUx2sB1qXbzmxOktU/Lo6yZ9w5FH8JJ1ccUCzCh0P2U4UFu35A7EiedtHW+wSGoqAMaE/+wQUZIgliGWZ6qc3eEN6k+BO+b0HOCMDel5A3IMzKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(7416014)(4143699003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVcxQjRNRGt0Z0xjck5rVVlJdkdEd0ptRzJqdXNVenN0ajZSbklIOS9ZM2tU?=
 =?utf-8?B?bXN6bTljaG9rYU5VdStacjhOd2FvbHdNREhCQUNxOTdKUWFELzR6Q0pKNERi?=
 =?utf-8?B?QmlpRTlFTVNuNDV2Yk5hbzF0SlFsM2kySVRqUXArWnlHcHVqQWRzZE80em1x?=
 =?utf-8?B?WGtIY0IwbDFpMXJEajE1aVJXSXJ1Vzk1UDlBOTRSQWdRbTFTOUkrdU1JNTha?=
 =?utf-8?B?Mmw3VHdnWGROb2tqVVF5eElNbjE5Q1FLUDhiK3lmWEZXYjdJTWcwcDg4ZzBp?=
 =?utf-8?B?NzVINUtvS1R5eE8wTFhYbTlWRlBtc2JyZ0xVK25Xbjd1Mm9yUUUvVis0dHZ0?=
 =?utf-8?B?eUVPQjAwSXRBcmpZOFY5TFcxQ1dnbGUwTGx3OUtmaUxaTlJCVDMrUzFSNUIz?=
 =?utf-8?B?U3p2cWNQbjR1QTFMMXh1YzMxRHU3MWRoWFVuQjNMMDlYZnZCSG90TFU1bmxi?=
 =?utf-8?B?alRBeDRJZlFKRzM4UFN3ZXh0VkNkd2dEZlY4bWVyKzFIaUl3bm1ENnUzYzR2?=
 =?utf-8?B?cjJFSUtyYmZHQjI4bWVudERiRWV0WTdBOWVZWnhXMzJxUjJUKzFRTEcwV3cy?=
 =?utf-8?B?MHJOUTVPRkZaQXY5R3U4RDVxVWZ0alphRWUyVWU0c09EL0lGelVFdHhIUHdG?=
 =?utf-8?B?eHpIUVk0eEZLc3BLckxqTDZLWFNrLzltMDhzU0dJemlNK214SHdPQitNZzBZ?=
 =?utf-8?B?TEhMV0o5V3c2N0VHdzhuWUpVQnNiY0JQcHBYUDgrcjN3eS9sUWZyWUR0R1hJ?=
 =?utf-8?B?THVXd0s3MFF1ZWlEaGhTT0M5cVVMOUd0TzVhVlpIWkZ5MDBJS3BsRVJ1Tm1x?=
 =?utf-8?B?TkNJdHVKMGpLZStxdDFKY005VjlJWFIveVBkbXNhZVdEUC9RMDIvT3FYc01U?=
 =?utf-8?B?R2FNYmk4aWtqYzVCd0JuYUl4Y21PZFVqNDhuZkhGNytNU1R0NlplTytURWln?=
 =?utf-8?B?dXI1WDVxOE1mcElTMkFmOVY0L0VLelBPQmErVlRTNGh6dklNTzBqZzJQbGx4?=
 =?utf-8?B?VGdqWTZycUx3NTVGLzdEeCtCa05sb25aN2JYaFR5eWVMM1RuZXZweS9BaFdq?=
 =?utf-8?B?dFlhV2pwUnpzNEs2dy83UlNHVVhOa2N4TjJrTXFueWdEeDI5YTRta09sTzBm?=
 =?utf-8?B?YWJkY1Q1TUgzakwrVHF4WEVLa1ZITi9xd3NjMWphWlFVSTEwaEp2Rm1IT0Fh?=
 =?utf-8?B?UTMzVTRXTjdGMjNTWTZVRkZxZzA4a3MvSTRERm1EUmp1UDdHQTJvQ2RrQm5n?=
 =?utf-8?B?NDZRVnp6aHJrOHlOODFwdk0wd1VkK05CbXpBM0wzNC9rOEs0cVRTMjRFME5T?=
 =?utf-8?B?S0NWeXFNUDhpbWRlWGErdGlPMGtTb1dyTUVvQ2s1U085ZlRIdVphWndwYXpy?=
 =?utf-8?B?dzkyMXdMYmhHUTBnODF1bkZTZGc3V2ozV2JUVFNkc3M0MXZ0TEYwZ2Y1SlFm?=
 =?utf-8?B?SGVnNkJTK0djbVU0ZFJkczhSMm0wemVrR3lJNStmekdrQkViY2F0SnVqS2M3?=
 =?utf-8?B?MTk5dTZHdTNCV24vb1JLSFVqOVhFVG00YnJFY3lPOFp6dFh5bDJXTS9icWRU?=
 =?utf-8?B?UCtUaTVuMDNnZDFpOThDUS9MWnhTM0dJOVMxK1JLaVdPbVdSWUdRVENybHlz?=
 =?utf-8?B?Z09NQmhBU0RSbXRNbzdkVm5vcVAvTmNGWEVpSVFlSEVIQjkyenJPVmJqV0tt?=
 =?utf-8?B?U1F4RTU2bm1sbmQ4Y1NxZEsvNXZRRlJwMXZyYld3cldNYXlwTG1kZlliM3Nr?=
 =?utf-8?B?K00wRnk1V2Fvc3c2MVNCNUlhYlU1Rkl5RE9yVjJQaGxSVTUwb0ZXSUtyc0VY?=
 =?utf-8?B?akVYQ1NBUU9QK3B5U0dVM1laWnRROVovckpkZFVDSk1UaFg2RXRLT2RTck0r?=
 =?utf-8?B?ZlIzY3VUdTZVWklxemRJNXJveUJuZmV5Z1ZmSDFycjczbzNLRFhmVFdDNUZh?=
 =?utf-8?B?ajNyWFhFbzFEazlneXNLbFhhUE5GckNZb3lVTEU2bXBjOHcrWjN4a3ZoRU9Q?=
 =?utf-8?B?dkxBUkhmQTd0c2Zvc0Y1YUxqRmZEazNuZjN5cVczSEdLbDg5c2laTXZBVWV1?=
 =?utf-8?B?K3hZWVJwS3dYRkd1NTJwdHZ4Zi9VSWt5eUR6anlJTjJlalM3VWhMSjkwejlK?=
 =?utf-8?B?aEl5Zk1pN3AzbnRveFBvMDNaZG5zUUE3MlA1NWs4NURuQy8vdTBqQ2o4ajh4?=
 =?utf-8?B?eTlUTHB2QUJFM3N6UDF4WitYL0k1ODgxUFZQZU5NbUZ5Ri9NSHdVd3hIVWFt?=
 =?utf-8?B?MnhKVktiZlVMclNyS3NZOFg5WXFZVk1XT0YvbjdnUHpveHdzbXl5ckpoNXdo?=
 =?utf-8?B?WnlzS0FiclFhTGttVVhPWk9USXRtSXo4Y1pnUnBWWFMrM29JTXF6QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c961a46d-e7c2-49ed-fa8b-08def3b0f986
X-MS-Exchange-CrossTenant-AuthSource: LOZP265MB8551.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:50:56.0576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sUSR4cdjbcsVz9YqozJE14AtwhF+xebvYuAB6n2JZF/RjH9lu9WMeT271Ltv57yWppyIwPIIYyhcEXZ3vRdSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7590

On Thu Aug 6, 2026 at 8:32 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
> resulting timeout is never shorter than the requested span, clamps a
> negative span to an immediate timeout, and saturates an overlong span
> to the kernel's MAX_JIFFY_OFFSET "wait forever" value.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/time.rs | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 9d65a6c1992a..5844ee985a7b 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
> =20
> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a ti=
meout.
> +    ///
> +    /// The value is rounded up to the next whole jiffy, so the resultin=
g
> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` do=
es).
> +    /// A negative span clamps to zero jiffies (an immediate timeout).
> +    #[inline]
> +    pub fn to_jiffies(self) -> Delta<Jiffy> {
> +        let msecs =3D self.as_millis_ceil();
> +
> +        // CAST: `msecs` is clamped to `0..=3Dc_uint::MAX`, so it is non=
-negative and
> +        // fits in `c_uint`.
> +        let msecs =3D msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX))=
 as crate::ffi::c_uint;
> +
> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
> +        let jiffies =3D unsafe { bindings::__msecs_to_jiffies(msecs) };
> +
> +        // CAST: `__msecs_to_jiffies()` returns a value in `0..=3DMAX_JI=
FFY_OFFSET`, i.e.
> +        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well withi=
n `isize`.
> +        Delta::<Jiffy>::from_jiffies(jiffies as isize)
> +    }

This should be using nsec_to_jiffies?

Best,
Gary

> +
>      /// Return `self % dividend` where `dividend` is in nanoseconds.
>      ///
>      /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit =
platforms, so this is


