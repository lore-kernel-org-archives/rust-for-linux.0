Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A310E3
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771525309; cv=pass; b=fHKUZGquz5Lqv/datc3qikdU+Sqk1DoT3gpC6KRBak+ADsjUcZnQ62iXC4wOOMQvIcM/HKTiflCuZUngPEIWG0ELbpq3xUH3Rhn+4zhJrthkG3g6f6P7Z0awW/AaM3z4GSMsiJRY23pyOmQq9uFDGrLj97acTIkZk1LlVlAXkbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771525309; c=relaxed/simple;
	bh=dgJHI9snxdytU+3GmhayEdEGKcQ0qINXjz3gcxfeHjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dZJb+lP6zmmoHVgLII58O5jITA6ByA0KvfBiHQmwKU7Q0wDMzp2iz/lcEr0tHbuDe1s186DXF2GkbuX1GgyBAfjraSTdi4mxN8t/fhvaPgkaimfakm+dZEyLqRBX+lJjAX7FsDeU4iERZTG2JWGn4nnTm0Hc8A1v23CwH8BUF3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESYspwue; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESYspwue"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124a7216c9cso126050c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Feb 2026 10:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771525306; cv=none;
        d=google.com; s=arc-20240605;
        b=IXnPxDTES+Jpd8WsJNJc1oa6+Kac0IIasr3CB6jOum9LqeX0fxKFwKYIoJwJ4qmxKT
         3Ja8HBuBl/wor52AvL2SBHB4ab0O8qMlrmXdCruU7f0g6KHrN0/O2JAQZbdoEsqo+IHR
         F6oE70xISufKdAqPm/XQZPd2Gy3uPXb7Dbm5Ip7yJHg713FihH+oKa+h7o2GSs35Qv2w
         3XCwakrH3M8QgMvoRxXLoLQUYSHDhD1jdm17H4vBfUyvVJPzpkTvrNd6sEB140Lda7GH
         RrnvPQ5VYPQq+0XVToVXrHl3W+WpN6crig1vfZeqfmpfmA6/kJdCAk3uNVd9QYCw/pyq
         /ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FgE2S53jYPXZ9GIDCQFg6vwQPQ36fuRo1S4yJGAnCbw=;
        fh=vOWtnIkTGpY3PN5gF0k/rgr1IwQnLEhMBYzcl2QNnUM=;
        b=jHTXBuJjltNgbH8ZWbRSR+qDEGoVCvQeECzoY13Co8rfVZhXB8BS0K9vMbly6sdyA0
         Q5lXYjrCf+4rDcK5LtIZp3svYYMZOIzegDrM+ipcK17QsSETEOixbzddW6+gD0Aa+8ZO
         Jq6DK2hLyK8SX1Ff4Ikz8cAUgRw1JGSffdtHhaa35DVJlIcExSI+dVvs2uty4+SHwd15
         CJo6bRWUeNvBrK9cnO4gNJPXOsN4SOfkHI5AUrDQl5cWWDtj4dN0qh0DOYJO1fKaoCfG
         OjzM6fEe2jrM6AgDAL6TrDkX5ZaTlI3l9Tl91ueefHhaOvuEjkxqwSwi/427iU2jEX7Q
         0PIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771525306; x=1772130106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgE2S53jYPXZ9GIDCQFg6vwQPQ36fuRo1S4yJGAnCbw=;
        b=ESYspwue+LOvifnFVrTS9y0sBztQ6oS/5F8zEv+euTlBE7k1qyvmK3Dbu/0hDJWlFJ
         B+ppNSTAIGzYYTh6CFhXbsEXsZrKmpzSkmLL3qMGI4OCe7k5Bkgg7R7aFkKCdUy16U8D
         qRe5ScE3Hx8b2FQbzpbFOG3FGzv94xpKxfDrRtBewjCpOYJYQjb33stRgUrFNG8atjwb
         ShWobqjMjt+02Fj3mM1cqNalgI1VKXBn00ey9rQcElFkrFwbdkmothXDXixYpk1zvp95
         7CwYunqSkM4baiCbeBIgDOEnhFxZSq5dFlkeqWIszEAUmVuBLVvB1IPLU0bN3cUFie4t
         0KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771525306; x=1772130106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgE2S53jYPXZ9GIDCQFg6vwQPQ36fuRo1S4yJGAnCbw=;
        b=kK9pI3T6av/X+8OXjRhyLA2IyUUHhHsDGNXv1QM1a4lrrVt3FShAT8p6ZWnLMbFWJq
         1F2QNwp1jweiS5YdLP7OohIXBxI93EAU+4QOj2NxenaWAXgSsAWOrF2Ju6EEDk2H8rsf
         5K2LWwcr4vchQl7rEu+720zkbosrI5S0OtDCGKPohz4rVLZ+ajxhA/OT/nDBR0aAPmA/
         GLnBHoxXxupnCOJUYx59dE7uN9TCYYZZUl/Zn+1d3un9viwVdtKwGWAzzDFt5/CEf8GX
         W+wI3x4EWQxMD1tpsq+tW+zMK86RSrOIwdDoG6BQ3znFFFxxiyWV9J8QSSGg5b7we5I8
         2jfw==
X-Forwarded-Encrypted: i=1; AJvYcCV7EhgBQ9MjeWF503z+ToMk7+GPyvWH1AWi7VTZj/vBZgeRD4G+m0/1mI8P+tj96u2MXYQeKtK7jdK/byq06g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9oiMqJ6zOf2m4/hua/VMOoVLVaVsq1W38/4/K4oSHdDnXSMx
	wesYucYskWKPm5Dk0fCtMPtS9BmHSJH5cS2VzCq9nJObGXAGnB4aZppJvnQyBV40ylIqDrby6A8
	A8M6KbZ409Rj7lSBV7UEXhJe5LU3nd6Y=
X-Gm-Gg: AZuq6aLHSoP4BwvvDrj/xhYbj7y2KGJu/7DeoQ8kq3K8bdwzI4y/afdg+bpoP6jG4vF
	j4tgw1GgCzeIplEfh9+aS8kpc1wjr/PqgBI4Iaj4EJ8eNO6ihydTaS+Ie4rabV/0qyzLImNVOGt
	ysZbxQYuxpe3uc5G7N1H1nZWv8aTzs1ei7NkZRzf6h4qe968aZGLXNyNuwxqGP6vIr6bwLGfUmZ
	9pldqpV4bBpExOO8FfESYf/LpXBAOSuenKRhNuKbJjRIrFTsUOLah1EQTf46ywNZrilLvQLnFGU
	nmKupVD6nUAnoJkE7Eaoa6FmpjufeO2cE3lRY9pzi4MK3Orc+anjYgQv+XZGr8jPcwtdvK0sLYN
	QfzB0ALqwFfLqP0+gU7UjuY8L
X-Received: by 2002:a05:7300:e60c:b0:2ba:8204:3f81 with SMTP id
 5a478bee46e88-2baba0f8623mr5563965eec.9.1771525306395; Thu, 19 Feb 2026
 10:21:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216131613.45344-3-phasta@kernel.org>
In-Reply-To: <20260216131613.45344-3-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Feb 2026 19:21:34 +0100
X-Gm-Features: AaiRm53mdbj9iMyTwWczfecm9VLxe_fOFL__qbVKSsEs8kKHbe9xW22UYVL04zI
Message-ID: <CANiq72mMzRop4aF4b62CcbqW=ey+ykse4gya36txAbhLDG+Khw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: list: Add unsafe for container_of
To: Philipp Stanner <phasta@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 2:17=E2=80=AFPM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Hmm... Where do these Reviewed-by's come from?

Ah, I see them now -- a copy of this patch was moved into another series:

  https://lore.kernel.org/rust-for-linux/20260203081403.68733-3-phasta@kern=
el.org/

I understand it was an RFC series, and perhaps you didn't intend to
land the patch, so addressing the previous feedback wasn't important
for the patch series.

Nevertheless, a note about it would have been nice -- we weren't Cc'd
for some reason, and there was no notification about the move nor a
link to the previous version.

I see Gary and Alice pointed out feedback that I had already given
before -- that is why it is important to mention that this was not the
first version of the patch or better, mention that there was feedback
yet to be addressed. Otherwise, reviewers may end up mentioning again
the same feedback, just like it happened here.

> +                // SAFETY: The caller must guarantee that `links_field` =
is a valid pointer of type
> +                // ListLinks.
> +                let container =3D unsafe { $crate::container_of!(

> +                // SAFETY: By the same reasoning above, `links_field` is=
 a valid pointer.
> +                let container =3D unsafe { $crate::container_of!(

I don't think these two comments justify the requirement of
`container_of!`, which is:

    /// # Safety
    ///
    /// The pointer passed to this macro, and the pointer returned by
this macro, must both be in
    /// bounds of the same allocation.

i.e. even if `links_field` is valid, it could still be UB.

By the way, the "Reviewed-by" tags don't really apply to the `//
SAFETY:` comments, so I would have probably dropped

To make progress to get the build fix done, and to avoid dropping
those tags, I think I will apply the fix without the comments. Then
please feel free to send the safety comments separately, which can be
iterated independently. (In fact, we may want to reorganize a bit the
safety comments within the macro...).

Sounds good to everyone?

(The formatting is also still not right -- this was pointed out by at
least a couple people now. Anyway, I will fix it myself.).

Cheers,
Miguel
