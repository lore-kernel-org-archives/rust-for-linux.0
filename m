Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1BA339719
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895082; cv=none; b=gxN7i2os18uGGkiCo0+yX0UBKMoCd9xwG1R9JbXituefUyRAoAvsStzA8Navek6uO5JLKK0oHKMxTbUYXoJdgDa9OKzTRbZiZZo9GOAdOc+h51DmrCcSrQHO8o0H/6TAneyHx4Sml30WRRw/zQXnawvyp1dnlg5tDE6CkS6A0xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895082; c=relaxed/simple;
	bh=EQczVEYWnbMRBpNnE6dQjSg6viQm4diULuas+EZAa3Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ia1A5B42qC9gUwnhJMN2mPYDhZsx15SqEWV+NvhohPN5FrQrCZpPQlXY0clO77Y2pBVaGr8N/qFmFZDGhioQqA1yldBjnFSzLK7Ncd45/GBvcLJIqawWHY3Ddr1BlBpWe6k37hxUTV7GV+VwxbzZFUFSFoJBhrk8LHug/S7gEnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwr8HnDA; arc=none smtp.client-ip=209.85.221.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwr8HnDA"
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c4f6f6691so2115953f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895079; x=1792499879; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ge1aOvJFAR7aQGkV0dgno/kp0ps/MrSJgEIK9bdtNs8=;
        b=nwr8HnDAvUozpc/2Msoo6aZbrkWgqVi0xE6UlnHRIuM/53Xmqj+RtMCMe3GSLso92S
         QBqr6DPjqFzHxv04ap56mktB+hNLTs53HM7y//bHPHzgzQVWwOLs6JhW07hqe9ni/Rd/
         lnogmskA9r8Z03hTO/bLdFT2Ok/gs24y6pbVZ6nYPRG5nIPdm0WiD0xpnjbsgfHtbzPG
         WC2mUrBdT4pQuQBa0WhbXSGBHbjGyoQZaMUo8nPedM9WX+slw5f31/OajRmfwMuY1dYj
         DvPhdnlcK3sjxCixCVJ5WRsAy6IE/k1jOmAP+cW1G8e3SPBWuKbJtVGoUCZZ7FqFSBHh
         SLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895079; x=1792499879;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ge1aOvJFAR7aQGkV0dgno/kp0ps/MrSJgEIK9bdtNs8=;
        b=O6enkUfaCVb7nXS05zrox/DeiEm/e/ApAfPozK55Pi7ApmDekl36A6o8lnHZ71J8K7
         x/a4cV902CkEeIdB8Bowqf4G+Oc1gJcDjMN5ZrMdLMRlJgsmIhqWbNCcHSYWxOweTT6F
         BYYAJku+yURCaRxqIJzNKsAZeWmu/AwlehDsDnIX1+vh3GY/TNhIZEr4G6i6Q7xoRi40
         lXP5R6MBG/7Kih03KZZmF0nEMTrKMDsxLV5jWZl9TN6zmZTltVhBxD6N9bH89hl9Zrmz
         hXbcXraHMWpOs/xUoz9fGNCUyiYRxme0aFs2a5m3Inz7b2QHNh+z+28j6EVxBOcv0Jry
         WniQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJo5DY1+NaE3x2bn7HEwx3aWS+/AGb+hn5ZwQl+3tOLWowkp4xFg4AyE8+/mEULjCqiGwNBIoDXeL0v73v/g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKPfrhy4XfsZYPnlnxnCWo0Qb5hfeJK9PWhggT5EfcDasPeR/oF
	rzs4w6rG+8CJDqmJev0fFPdUkmZGXRHAElSyY8mbthEIrCpaQ+7UxgBFaUb2S7kA/UWXVmfBY2K
	B6ljJuQMa8aUG0kiLJA==
X-Received: from wrbhb20.prod.google.com ([2002:a05:6000:4914:b0:48b:44c:b8cc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a1a:b0:48b:848:3a48 with SMTP id ffacd0b85a97d-48dbaceb4ffmr24156316f8f.46.1791895078458;
 Tue, 13 Oct 2026 05:37:58 -0700 (PDT)
Date: Tue, 13 Oct 2026 12:37:54 +0000
In-Reply-To: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013-binder-consolidate-txn-prints-v2-0-cf78927dab23@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EQczVEYWnbMRBpNnE6dQjSg6viQm4diULuas+EZAa3Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqziYj+AQ5oP8TgOM32fhCrkmU5wwuOxvrlbETy
 9RzD/fXzZCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCas4mIwAKCRAEWL7uWMY5
 RgHXD/9YjV1kbbwdygkDS1reINif28PQXcA5Fu8TakMT1J4tN2Dl9funfEzoLBharval5F7aURM
 sTkSOJpjdsFfsziCMZfNMUikRaYzKr9cwJg5P+XMEGxU7gvPtobhg/5DmKHA6R6bx9qPCd4eiov
 MFIUWMtMSV9PYanNy4GK0FOgyYsQfhEasZuFz/FbYgnzZ22v8OAFOG4jxhi/sW91oM+U+WD/JQi
 iC8IgmAaxJMlRDoWeuQNwB2vKq+tkrFXSNPgH/buKhq9bLA/jgsm2f8uNI4EtxvxMuy6l/AOaik
 EvZr085XHcKcqolQWTeuGUl32TmC3QxUX50PV5QYSCyeNbmoCxAFFpRU9EMeAdxod9TYgmfr8PY
 Fpox0iQLmfJJblf26ao8DsVR8+URpHQvsE+AmB3f88yUeaRkXzxb8HUSV0IoNMLSOy1tzriM78W
 gxCagVvfpWbFLbyy4IQr1uoNEihpt8uxs51RSz+IecMtCycNrXSrsom7GZsWViJOiUg3wuONBt2
 6QAn+kQHC5ZDCGO+8VK82XBPrVo3y9WyfQnX/pmCc52jfTYMjBHZg25pRn5QE+6tobUBnX9MZ14
 OhE5x2mleTMSL6ufHtofL+p60Bl4gnwyv7yDny44ikhxcfpV/tJ1gBhRS4s6Zadmi7CYnzbrUhX UiqCovZi2jym6kQ==
X-Mailer: b4 0.14.3
Message-ID: <20261013-binder-consolidate-txn-prints-v2-1-cf78927dab23@google.com>
Subject: [PATCH v2 1/3] rust: error: implement ZeroableOption for Error
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust Binder wants to store an Option<Error> in TransactionInfo, which
derives Zeroable. Implement ZeroableOption for Error so that
Option<Error> implements Zeroable.

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index e52793f77196..9003a1b86da8 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -199,8 +199,13 @@ macro_rules! declare_err {
 ///
 /// The value is a valid `errno` (i.e. `>= -MAX_ERRNO && < 0`).
 #[derive(Clone, Copy, PartialEq, Eq)]
+#[repr(transparent)]
 pub struct Error(NonZeroI32);
 
+// SAFETY: `Error` is `repr(transparent)` over `NonZeroI32`, which is part of the option layout
+// optimization guarantee, so all zeroes is a valid representation for `None`.
+unsafe impl pin_init::ZeroableOption for Error {}
+
 impl Error {
     /// Creates an [`Error`] from a kernel error code.
     ///

-- 
2.56.0.385.gd3acb90ef8-goog

