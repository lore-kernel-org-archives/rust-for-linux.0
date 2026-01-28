Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D51D33ADAE
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644182; cv=none; b=h5GMj7/umwr08jZJvl7zksVG+mLKpd6HPtMSnvasasad+xrgkXBWHaXHWkmHpzgj7QSy07ptYgIgwXSqP1+8O1rWvNeJ2kOUbydbKRY2qf+RVuKiDYRv/jwscjq1hnOSvKH4RpGe2lScQRwdIjOOK3Go6pc2bSwA1UsXJC2v35I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644182; c=relaxed/simple;
	bh=OWcfZiYWS0H6ctpWcE+xkPHvQjej9ptDYntcK8zIjcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QD+pkfDm9sQtsxAaeD/DsO1Jrw4UVnOu7UNWbwoIhwhRIzF/ou4dm187AacGuTKXYbV3X3x20gYrk0MTEyfFKEibDl5hhd2s9twIA9CipCGqszMUWrP+RAg8fEvsR7o4cQaUCyXWJjCYalhyeKdUf0soYywVG1QeXAIg4gY6qSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZ869jjq; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ869jjq"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7cfd9b898cdso210463a34.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 15:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769644180; x=1770248980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HK2cJpoHs1cW08tNlDAhBYjQE8db82PEiBJhgotTdb4=;
        b=BZ869jjqK6UXxsHP6lBrF18jgR18J5/VQMMXO+CHVH14FG27rJPBqBvFGlIVCC/nDO
         0ylhwdg/aRdfShoECoHsOBwCONgWcq4OEEzVPRMQjcVVL9LhFL4n26km/65Gmq91Uwog
         mKG0QqDGN4mZ37k0OTcBo+eFA7upH56jjqsPySfMHXqZqgh+XRLKTHO88UEX62PbFEly
         M/XIIjsKRk9DOo33pSMxeRrwmObCOyXLVOLGLkKHMHW7DsKL2xicrs3UsWzwg7zuTDaL
         4uR3IXjN+6nMsicIAtMu1jWbXBbUP1+qIHjpetVj6YLufBXUKTCmCyca/LvIa0nktZG9
         XNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769644180; x=1770248980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HK2cJpoHs1cW08tNlDAhBYjQE8db82PEiBJhgotTdb4=;
        b=EWdcED+WBHED+6m3FGmcz5Qa4gbnv8DN1GFohqKtHzQ4oBWiZmQNZvFRG1ECvTT61l
         zTbR+6+Vl/WrWWuSgT3eR6Rbi0JZ2kyWyXS2JDeQVKNnCHffdX5rU+Uip+rJgSKsGCqG
         KIB9Wa/dSX04CTm+o8cQJIuWTomT94c9hQ9ZNLfEHxNk4jJRrz56D77uWEEtuTGETYuM
         wOgpFToIACxW2XSUgILXe62gagIoZh/ow4G565fPjx2F8Ld2Iv5rVR+i5cNnlfPsniol
         umt6/XYOfD/c03M0vkkTAC5q1VKg7jfdHJm1QLi+1WzOmoifjA/KroTX3UX9XH/7ze+d
         DMmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvUHp3A43pjQkRNqOot3inmw5lmzZE+qxdefhoLRMdAj+Z6uwHJGllcwwG+oyZhJrgMt3IibG37uRiKjaw9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzowzIRaHJ05Vp0RJVUhBb432fIuJ8L/XFzdZUFT0RVpEHHPUca
	OGi3CM3frh544auzxm3oTpylhf4a2ZpdkhdWsMD0ChTd2okrVpclfMkmBv7oyg==
X-Gm-Gg: AZuq6aI5xVOR0oJHo7UNSUXYRjTyHHe4fPv2Kjl6v+/KRUPlZKYlH2EczNBTdNNoWo9
	OfNg3/Z5VE/rrt/sFwYfne9T7coBcDQc8IXuo+ML9FMDDNbpNTiUf0fa0y9RETTv7d8b9zY2uD1
	D5Y5RqrUhCBFPB4ZCmn01Vej+8dM7XYC8jOzuDPRf22JbygSoUU4sDim5/P2FFBPLVOinqeSIZY
	fmoMKgR/rjv2dB6fVK66Q+pY/7jn4a/KNawk+b3jHnXvn0nTHeD8CSfpFrUtTGfFTuaDOaDKo+y
	c+5sfPek6g2ixmcrZwIup28zEI6fQ2S5LcyhLZm3NZbb01i3YL1qu3ErhhIekqPEoecB39iJtYE
	7uor+5kI6qYSsR/nB0UTp9CWLSM+TDaLgaJ0vo5zJAO+0t0d6jn8H1BgIt1Z/GWkkyEsRaFUfqM
	UxMliQ5TvkORbByXaqXKYCkscH172s1oKvy/OCqcmNaBgNKmraB5+aTqbpb2++THdxQRFxxUedV
	52Ir+3eehOVapB13mKoUbqPnQ==
X-Received: by 2002:a05:620a:4447:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8c713b8905cmr517714785a.46.1769637223840;
        Wed, 28 Jan 2026 13:53:43 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c713580985sm237855085a.8.2026.01.28.13.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 13:53:43 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7918BF4006C;
	Wed, 28 Jan 2026 16:53:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 16:53:42 -0500
X-ME-Sender: <xms:ZoV6aeFVYNlY6JZOeUsAI2HEcEDhbH7enQkHWg-TSjlEBT8Ol0bgXg>
    <xme:ZoV6aUxMMTUp9w1Thy-VOM9WqW0cE4EOqvpvF93TkVJFiA76zlA9Dp5I9JXqxwe_U
    hVwHlgatWJvP7cN-I9wme8VivxHvF4wo_CVMQN9iKy8OTQ3wOajHkY>
X-ME-Received: <xmr:ZoV6ac7joAFn2VhRmwc6qXOrYh1IjW0Vy2OkUJ8b4Dc6YaZPYjFn58XB6w4kh0Isb563K3D8VxLzbgcTaUX9iJrKt4GZWZL_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueehgeeg
    gfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepgedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    rghrvhgvsegrnhgurhhoihgurdgtohhmpdhrtghpthhtohepthhkjhhoshesrghnughroh
    hiugdrtghomhdprhgtphhtthhopegsrhgruhhnvghrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopegtmhhllhgrmhgrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:ZoV6aZB7hyhCwc1ejSFD8OKjnpoYoi1MBQu3CrjP9P_z56Nk4yOMLA>
    <xmx:ZoV6aR2jIFafD6KfaKotGIGwjiFlkrJPM-qaTv3VAogHX2QZPsjiwA>
    <xmx:ZoV6acFxwMU4l_0otaO7K8jn8XfZAR3W6IO6WjQ_JbPZ-4WlCsfTKg>
    <xmx:ZoV6aSgKwChdCbDLYtURt_RpUDJL1NpmsHz4MUs4kx2Mzd6W0BSgcA>
    <xmx:ZoV6aeuQx4Qdu4ZQsrOISY_tsoAGO88IyVyB1kOZGz7E53ymMh760lBj>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 16:53:41 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,	Danilo Krummrich <dakr@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Thomas Gleixner <tglx@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,	Stephen Boyd <sboyd@kernel.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	Tamir Duberstein <tamird@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mitchell Levy <levymitchell0@gmail.com>,	David Gow <davidgow@google.com>,
	Peter Novak <seimun018r@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 6/7] rust: work: Remove `impl_has_work!`
Date: Wed, 28 Jan 2026 13:53:29 -0800
Message-ID: <20260128215330.58410-7-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260128215330.58410-1-boqun.feng@gmail.com>
References: <20260128215330.58410-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now all in-tree users of `impl_has_work!()` are converted to use
`#[derive(HasField)]`, hence remove it.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/workqueue.rs | 53 ++--------------------------------------
 1 file changed, 2 insertions(+), 51 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 2dcfd3eace39..37fbf348c760 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -578,55 +578,6 @@ pub unsafe trait HasWork<T, const ID: u64 = 0> {
     unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self;
 }
 
-/// Used to safely implement the [`HasWork<T, ID>`] trait.
-///
-/// # Examples
-///
-/// ```
-/// use kernel::sync::Arc;
-/// use kernel::workqueue::{self, impl_has_work, Work};
-///
-/// struct MyStruct<'a, T, const N: usize> {
-///     work_field: Work<MyStruct<'a, T, N>, 17>,
-///     f: fn(&'a [T; N]),
-/// }
-///
-/// impl_has_work! {
-///     impl{'a, T, const N: usize} HasWork<MyStruct<'a, T, N>, 17>
-///     for MyStruct<'a, T, N> { self.work_field }
-/// }
-/// ```
-#[macro_export]
-macro_rules! impl_has_work {
-    ($(impl$({$($generics:tt)*})?
-       HasWork<$work_type:ty $(, $id:tt)?>
-       for $self:ty
-       { self.$field:ident }
-    )*) => {$(
-        // SAFETY: The implementation of `raw_get_work` only compiles if the field has the right
-        // type.
-        unsafe impl$(<$($generics)+>)? $crate::workqueue::HasWork<$work_type $(, $id)?> for $self {
-            #[inline]
-            unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_type $(, $id)?> {
-                // SAFETY: The caller promises that the pointer is not dangling.
-                unsafe {
-                    ::core::ptr::addr_of_mut!((*ptr).$field)
-                }
-            }
-
-            #[inline]
-            unsafe fn work_container_of(
-                ptr: *mut $crate::workqueue::Work<$work_type $(, $id)?>,
-            ) -> *mut Self {
-                // SAFETY: The caller promises that the pointer points at a field of the right type
-                // in the right kind of struct.
-                unsafe { $crate::container_of!(ptr, Self, $field) }
-            }
-        }
-    )*};
-}
-pub use impl_has_work;
-
 impl<T, const ID: u64> Field<T> for Work<T, ID> {}
 
 /// SAFETY: Per the safety requirement of `HasField`, `raw_get_field()` and `field_container_of()`
@@ -746,8 +697,8 @@ pub unsafe trait HasDelayedWork<T, const ID: u64 = 0>: HasWork<T, ID> {}
 
 /// Used to safely implement the [`HasDelayedWork<T, ID>`] trait.
 ///
-/// This macro also implements the [`HasWork`] trait, so you do not need to use [`impl_has_work!`]
-/// when using this macro.
+/// This macro also implements the [`HasWork`] trait, so you do not need to use `#[has_field]` when
+/// using this macro.
 ///
 /// # Examples
 ///
-- 
2.50.1 (Apple Git-155)

