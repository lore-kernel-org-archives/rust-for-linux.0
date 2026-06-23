Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F55377004
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210291; cv=pass; b=TdnNdqOMlhPRYHtZ1G/CH8rU91udHojINdJkWXxXRLHBBkQQ30lVPb10kmeyMdB3b8FgGRoijjGEF1luDVn6qcbf8HoDaDp+1On0MH6cUvgtWWv5hTQhta/AmNAB1IpPRTPSxA3n/TwvDnBaVhmGdJl7Bkn00X+xSp6Ah1PhjaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210291; c=relaxed/simple;
	bh=8p1PEq/JYxMhAtp/eLRUsGxj+TLfc2A0VTM0mSMnb54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwV3YrSoPxR6teLMfOtRA/T6UloVRXWDTCnoowPHBCqTEJKvbq8hEPD9BUjXeBHElswEDcaUZ7ybsKeN41DS3hdO9xLYJzmlPUifWtyj7MlC9L3JceSuBDMfv2nF90Y3icVczSNok4IQ6Dnn0hnDf9XdqG35jAHvIOQz+iV/ktI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMESXyeN; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMESXyeN"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137dd3b29d5so87369c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 03:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782210289; cv=none;
        d=google.com; s=arc-20240605;
        b=Fi9Ydk25USw2Aq0XFeKLdRfwYGccoDSjSl9Ic1Kuqcdl3pvGCHFmcwIAywUxBs2Ae/
         Xh6T6RvOsejDr6JPeAwT7Bn8mr+DogfbLQ3WSpcF9fQUZV72deiOL3fkErPSh0WxMPRw
         nfjKFW5T2xeH8D65X8SNGrB6864NEf9GkHYcrRzj4ss86ZjHXF0lZzEZV8/DcgnOimtu
         vDv6tc2rcB4wmLZHquLW8C2KQir8jIH8UDtm7zEPmpxOMBzsxK1gH3sWT4Fpnmd0KZ4V
         0//GQLf6Vtva7IcOaKweSt9xHkm5L2G2UTJm9yKOxJYQK2hp3UttytOjeRoGfStodQea
         G5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8p1PEq/JYxMhAtp/eLRUsGxj+TLfc2A0VTM0mSMnb54=;
        fh=L8fN5GZzzlVtf0J3/IGVs4DTBga1OiWMylwyTs9S2ok=;
        b=PrqPNcfEKX3Yq9qdMDo4lEffcYHgmWnhBKX06r7aCWIO3uBn1nH6X6GtXlVodyYtpm
         jC6AH0D2xvDFALNzv1NTMuW5yJoYQqIx29QRTnKP35/oKjye+pmMjjfdVqTbqF6On39q
         iAQVEjhEpOfb9ZMG7yeGQgfJFWnv4c2wbZmghyTgJjt7AYmVFDkXT2BkwXbWGSbHDQM/
         UmFlLgIpcOCrwR8XpKdKVXYkktljGN+dQUgQ6PkO4w1ZTDdcTr4tVQaLrqmlIUCHZgKJ
         a4kUYyF6e9R4hU4gL+Y7fZWbNu30CIRpkrmBqp0QEpCA2NrDZjmr/nTXlSSRNRReCh7J
         F3cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210289; x=1782815089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8p1PEq/JYxMhAtp/eLRUsGxj+TLfc2A0VTM0mSMnb54=;
        b=bMESXyeNF0Zp/XsKh3MwjSJhwW5ULG0eYUYI8gxlbpLxVlc6AvWtovnjDAzztENYCK
         YkO9Zz4jr1nXkKvC2V8xXXotlKuQITNJQKjmP+GbFkTV5HPk2eDAK+gcDphC/Bzd5eHk
         uvH2pSck5hk2TScke8/Px6+Xz1LGEGjUda1fuxwiJzwUmWWBTPgu33Q2jE/qOycfFbhs
         yRpkp4QvHDXOfk3XvOzP1LQsYwrRrdCJCg45TpMqcJO2CQ9SiX1Z1CZxBJvl4+6nTELk
         RC43psHYYDCAD41DGmmtw+TzvVnacBT2drD70QuGuXHQMgEj1HlOe/sJHWX5Ch0k/e0U
         BGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210289; x=1782815089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8p1PEq/JYxMhAtp/eLRUsGxj+TLfc2A0VTM0mSMnb54=;
        b=kUwDSLpLMgg/JMeDIYnGCvXtGAb/JuCmqQ3NStlfnhMgHyNTNzw1XoietiavsV8nAg
         EcS+T2pqwQO/YN4GkMqguTrxJCq+NiKwhYGtJyua9PltjIl5R8LotGjJbIFryMHf+cfm
         0Gvq/6x4cB9Ehv7dt7CCxlMXxac1yu06vTfVkqnbAUy3LFYhSocApxkbCVlDMDzkIpeU
         6N0ZcsxfSBjLdnPRuyhwyFU0xkKuUeuytbRVLqw/X+1pAIbUXXWqRCtEE6EHcnhW0wgF
         ZNIIa96/sRQjJf9AQz6R/eBh8zQFYtPEGrB9ihEPDrZAu9JwCgkp4OIOme5hV3LMlhtM
         P+Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpAP+cw5HiHQbqvFXtdE8tjesftHmuQu+jbKyJz5j0y0DD/SnECb4kcHPIQqjmqfoZkI+BGcPR4J3DR3QZDVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm5gFrgbypHVAfJ5fRoFWKTxxIuPbrlxCwN1eWtVWM50NAVa+d
	OS7601Y+cKBaR/pWWgD4dbr+BYOmasiCWpChBlb0SQNYXPT+sqggAgQybjE6vDDLNLm4j5EDC2Z
	NwXbmiUBI7taPhvUVL3GvrokYoaYUqDE=
X-Gm-Gg: AfdE7ckaowVYB9/aFmWcAw4NFSrbSawA2/QWdCnr8V5pQRNN9ef8XkyEDNmqs5pUFGn
	lwYnj8TMn2ZBMvsqIF+QGQir+wEpR4VYxeIIwixp3naYSq8DjhY2Idj+9rbDGC9+oeWy67UYOTi
	JTo52/PVkvUg6ldZpCTo9aoAUJS7IzqW+VZ10B5HX0+2ZIFK3IAycC01/WpQ8Bs5aXDFHFcV/0J
	cCDuJj3t7Kgkw7KyiE7HUBUnCLjdhx5pfLHyl8RnLHIKbOuPimtfWZaRtOqB0LlW3nKaa3bf2y4
	jl9HK+IcB6rlHCiEBEbRYDP8lGyz1COv8M7QqNDtol5IHgnnhxwqyPELWZRIzT1qqv518XTVOyT
	LNR23weXOq4qd
X-Received: by 2002:a05:7300:7494:b0:30c:52ab:806 with SMTP id
 5a478bee46e88-30c52ab0c05mr1446569eec.4.1782210289441; Tue, 23 Jun 2026
 03:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622173250.411377-2-phasta@kernel.org> <20260622173250.411377-3-phasta@kernel.org>
 <ajpJmjTST-Hoxutb@pedro-suse.lan> <908762cb7fd90df1df70eda28363a0015c404527.camel@mailbox.org>
In-Reply-To: <908762cb7fd90df1df70eda28363a0015c404527.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jun 2026 12:24:35 +0200
X-Gm-Features: AVVi8Cc8Kh7AOr5aHxP44CbB_NUQ2aQAJElI3bwSmo3owcnjAf5xJcUIaFT10lM
Message-ID: <CANiq72knGU+PUCXUATOkA7225++0nvALNByoJa8gaV_EuyHx6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: sync: Add abstraction for synchronize_rcu()
To: phasta@kernel.org, Gary Guo <gary@garyguo.net>
Cc: Pedro Falcato <pfalcato@suse.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lyude Paul <lyude@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 11:49=E2=80=AFAM Philipp Stanner <phasta@mailbox.or=
g> wrote:
>
> But it would be interesting to know more about how in general Rust's
> unsafe comments are related to problems beyond UAF issues, and to what
> degree we want to document context requirements.

I am confused by the UAF there. Did you mean UB?

Rust's `unsafe` is about way more than just use-after-free -- it is
about all potential undefined behavior.

At the same time, it is not about merely "dangerous" things.

If you cannot possibly cause UB, then it is not in scope. Otherwise,
it is very much in scope and the safety preconditions/requirements
need to be clearly documented (`# Safety`) or justified (`//
SAFETY:`).

Now, sometimes it may not make a lot of sense to duplicate a ton of
information, so sometimes we lift text to the Rust module docs and
refer to it; and sometimes it may also make more sense to refer to
external docs. One way or another, the goal is to document the
requirements and what is going on as clearly as possible.

Cheers,
Miguel
