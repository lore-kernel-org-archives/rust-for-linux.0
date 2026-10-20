Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483993;
	b=gbpLol+DmfkcRwegl/V5K3JZi98XwB25kEZVfx06YwhepTEtix9wEkgrInk7bizNzoUd
	 hzGk2ZxMhqNxrUEkOEWOA4YkY31YsWSQAmzLPpshKELjoerZ1Ij5ULtjPXcGGEK+6byry
	 esDvnk8G720OVkgmCR9/IKsOfb/LwGStTXsSlNGNwKxMjkSHsc1wNr4L93Q/tio3dZ6R5
	 AViWhxnp8KVGqWai/OgZx6GC5Eb9gwmr11kJLN/xdxX/I+iJShbxKo0etxa2N/1IKs6GB
	 p7YPK8IzMzHOe9+SlsfSWm88DTitZfsfNdWoueYPHeFw/GEWQ0fwhiTBqpCITXaXjuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
	b=aipZroJVkXmWVre2+kE5HkwetAgQjUjBRKKPVaNGMs/TbKm9Nd7OvhX03Aa4Flc4IbLO
	 hmgXEqeulWFW8DU2wCyrC3oVJXIBCRjfIcSiol2AXKd5hUE+g9CVSrjI4NWq77/ItJTJI
	 qU/g0QBHBQyOD0U9bQMiVAW7IC2WutX9a5y0NZWZdmXgT1fzogA+0r3fOmpUUh95FyDhn
	 1plvZ0zQtl+y4kVb2C0FdhyI5NSZarAGZXOcfXKKpdL5mNn55rBig9fCfLEduPdsia45Y
	 KPgbzBONoYcl9t2Sas95NGMmdHXlg1pw+FTc536x1Xvg/nOptRZK8Z0UISrdkntvFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VGbBsq55;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C93606A319
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C93606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VGbBsq55
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b1abced3b4so2839168a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483991; x=1793088791; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=VGbBsq55SxMht3O1sFL/JYhDoUB1lktVionTe2hmEWeoz6nsvvNHdD4vuxO4EZ5VBk
         I/ykPxUt/pVq3kzNQgQyy1bcLYXwxSvhJbpvJXriWtSEq2xHTJLOUWDAFm5GFmKXzUKU
         zeQBf+1swtzmV6w5L41uWwYVRDI1Q5mrimf1EfENQOEGIF3TYEXUhcJNQSDB84BT7p2k
         IvJW1mNG6gsgso6x4r/2S8pXx1o+c3sH7wMfMUmWB65O6rwESMhS8iNG6vpMGx81Q/Jw
         oBATHwmSWWFs+gBdvOQg6BKlDe7FapxC+zmaUSwRwJZ3YnenOf/bWAs53FPtNREsDBiO
         CK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483991; x=1793088791;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsTwpzFLaL87CUGnKEpNBjiUo0nCAy+dGY5mjA4Yxa4=;
        b=yALZ9J4c9fX3ImJKoN712WnCI2X8gM5qMcUn9F7s06fV3JU7p0SQ63cOIE2xeAmyE4
         qdvnUw3GB5F+8SfhgndPnoDmyeaHBoBGFxI/+fLtb6adrZZb5iMMZeSrh8KgNVCxzkI1
         rcQzyNCCbDtpx1/3Rr+FB1Vg4fBVM1TPP8dYojRs7XNep1hQ0Dy/evdWeQrL7o0d4q1i
         nNTsc+o6Uh9/hYh7SvOY1H0nS/mXdxrI/oe0iMrdnfddhguaNXM6Gus2CTxR1Wukp7tk
         ulW1mfP+hulceeSkgHykUaS46IY3GuTnQdL9BQxibf5AWTKu+6h51ys2bdqULXgxLnwo
         dgrw==
X-Forwarded-Encrypted: i=1; AKwUvByCf0AVpRF4Ewmiw2/iZDAW7/n6PvXfMltD7kQ3w53AlzqpLVMEMgaRN3fTibLLaRDf+YPbYOqRre0EpcTvJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK1mKOFFtAx0KbKoFh+/gePrNqWnjUau+Ez0CUTJ2Rlf52QOqhV
	EmKgukJo7u/Rnlz2zq+0s7bjjwbe1JvuoaAYITE4TxBucNIMYOpTKgB6wTquHVV35o31FnBUYMB
	wDyH3eX6T9UW/N0lwIA==
X-Received: from edt3.prod.google.com ([2002:a05:6402:4543:b0:6aa:ff76:b1f6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:d803:0:b0:6b1:e474:e0e2 with SMTP id 4fb4d7f45d1cf-6b3a81dea57mr4861388a12.43.1792483991214;
 Tue, 20 Oct 2026 01:13:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:13:06 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081308.1768290-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/3] rust: dma: declare cfi_encoding for dma_data_direction
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:39PM +0000, Sami Tolvanen wrote:
> bindgen generates bindings::dma_data_direction as an integer by default,
> while C callback tables such as dma_buf_ops declare the parameter as
> enum dma_data_direction. kCFI encodes enum types by name even with
> integer normalization, so the type ids would not match when C calls into
> a Rust callback taking bindings::dma_data_direction.
> 
> Generate dma_data_direction as a newtype with a cfi_encoding, as is done
> for lru_status, and convert DataDirection through the newtype's
> constants.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Perhaps also add:

Cc: stable@vger.kernel.org
Fixes: c2437c43cfb1 ("rust: dma: implement DataDirection")

so this gets tracked alongside patches 1 and 2 for `6.18.y` backports.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
