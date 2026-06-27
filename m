Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7638886D
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782570526; cv=pass; b=sN4bElV7rV/YPXGxeElydEu0Q4pO9DoFJv9kz1SZHTKipAqx5avqeg1VQ45VvLpD99D1RT3fsdP13MHAXF+vs3e6avN7PU1jfxA51f1AWp3ulOWvpRf1QtHnTfhF3DQfv7JcXbpyGoJHwKW6iWLMCVmzY7NxXUqJoZRNcdiMgqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782570526; c=relaxed/simple;
	bh=9tyurSzDbZr1gu04ABj42aQ78zzMVbGzoBx27F+JEU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6Xv9Uu9CfzuIZvpUUmR1Gclkwyigv9OLfhRPCUfi9z0xKlZAgQ2ZKBxRxi6/UWvdc+xDd+JfbNNikb7ijyE1t0FzJlF3MaLLvozhe7Fae8npHBzDJMIitDEEWuyll1xpndkOySIq3gYzfgRJXF1ovft7n0fs6EqOQA5kawUjRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XC5p9FyU; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XC5p9FyU"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c5912314fso232898eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Jun 2026 07:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782570524; cv=none;
        d=google.com; s=arc-20260327;
        b=DtcQbpPya1cVszXHRP5U3w2l9CbkOhpqwXc5JNc5I9IohdiCgh3DR7nneUKjmfs5oO
         IAzQlvl94DiudUXWaJEmSDUAw5vUPb/d6DGuDoBEdvQ4wS5fG4eBOo8vzRE2TSj/hmzG
         gPuWJ/od1LEsdgVzZXjj0qNf5/nQNMFPc5cxsY9+Kjo3b+bqlqidpf807uyj93Sp9l3r
         tO+OwlxQm9aoDwBESfXxQochmSLuinzQGHjmGRcVH5afXi0B5Y4khbmqWAZ18GozJqWX
         2Bw0Uzg8M6nS9vEHLFWSX4lDIgrvaKTVuc4lONaX7KXPQCrP4YZuZmmUFSGOeODYhTte
         TqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oj3Bc84dNDqEL3u/QBtsARL4xEy22u/Ty0I98NR0ywQ=;
        fh=Eqx0rTcy5eG6o95mm1PWiN4ixlJBBETp/C0J+X1Poi0=;
        b=FPhsDbCDSOI3UtKz+jws7ljbScsOxKzxAv2AK640UrtTDMudvwmODzGkWtriQUaV0W
         mS8j/6evI0Iqi6Lw+FgZyXX0OuVNKj1aYpSzjx3LkDKx8t5r5lI5pVIXmLJedWGoIlDM
         MvczgCb0clLIvjMj4Ealp5uK9upg54g6mjudeazYOB5RE0MxSbFy8zm94BB4a2anadUw
         J4zzVXCrm9pp18eHq5ONnQTOZWMy0ymmEQsZ9QwZHui1VLxEwRnCk7A1BBaEBu2q9sro
         WaE9vewr7RPscZ+5itvl5tiEB+ogGZ9bduU8Irlk2qOt7dH0PqH/uK3nln/e3ahIX6Vk
         Uf2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782570524; x=1783175324; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oj3Bc84dNDqEL3u/QBtsARL4xEy22u/Ty0I98NR0ywQ=;
        b=XC5p9FyUM3W6usuDrtgGdoPUDTfAMbIM6jlJDVqwblz5fLtTvo+diHPBlDGRtiCYvB
         cjB7m3IcPD+js5hYXI8xfjxuznRwDbtFF4yhVQDUjZEsF6DM/BM3wnc/eYAQq4M9w+U9
         6cE5D23kNS//wbTyhL03lvZKFOP3HV7y9dI6d2sQa78JfxgvF8Mupc7asriPOdvvaIqa
         Dl4mjTsRGxbu6k6+mTV+MInl0FHfW05Evptcx0/76noYPU5IlK02iNtKNAxhC25q3oW6
         dYF+P9Oct3bJncVtfmZg8a2CgF6L+/30TPT1GKNoIMc1CPa5oDyfAbjDIikwC72/LOmB
         fUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782570524; x=1783175324;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oj3Bc84dNDqEL3u/QBtsARL4xEy22u/Ty0I98NR0ywQ=;
        b=mNTtrcq/GMVd4F/rCJeaSCAXzg62zu+Aog466p6hBHNPPNb+gIDPH+fVeQ5K+OH0N6
         9Qb59UiWrVqGwUXO8Wv7X1yAXFm2FMIXNV0or6fTZXY0itC4PZwlqEee41JnDG2Z8UX9
         Gq2Btc1Z2bQJgakxepcKaZpEBQRzY05HJ6OW0X1sIGCoJTUZe7YH940KxI3c2uGCYiEi
         T/RnzzoVP7xDDvtMDlE/mO18yoJTCR440Cfnx3f6mwMnfxH+Z1jVYgUXq3uSSI1PqVy0
         9PRKJY3ih1IT02J1IsqzVoKP9KmhUv4ffuLx9XEjSYQ29ZT9GTq18FzyEFkD53CSI2rY
         2x9w==
X-Forwarded-Encrypted: i=1; AHgh+RoUNqSN05u6+uF0OOd50urr2BuLQUQk7ODT2jk/DfKeTUBusrDhamYbIbglIbgnas96Z+b+tJ+Fz0ek1tiiVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnHE+NOovA6UCZOVSDcjvnlg6OsmCbUzRqRknC2WNHHPdkRtc
	wuGwocWKtmU5kl1x0Gb6EpZtH4hsR9mvWRJ09xByBYANrqlZh3GtwhpQC1VEWEG8U9v/8tyuDg4
	9NrfHHrjhVv+BkzQSmtcqil7zxGvNZp8=
X-Gm-Gg: AfdE7cnAg118iPlmRsi5ykiI/rq8vCud4wuEvUqsRdi3VqhYqUt9H5xF9C1Ih+lDlI8
	Nh1oHAGZk6QT9nSMvmWqKaOH07xjp8bHNdODKMzK1ub85zahokCCD7bQtgXTiPkuKajbUaxEB38
	JejGAuyU6zVy0TA/mvR175R3lGDhTKm1/z5/Sj4UV+cRoy+DBns9hB4fmseRE9YlTmMjD56gDp8
	5/r+S/6AdPa5iFiNoL2C0YGThsn6YSt1XKQp6QmSZCBWkyVhOWXqmUf6bAcwUowOXFX6mxK8kE5
	anh+1WcgltFLPoADK/ihj+M+gCsjJ/38vmvFU0KwrsGCx0rL2KVRVYyUJ2qJnmfzZnFCyVMMiu9
	O22T9r4f93BBP
X-Received: by 2002:a05:7300:d517:b0:30b:6192:5b9 with SMTP id
 5a478bee46e88-30c84def54emr4756758eec.8.1782570523958; Sat, 27 Jun 2026
 07:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819003824.23019-1-contact@antoniohickey.com>
 <20250819003824.23019-2-contact@antoniohickey.com> <CANiq72mYBkEi2yAYjDa3vxNkROa7xp2bt88TFnbvHjPR59dXOg@mail.gmail.com>
 <38c93322-946d-4b7a-bd20-934c3c335f8c@antoniohickey.com>
In-Reply-To: <38c93322-946d-4b7a-bd20-934c3c335f8c@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 16:28:29 +0200
X-Gm-Features: AVVi8CeLqJmc2KLLxdMT9O10pVkNKb7LyMiMt2V_p8wNHuY6U7-l1__Zw8VN6Zo
Message-ID: <CANiq72kLfkGnuBEYiiATthXM-NPJhmqOrSBVSjF=4BCm9YLu1Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: kernel: create `overflow_assert!` macro
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 3:19=E2=80=AFPM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> I don't see any valid reason other than just naively missing this on my
> end, but I'll make sure my v6 reorders the tags as mentioned.

No worries :) I was just curious (i.e. sometimes when reviewing what
changed, it is hard to say if there was a reason why something did not
happen).

> As I'm re-reviewing my patch for a v6, what are your thought's on this
> example in the doc's of the macro?
>
> My main worry is the placeholder comments make the example seem
> incomplete, or are these kind of partial function examples normal?

I think it is fine, i.e. we aim for clarity, and I think the "proceed
to grow/append" is clear enough.

Of course, if you can think of a better example that is both complete
but small enough (i.e. without a lot of boilerplate), that is also
good.

Perhaps add a newline before that comment, so that it is even clearer
that it would be code that go after the early checks. Also the first
comment could perhaps be

    // If enabled, these will catch overflow errors early:"

(Maybe -- not a native speaker)

Thanks for coming back to this!

Cheers,
Miguel
