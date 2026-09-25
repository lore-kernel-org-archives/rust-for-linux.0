Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8CC3644A4
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347751; cv=pass; b=f9m9b23jdZ+5Ew8FMxJLdl2oplhdkJmUEjORwGlvg4vzgdXmEap1fRA+AqBVWN+8llTLuvDsqt+6zKeVyvJymmA1rNH4z0cGcnSj2vIW+7GNKaAa6rUNg4JPZQaL+6hZRPO2rrXGdud1pwYHIOmOcsAClDj+5elAq71GLJSKdug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347751; c=relaxed/simple;
	bh=WZnNp15iP53KOwKQKy8tNQAS3ibJG3jxA/o+ojXdF/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZbNZ8CYCRhUB4GZXvHNnMVgapxhMMA+onUhTEKbAs1RQRvwg9D/fpm6RzhZ3jNJSwNj3UUySADiNMQsJktZdqgm6DGHEZ5uNN/DYWkzYXubbpTWMp5WXIscpX2R9Kj8eScakJ1c/kgmA3JehDlk9oQZlq0MGZYx2y8URsEHQ6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQcReBlF; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQcReBlF"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34251480737so31130eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790347743; cv=none;
        d=google.com; s=arc-20260327;
        b=g033c3mqtYE7S7eZfN9l7mDG/6knaaBUAP5XSaopylypVLdROTeomU6C3wYDKyenq0
         bH21kT+YUxDa643a4KGsB7ylyg/tusbS6ZvvlMyIoFXlCFsByQtwDrHnfIxCLA0GBGbD
         +SQmZHWgipQm2VN7Cl0xRdWKyNVN5IEWCAs4y1ynbHFlXjQ/R8TbcXuKxS6KhQFZ8G2I
         vPk1YGD/lfNfUnljDBMBKT8XnH6VhDzZm2JuHFqaZTE2IBGwh1RRoeF+JF7zolg/bXop
         BMdacDgPd61K/yUogFqVJkbJyMuHfIbSwm84QOFqj/nGBuHDI2IbT3gC3k9W/r28dyan
         +vwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6vInZeSo9rLzAW9JhCktacPiFSn1CMhEJDoYPiNUuA=;
        fh=FnJGdH8UFbvjKZIDnBKPuvnKS6xa64uFDG3UfCztFcY=;
        b=XoJmnZm6cPu25TPne+tWh5V/pbo38Xc8hotUfifuMXZRytbpjRvsomYsv+taCa1RoM
         nwwr0KEARmEAFDs+amX/3gvwkCeRV9G6iPKSbFieN0qNRquUwxyUF8fI2MKJ7Z1V8xBu
         NZOiCcTRWQ15V4UnSsUP/Vv+N4QQh/Mtiq+hlIJ7EZ/sRjt+BgI3dXfFVNkvVWQL+Nqy
         MzYAzc76S7F7EpnmQN5knPt2vH4ePDJ0gddAeXl8FQYfxxUngI2QnfbGe0ireQlz5gW2
         NDYWW/8EP/tlg94deX1qHW5Zx3oMlmqHqPmiqPSRjjAf7SaQpGYN7TNHL2es5YB/hvEq
         v8oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790347743; x=1790952543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h6vInZeSo9rLzAW9JhCktacPiFSn1CMhEJDoYPiNUuA=;
        b=NQcReBlFL3RhOXlVSTBAyuFWdJEXfHGqIRDaJerGLCq2x1F9DGVazh9EfNvfqhNpJ6
         TJO21ckTlUkyoFWArtyJeniFY5Zdrw1NCP5kGEMjzPzOrfWmwbnN8P7E+qrLRCelXkqN
         OWcchhujfNpynCLe0NYCnH/A8AdH0FXnAMvmf1jyqmtLSVCSMCy0Ppdtj3fOX9bdGpYK
         4Op8FJjqoNdB6W5Pb9hQYQvWa5Mqyk4UHoFbry0G5V7t38N4nzozemotrWzZmoCfjQLI
         Q9y16ZckstfmD222l4YomB2gOzSh4nh3luzqjsJA62D78+xG5WYq1GFKYXetkiE6DS+A
         M8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790347743; x=1790952543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6vInZeSo9rLzAW9JhCktacPiFSn1CMhEJDoYPiNUuA=;
        b=W+W7+Jy588Olc/vo46TrwD1w8f1krmyRp4M+8l3zbuFbTHgoiybwFktSRZjAL2ICEZ
         2/MchBsNlyAV/KZF+cRMzVQVYSkHzo2fGXg9ih6iaxYIlshnkdgWWrkmP+SEd/W1q/oO
         W0sN0WOAMr0iUJ3U0tTY8Es9DXMDhePs9WbkDwZLcXaNPgGpr0iOyVuQcXKiQtTCUVpp
         FUEjTIv1mstfHM6ew4u7ohUvAevhtBfNJWC1Udo/3uK7voRfPmQcZGLKMe59+XR1ac4I
         Gxck2C1bif06AJ/RoF6Dqe+IKixeurw3UpokVQqvl/NlMSmlduEgKQ0FNgzB2mhAWx8o
         Xwnw==
X-Forwarded-Encrypted: i=1; AKwUvBw4f9lT8CLqaM7hifA0ySgqIkBiSAjptugTCoDC3UxBCJxUktjkaEo6N/tJr2yFWgAoZc1jyw9Uc7iZd5pulQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lFxOOV451/LGhu8KhRKmBINKYPYmaRRYXgSKJvk63+9RfaIxU6
	yOWqPV8WMBIAAbrKBKiXfpctIJ5/06tyEXzczMDpClFeLs+M5r+XjThLjf3UdfIbbRLyKv9CAf8
	IAr9UMU9SljI8u464MIQ69F8zM9osltomKXFK
X-Gm-Gg: AYBFou1Jemz/liSzK3DWUs4VUhrkBSh6FjLSEgSn60Q7Qhv1obr4o3AlaDEoWAZjawV
	edRnhQY3yILimuZkNYkLEjygSfXyld7dofZLtgrpGi5Jk+ZY20fhyDNsok4PKcNNiJxBPGJ52ov
	otWdMfD3z5MRCrFdWoTTq9jHgR2wVrmaHhfFYLnu/swPRtOAbcKLlOvCijub4vTYK9WvlliMClq
	pZfIPjYLQWSO1IDmOfkEbpW7aC/Qqbh/kAWymlLNr2PQLTU1ijxHzHUPUmeDqrjzuGXqqe+k1tc
	RdFOY3bHUIjyhf+RkvRnNH3XImxZH/3AcvEi4bHJkJWELgErrnc9wbpFplm81asV645473txFUD
	JRAwKuZjgk/zdW7wDiLr8R1luv4mvpTnTPZYIG/xPILlvUGs7UgblpNMWg3MJZFksHWG09IvJq6
	5dEDqVOFddgGbkFm84ggk6+1c/e2hPAlBunCYE6PiawZEVnUKYjCv7sHy6awTzoz8=
X-Received: by 2002:a05:7300:c3a6:b0:33b:e1f2:fa0d with SMTP id
 5a478bee46e88-3427246aceamr752100eec.2.1790347743191; Fri, 25 Sep 2026
 07:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
 <20260924232530.446588-3-tomo@flapping.org> <87zex52224.fsf@t14s.mail-host-address-is-not-set>
 <20260925.183924.808421603238938986.tomo@flapping.org>
In-Reply-To: <20260925.183924.808421603238938986.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 25 Sep 2026 16:48:49 +0200
X-Gm-Features: AclHuK8ZBbPvyfLLqDK_ncD0WBE14jrLMJK95H56rWY8QbrJl4lzschCX4qnqpo
Message-ID: <CANiq72=iYeD0AZCRb6X_1BMR1OBxGrzy6j45ZAq5C41+giG5dA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, gary@garyguo.net, ojeda@kernel.org, 
	acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 11:39=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org=
> wrote:
>
> I think that the reason is the kernel image size. From commit
> e74b7a3f5aee ("rust: tests: add Kconfig for KUnit test"):
>
>   All the tests are compiled unconditionally now, which adds ~200 kB to
>   the kernel image for me on x86_64. As Rust matures, this bloating will
>   inevitably grow.

Quick note on that commit: it wasn't really "unconditional", i.e. one
could still disable KUnit or make it `m` (I should have probably added
a note to that commit message...). But some maintainers prefer
fine-grained options, which is reasonable (though overdoing it may
mean a lot of Kconfig options that most users do not care about).

Cheers,
Miguel
